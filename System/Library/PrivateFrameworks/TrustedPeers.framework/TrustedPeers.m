LABEL_7:
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = -[TPPolicy modelToCategory](self, "modelToCategory", 0LL);
  v5 = (__CFString *)[v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    v7 = *(void *)v14;
    while (2)
    {
      for (i = 0LL; i != v5; i = (__CFString *)((char *)i + 1))
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v6);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        [v9 prefix];
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = [v4 hasPrefix:v10];

        if ((v11 & 1) != 0)
        {
          [v9 category];
          v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
          goto LABEL_17;
        }
      }

      v5 = (__CFString *)[v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

      v5 = 0LL;
      goto LABEL_12;
    }

    [(id)v34[5] intersectSet:v17];
    v20 = [(id)v34[5] count];
    TPModelLog();
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    v21 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
    if (!v20)
    {
      if (v21)
      {
        *(_WORD *)v39 = 0;
        _os_log_impl( &dword_188398000,  v19,  OS_LOG_TYPE_DEFAULT,  "possibleSponsorsForRecoveryKey: no sponsors, no distrust",  v39,  2u);
      }

      goto LABEL_7;
    }

    if (v21)
    {
      v22 = v34[5];
      *(_DWORD *)v39 = 138543362;
      v40 = v22;
      _os_log_impl( &dword_188398000,  v19,  OS_LOG_TYPE_DEFAULT,  "possibleSponsorsForRecoveryKey: returning %{public}@",  v39,  0xCu);
    }

    v5 = (id)v34[5];
  }

      v5 = 0LL;
      goto LABEL_12;
    }

    [(id)v34[5] intersectSet:v14];
    v19 = [(id)v34[5] count];
    TPModelLog();
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    v20 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    if (!v19)
    {
      if (v20)
      {
        *(_WORD *)v39 = 0;
        _os_log_impl( &dword_188398000,  v16,  OS_LOG_TYPE_DEFAULT,  "possibleSponsorsForCustodianRecoveryKey: no sponsors, no distrust",  v39,  2u);
      }

      goto LABEL_7;
    }

    if (v20)
    {
      [v12 uuid];
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      [v12 peerID];
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v34[5];
      *(_DWORD *)v39 = 138543874;
      v40 = v21;
      v41 = 2114;
      v42 = v22;
      v43 = 2114;
      v44 = v23;
      _os_log_impl( &dword_188398000,  v16,  OS_LOG_TYPE_DEFAULT,  "possibleSponsorsForCustodianRecoveryKey: CRK %{public}@/%{public}@ returning %{public}@",  v39,  0x20u);
    }

    v5 = (id)v34[5];
  }
}

LABEL_17:
LABEL_18:
  return v5;
}

  [v3 addObject:@"ancient"];
  a1 &= ~0x10uLL;
  if ((a1 & 0x20) == 0)
  {
LABEL_8:
    if ((a1 & 0x80) == 0) {
      goto LABEL_9;
    }
LABEL_19:
    [v3 addObject:@"ignored"];
    a1 &= ~0x80uLL;
    if ((a1 & 0x40) == 0)
    {
LABEL_10:
      if (!a1) {
        goto LABEL_22;
      }
      goto LABEL_21;
    }

    goto LABEL_20;
  }

  return v6;
}

LABEL_14:
  v21 = objc_alloc(&OBJC_CLASS___TPSyncingPolicy);
  v22 = -[TPPolicy version](self, "version");
  v23 = -[TPPolicy keyViewMapping](self, "keyViewMapping");
  LOBYTE(v26) = a5;
  v24 = -[TPSyncingPolicy initWithModel:version:viewList:priorityViews:userControllableViews:syncUserControllableViews:viewsToPiggybackTLKs:keyViewMapping:isInheritedAccount:]( v21,  "initWithModel:version:viewList:priorityViews:userControllableViews:syncUserControllableViews:viewsToPiggybackT LKs:keyViewMapping:isInheritedAccount:",  v10,  v22,  v11,  v18,  v12,  v8,  v13,  v23,  v26);

LABEL_16:
  return v24;
}

uint64_t TPPBDictionaryMatchingRuleFieldExistsReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x189611CF0];
  v4 = (int *)MEMORY[0x189611CE8];
  v5 = (int *)MEMORY[0x189611CE0];
  if (*(void *)(a2 + (int)*MEMORY[0x189611CF0]) < *(void *)(a2 + (int)*MEMORY[0x189611CE8]))
  {
    v7 = (int *)MEMORY[0x189611CD8];
    do
    {
      if (*(_BYTE *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0LL;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1LL || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(_BYTE *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0LL;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }

      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5)) {
        unint64_t v10 = 0LL;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3))
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result) {
          return result;
        }
      }

      else
      {
        uint64_t v18 = PBReaderReadString();
        v19 = *(void **)(a1 + 8);
        *(void *)(a1 + 8) = v18;
      }
    }

    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }

  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL TPPBDispositionUnknownReasonRemovalMachineIDReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x189611CF0];
  v4 = (int *)MEMORY[0x189611CE8];
  v5 = (int *)MEMORY[0x189611CE0];
  v6 = (int *)MEMORY[0x189611CD8];
  while (1)
  {
    int v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
      return v7 == 0;
    }
    if (*(_BYTE *)(a2 + *v5))
    {
      int v7 = 1;
      return v7 == 0;
    }

    char v8 = 0;
    unsigned int v9 = 0;
    uint64_t v10 = 0LL;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1LL || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(_BYTE *)(*(void *)(a2 + *v6) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      if (v9++ >= 9)
      {
        LOBYTE(v10) = 0;
        int v7 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }

    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    int v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5)) {
      LOBYTE(v10) = 0;
    }
LABEL_14:
    if (v7) {
      BOOL v15 = 1;
    }
    else {
      BOOL v15 = (v10 & 7) == 4;
    }
    if (v15) {
      return v7 == 0;
    }
    if ((PBReaderSkipValueWithTag() & 1) == 0) {
      return 0LL;
    }
  }
}

void sub_18839CCF8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
}

void sub_18839CEF8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_18839D114( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

LABEL_25:
        v24 = v13;
LABEL_26:

        goto LABEL_27;
      }

      if (!v19) {
        goto LABEL_25;
      }
      *(_DWORD *)buf = 138543362;
      v29 = v9;
      v20 = "peer(%{public}@) stable info didn't actually change";
    }

    v21 = v18;
    v22 = 12;
    goto LABEL_24;
  }

  if (v11)
  {
    if (a5) {
      *a5 = v11;
    }
  }

  else
  {
    failWithNoPeerWithIDError(a5);
  }

  TPModelLog();
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v29 = v9;
    v30 = 2114;
    v31 = v12;
    _os_log_impl( &dword_188398000,  (os_log_t)v14,  OS_LOG_TYPE_DEFAULT,  "can't update stable info for peerID %{public}@: %{public}@",  buf,  0x16u);
  }

  char v13 = 0LL;
LABEL_27:

  return v13;
}

        v24 = v13;
LABEL_26:

        goto LABEL_27;
      }

      if (!v19) {
        goto LABEL_25;
      }
      *(_DWORD *)buf = 138543362;
      v29 = v9;
      v20 = "peer(%{public}@) dynamic info didn't actually change";
    }

    v21 = v18;
    v22 = 12;
    goto LABEL_24;
  }

  if (v11)
  {
    if (a5) {
      *a5 = v11;
    }
  }

  else
  {
    failWithNoPeerWithIDError(a5);
  }

  TPModelLog();
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v29 = v9;
    v30 = 2114;
    v31 = v12;
    _os_log_impl( &dword_188398000,  (os_log_t)v14,  OS_LOG_TYPE_DEFAULT,  "can't update dynamic info for peerID %{public}@: %{public}@",  buf,  0x16u);
  }

  char v13 = 0LL;
LABEL_27:

  return v13;
}

  v30 = v15;

  v41 = v15;
  unint64_t v12 = v36;
  uint64_t v11 = v37;
  v31 = -[TPModel considerPolicyFromPeerID:stableInfo:secrets:newestPolicyDoc:error:]( self,  "considerPolicyFromPeerID:stableInfo:secrets:newestPolicyDoc:error:",  v37,  v36,  v40,  &v41,  v35);
  BOOL v15 = v41;

  if (!v31) {
    goto LABEL_32;
  }
  if (!v15)
  {
    if (v35)
    {
      [MEMORY[0x189607870] errorWithDomain:TPErrorDomain code:3 userInfo:0];
      BOOL v15 = 0LL;
      v29 = 0LL;
      *v35 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_33;
    }

    BOOL v15 = 0LL;
LABEL_32:
    v29 = 0LL;
    goto LABEL_33;
  }
  v32 = -[TPModel decrypter](self, "decrypter");
  [v15 policyWithSecrets:v40 decrypter:v32 error:v35];
  v29 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_33:
  uint64_t v10 = v34;
LABEL_34:

LABEL_35:
  return v29;
}

void sub_18839DA08( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_18839DCC4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
}

void sub_18839DF54( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_18839E0B4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_18839E260( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_18839E3E0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_18839E560( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

LABEL_21:
  _Block_object_dispose(&v28, 8);
  return v14;
}

      v29 = 0;
      goto LABEL_27;
    }

    if (!v32)
    {
      if (v57)
      {
        v40 = (void *)MEMORY[0x189607870];
        v41 = TPErrorDomain;
        v67[0] = @"peerID";
        v67[1] = @"policyVersion";
        v68[0] = v59;
        v42 = (void *)MEMORY[0x189607968];
        [v13 bestPolicyVersion];
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "numberWithUnsignedLongLong:", objc_msgSend(v43, "versionNumber"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v68[1] = v44;
        [MEMORY[0x189603F68] dictionaryWithObjects:v68 forKeys:v67 count:2];
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        [v40 errorWithDomain:v41 code:1 userInfo:v45];
        *v57 = (id)objc_claimAutoreleasedReturnValue();
      }

      goto LABEL_21;
    }

    [v32 version];
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    [v34 policyHash];
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 bestPolicyVersion];
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    [v36 policyHash];
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v32;
    v39 = [v35 isEqualToString:v37];

    if ((v39 & 1) != 0)
    {
      *v24 = v38;
      v29 = 1;
    }

    else
    {
      if (v57)
      {
        v53 = TPErrorDomain;
        v54 = (void *)MEMORY[0x189607870];
        v66[0] = v59;
        v65[0] = @"peerID";
        v65[1] = @"policyVersion";
        v46 = (void *)MEMORY[0x189607968];
        [v13 bestPolicyVersion];
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "numberWithUnsignedLongLong:", objc_msgSend(v56, "versionNumber"));
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v66[1] = v55;
        v65[2] = @"policyDocHash";
        [v38 version];
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        [v47 policyHash];
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v66[2] = v48;
        v65[3] = @"peerExpectsHash";
        [v13 bestPolicyVersion];
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        [v49 policyHash];
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v66[3] = v50;
        [MEMORY[0x189603F68] dictionaryWithObjects:v66 forKeys:v65 count:4];
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        [v54 errorWithDomain:v53 code:2 userInfo:v51];
        *v57 = (id)objc_claimAutoreleasedReturnValue();

        v32 = v38;
        v29 = 0;
LABEL_26:
        v33 = 0LL;
        goto LABEL_27;
      }

      v29 = 0;
    }

    v32 = v38;
    goto LABEL_26;
  }

  v29 = 1;
  unint64_t v12 = v59;
LABEL_28:

  return v29;
}
  }

  else if (a4)
  {
    [MEMORY[0x189607870] errorWithDomain:@"CKKSMatcherError" code:2 description:@"No 'and' subrules present"];
    v19 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v19 = 0;
  }

  return v19;
}

void sub_18839E9E0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_18839F0B4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_18839FD4C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_1883A0828( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
}

LABEL_59:
  [v216 setByAddingObjectsFromSet:v214];
  v194 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPModel filterPreapprovals:forExistingPeers:](v217, "filterPreapprovals:forExistingPeers:", v195, v194);
  v199 = (id)objc_claimAutoreleasedReturnValue();
  TPModelLog();
  v64 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  v65 = os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT);
  if (v199)
  {
    if (v65)
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v199;
      _os_log_impl(&dword_188398000, v64, OS_LOG_TYPE_DEFAULT, "Error filtering preapprovals: %{public}@", buf, 0xCu);
    }

    if (a14)
    {
      v199 = v199;
      v29 = 0LL;
      *a14 = v199;
      goto LABEL_268;
    }

    goto LABEL_90;
  }

  if (v65)
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&buf[4] = v195;
    _os_log_impl(&dword_188398000, v64, OS_LOG_TYPE_DEFAULT, "Final preapproval list: %{public}@", buf, 0xCu);
  }

  v264 = 0u;
  v265 = 0u;
  v262 = 0u;
  v263 = 0u;
  [v195 allObjects];
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = (id)[v66 countByEnumeratingWithState:&v262 objects:v286 count:16];
  if (!v67)
  {
    v199 = 0LL;
    goto LABEL_92;
  }

  v199 = 0LL;
  v68 = *(void *)v263;
  do
  {
    for (k = 0LL; k != v67; k = (char *)k + 1)
    {
      if (*(void *)v263 != v68) {
        objc_enumerationMutation(v66);
      }
      v70 = *(void *)(*((void *)&v262 + 1) + 8LL * (void)k);
      v71 = +[TPHashBuilder algoOfHash:](&OBJC_CLASS___TPHashBuilder, "algoOfHash:", v70);
      if (v71 == -1) {
        continue;
      }

      *(void *)buf = 0LL;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000LL;
      v284 = __Block_byref_object_copy_;
      *(void *)&v285 = __Block_byref_object_dispose_;
      *((void *)&v285 + 1) = 0LL;
      v253[0] = MEMORY[0x1895F87A8];
      v253[1] = 3221225472LL;
      v253[2] = __198__TPModel_calculateDynamicInfoFromModel_peer_peerPermanentInfo_peerStableInfo_startingDynamicInfo_addingPeerIDs_removingPeerIDs_preapprovedKeys_signingKeyPair_currentMachineIDs_sponsorPeerID_error___block_invoke;
      v253[3] = &unk_18A22BC28;
      v253[4] = v70;
      v253[5] = v217;
      v260 = v71;
      v261 = v212;
      v254 = v216;
      v259 = buf;
      v255 = v214;
      v256 = v222;
      v257 = v215;
      v258 = v195;
      v252 = 0LL;
      -[TPModel enumeratePeersUsingBlock:error:](v217, "enumeratePeersUsingBlock:error:", v253, &v252);
      v199 = v252;
      if (v199)
      {
        TPModelLog();
        v72 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v281 = 138543362;
          v282 = v199;
          _os_log_impl(&dword_188398000, v72, OS_LOG_TYPE_DEFAULT, "Error enumerating peers: %{public}@", v281, 0xCu);
        }

        if (a14)
        {
          v73 = v199;
LABEL_82:
          v76 = 0;
          *a14 = v73;
          goto LABEL_85;
        }

        return 0LL;
      case 7u:
        PBReaderReadString();
        v24 = (TPPBPolicyModelToCategory *)objc_claimAutoreleasedReturnValue();
        if (v24) {
          [(id)a1 addUserControllableViews:v24];
        }
        goto LABEL_43;
      case 8u:
        PBReaderReadString();
        v24 = (TPPBPolicyModelToCategory *)objc_claimAutoreleasedReturnValue();
        if (v24) {
          [(id)a1 addPiggybackViews:v24];
        }
        goto LABEL_43;
      case 9u:
        PBReaderReadString();
        v24 = (TPPBPolicyModelToCategory *)objc_claimAutoreleasedReturnValue();
        if (v24) {
          [(id)a1 addPriorityViews:v24];
        }
        goto LABEL_43;
      case 0xAu:
        PBReaderReadString();
        v24 = (TPPBPolicyModelToCategory *)objc_claimAutoreleasedReturnValue();
        if (v24) {
          [(id)a1 addInheritedExcludedViews:v24];
        }
        goto LABEL_43;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result) {
          return result;
        }
        goto LABEL_44;
    }
  }

LABEL_83:
        v76 = 0;
        goto LABEL_85;
      }

      if (*(void *)(*(void *)&buf[8] + 40LL))
      {
        TPModelLog();
        v74 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
        {
          v75 = *(void **)(*(void *)&buf[8] + 40LL);
          *(_DWORD *)v281 = 138543362;
          v282 = v75;
          _os_log_impl( &dword_188398000,  v74,  OS_LOG_TYPE_DEFAULT,  "Error recursively expanding peers: %{public}@",  v281,  0xCu);
        }

        if (a14)
        {
          v73 = 0LL;
          goto LABEL_82;
        }

        goto LABEL_83;
      }

      v76 = 1;
LABEL_85:

      _Block_object_dispose(buf, 8);
      if (!v76)
      {

LABEL_90:
        v29 = 0LL;
        goto LABEL_268;
      }
    }

    v67 = (id)[v66 countByEnumeratingWithState:&v262 objects:v286 count:16];
  }

  while (v67);
LABEL_92:

  [v216 minusSet:v214];
  TPModelLog();
  v77 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = v216;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v214;
    _os_log_impl( &dword_188398000,  v77,  OS_LOG_TYPE_DEFAULT,  "After preapproval checking: included:%{public}@ excluded:%{public}@",  buf,  0x16u);
  }

  [v204 permanentInfo];
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  [v78 modelID];
  v191 = (void *)objc_claimAutoreleasedReturnValue();

  if (([v191 containsString:@"AppleTV"] & 1) != 0
    || [v191 containsString:@"AudioAccessory"])
  {
    TPModelLog();
    v79 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_188398000, v79, OS_LOG_TYPE_DEFAULT, "Ignoring TDL Disallowed Machine IDs", buf, 2u);
    }

    [MEMORY[0x189604010] set];
    v80 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v80 = -[TPModel filterPeerList:byMachineIDs:sponsorPeerID:dispositions:]( v217,  "filterPeerList:byMachineIDs:sponsorPeerID:dispositions:",  v216,  v215,  v202,  v222);
  }

  v190 = v80;
  v189 = -[TPModel filterPeerList:byMachineIDs:sponsorPeerID:dispositions:]( v217,  "filterPeerList:byMachineIDs:sponsorPeerID:dispositions:",  v214,  v215,  v202,  v222);
  if ([v216 count] != 1 || (objc_msgSend(v216, "containsObject:", v210) & 1) == 0)
  {
    [v216 minusSet:v190];
    [v214 unionSet:v190];
    [v214 unionSet:v189];
  }

  if (v202)
  {
    TPModelLog();
    v81 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_188398000,  v81,  OS_LOG_TYPE_DEFAULT,  "Joining using a sponsor! Opting not to kick out past selves yet.",  buf,  2u);
    }

    goto LABEL_106;
  }

  [v201 machineID];
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v101 = [v100 length] == 0;

  if (v101)
  {
    TPModelLog();
    v81 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_188398000, v81, OS_LOG_TYPE_DEFAULT, "No local machine ID; not filtering peers", buf, 2u);
    }

LABEL_106:
  }

  else
  {
    contexta = (void *)MEMORY[0x1895C3FC8]();
    [v201 machineID];
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    v251 = 0LL;
    -[TPModel peersWithMachineID:error:](v217, "peersWithMachineID:error:", v102, &v251);
    v67 = (id)objc_claimAutoreleasedReturnValue();
    v192 = v251;

    if (v192)
    {

      objc_autoreleasePoolPop(contexta);
      v29 = 0LL;
      if (a14) {
        *a14 = v192;
      }
      goto LABEL_267;
    }

    v168 = (void *)[v67 mutableCopy];
    [v168 removeObject:v210];
    TPModelLog();
    v169 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v169, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v168;
      _os_log_impl( &dword_188398000,  v169,  OS_LOG_TYPE_DEFAULT,  "Remote peers with the ego machine ID: %{public}@",  buf,  0xCu);
    }

    [v216 minusSet:v168];
    [v214 unionSet:v168];
    v249 = 0u;
    v250 = 0u;
    v247 = 0u;
    v248 = 0u;
    v170 = v168;
    v171 = [v170 countByEnumeratingWithState:&v247 objects:v280 count:16];
    if (v171)
    {
      v172 = *(void *)v248;
      do
      {
        for (m = 0LL; m != v171; ++m)
        {
          if (*(void *)v248 != v172) {
            objc_enumerationMutation(v170);
          }
          v174 = *(void *)(*((void *)&v247 + 1) + 8 * m);
          [v222 objectForKeyedSubscript:v174];
          v175 = (void *)objc_claimAutoreleasedReturnValue();
          v176 = v175;
          if (v175)
          {
            v177 = v175;
          }

          else
          {
            v177 = objc_alloc_init(&OBJC_CLASS___TPPBDisposition);
          }

          v178 = objc_alloc_init(&OBJC_CLASS___TPPBDispositionDuplicateMachineID);
          -[TPPBDisposition setDuplicateMachineID:](v177, "setDuplicateMachineID:", v178);

          [v222 setObject:v177 forKeyedSubscript:v174];
        }

        v171 = [v170 countByEnumeratingWithState:&v247 objects:v280 count:16];
      }

      while (v171);
    }

    objc_autoreleasePoolPop(contexta);
  }

  TPModelLog();
  v82 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = v216;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v214;
    _os_log_impl( &dword_188398000,  v82,  OS_LOG_TYPE_DEFAULT,  "After machine ID checking: included:%{public}@ excluded:%{public}@",  buf,  0x16u);
  }

  v245 = 0u;
  v246 = 0u;
  v243 = 0u;
  v244 = 0u;
  v207 = v216;
  v83 = [v207 countByEnumeratingWithState:&v243 objects:v279 count:16];
  if (v83)
  {
    v67 = *(id *)v244;
    do
    {
      v84 = 0LL;
      do
      {
        if (*(id *)v244 != v67) {
          objc_enumerationMutation(v207);
        }
        v85 = *(void *)(*((void *)&v243 + 1) + 8 * v84);
        [v222 objectForKeyedSubscript:v85];
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        v87 = v86;
        if (v86)
        {
          if ([v86 hasUnknownMachineID])
          {
            v88 = objc_alloc_init(&OBJC_CLASS___TPPBDisposition);

            [v87 unknownMachineID];
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            -[TPPBDisposition setUnknownMachineID:](v88, "setUnknownMachineID:", v89);

            if ([v87 hasEvictedMachineID])
            {
              if (v88)
              {
                v90 = v88;
                goto LABEL_121;
              }

LABEL_120:
              v90 = objc_alloc_init(&OBJC_CLASS___TPPBDisposition);
LABEL_121:
              v88 = v90;

              [v87 evictedMachineID];
              v91 = (void *)objc_claimAutoreleasedReturnValue();
              -[TPPBDisposition setEvictedMachineID:](v88, "setEvictedMachineID:", v91);
            }

            if ([v87 hasUnknownReasonRemovalMachineID])
            {
              if (v88)
              {
                v92 = v88;
                goto LABEL_127;
              }

LABEL_126:
              v92 = objc_alloc_init(&OBJC_CLASS___TPPBDisposition);
LABEL_127:
              v88 = v92;

              [v87 unknownReasonRemovalMachineID];
              v93 = (void *)objc_claimAutoreleasedReturnValue();
              -[TPPBDisposition setUnknownReasonRemovalMachineID:](v88, "setUnknownReasonRemovalMachineID:", v93);
            }

            if ([v87 hasGhostedMachineID])
            {
              if (v88)
              {
                v94 = v88;
                goto LABEL_133;
              }

LABEL_132:
              v94 = objc_alloc_init(&OBJC_CLASS___TPPBDisposition);
LABEL_133:
              v88 = v94;

              [v87 ghostedMachineID];
              v95 = (void *)objc_claimAutoreleasedReturnValue();
              -[TPPBDisposition setGhostedMachineID:](v88, "setGhostedMachineID:", v95);
            }
          }

          else
          {
            if ([v87 hasEvictedMachineID]) {
              goto LABEL_120;
            }
            if ([v87 hasUnknownReasonRemovalMachineID]) {
              goto LABEL_126;
            }
            if ([v87 hasGhostedMachineID]) {
              goto LABEL_132;
            }
            v88 = 0LL;
          }

          [v222 setObject:v88 forKeyedSubscript:v85];
        }

        ++v84;
      }

      while (v83 != v84);
      v96 = [v207 countByEnumeratingWithState:&v243 objects:v279 count:16];
      v83 = v96;
    }

    while (v96);
  }

  v242 = 0LL;
  context = -[TPModel policyForPeerIDs:candidatePeerID:candidateStableInfo:error:]( v217,  "policyForPeerIDs:candidatePeerID:candidateStableInfo:error:",  v207,  v210,  v205,  &v242);
  v97 = v242;
  if (v97)
  {
    TPModelLog();
    v98 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v97;
      _os_log_impl( &dword_188398000,  v98,  OS_LOG_TYPE_DEFAULT,  "ignoring error getting policy for peerIDs %{public}@",  buf,  0xCu);
    }
  }

  if (context && ([context unknownRedactions] & 1) == 0)
  {
    if (v205)
    {
      [context version];
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      v104 = [v103 versionNumber];
      [v205 flexiblePolicyVersion];
      v67 = (id)objc_claimAutoreleasedReturnValue();
      v99 = v104 == [v67 versionNumber];
    }

    else
    {
      v99 = 1;
    }
  }

  else
  {
    v99 = 0;
  }

  v240 = 0u;
  v241 = 0u;
  v238 = 0u;
  v239 = 0u;
  v237 = 0LL;
  v105 = -[TPModel allPolicyVersionsWithError:](v217, "allPolicyVersionsWithError:", &v237);
  v192 = v237;
  v106 = [v105 countByEnumeratingWithState:&v238 objects:v278 count:16];
  if (v106)
  {
    v107 = *(void *)v239;
    do
    {
      for (n = 0LL; n != v106; ++n)
      {
        if (*(void *)v239 != v107) {
          objc_enumerationMutation(v105);
        }
        v109 = *(void **)(*((void *)&v238 + 1) + 8 * n);
        v110 = [v109 versionNumber];
        [context version];
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        v112 = v110 <= [v111 versionNumber];

        v113 = [v109 versionNumber];
        [context version];
        v67 = (id)objc_claimAutoreleasedReturnValue();
        v99 &= v112;
        if (v113 == [v67 versionNumber])
        {
          [v109 policyHash];
          v114 = (void *)objc_claimAutoreleasedReturnValue();
          [context version];
          v115 = (void *)objc_claimAutoreleasedReturnValue();
          v116 = [v115 policyHash];
          v117 = (void *)v116;
          if (v116) {
            v118 = (const __CFString *)v116;
          }
          else {
            v118 = &stru_18A22C748;
          }
          v119 = [v114 isEqualToString:v118];

          v99 &= v119;
        }

        else
        {
        }
      }

      v106 = [v105 countByEnumeratingWithState:&v238 objects:v278 count:16];
    }

    while (v106);
  }

  if (v192)
  {
    v29 = 0LL;
    if (a14) {
      *a14 = v192;
    }
    goto LABEL_266;
  }

  if (v99)
  {
    [MEMORY[0x189603FE0] setWithSet:v206];
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    [v120 minusSet:v207];
    [v120 minusSet:v214];
    TPModelLog();
    v121 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v121, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v120;
      _os_log_impl( &dword_188398000,  v121,  OS_LOG_TYPE_DEFAULT,  "Unknown peers, distrusting by default: %{public}@",  buf,  0xCu);
    }

    [v214 unionSet:v120];
  }

  else
  {
    TPModelLog();
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v120, OS_LOG_TYPE_DEFAULT))
    {
      [v205 bestPolicyVersion];
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      v123 = [v122 versionNumber];
      *(_DWORD *)buf = 138544130;
      *(void *)&buf[4] = v210;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v123;
      *(_WORD *)&buf[22] = 2114;
      v284 = (uint64_t (*)(uint64_t, uint64_t))context;
      LOWORD(v285) = 2114;
      *(void *)((char *)&v285 + 2) = 0LL;
      _os_log_impl( &dword_188398000,  (os_log_t)v120,  OS_LOG_TYPE_DEFAULT,  "Peer (%{public}@) is using an unknown policy version (%llu, %{public}@), not distrusting unknown peers (error: %{public}@)",  buf,  0x2Au);
    }
  }

  if ([v214 containsObject:v210])
  {
    TPModelLog();
    v124 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v124, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_188398000, v124, OS_LOG_TYPE_DEFAULT, "Peer distrusts self", buf, 2u);
    }

    v236 = 0LL;
    v125 = -[TPModel untrustedPeerIDsWithError:](v217, "untrustedPeerIDsWithError:", &v236);
    v126 = v236;
    v127 = v126;
    if (v126)
    {
      v29 = 0LL;
      if (a14) {
        *a14 = v126;
      }
      goto LABEL_265;
    }

    [v125 setByAddingObjectsFromSet:v214];
    v179 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v206 isSubsetOfSet:v179])
    {
      TPModelLog();
      v180 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v180, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( &dword_188398000,  v180,  OS_LOG_TYPE_DEFAULT,  "Update would result in zero trusted peers; failing",
          buf,
          2u);
      }

      if (a14)
      {
        v181 = (void *)MEMORY[0x189607870];
        v182 = TPErrorDomain;
        v276 = *MEMORY[0x1896075E0];
        v277 = @"Update would result in no trusted peers";
        [MEMORY[0x189603F68] dictionaryWithObjects:&v277 forKeys:&v276 count:1];
        v183 = (void *)objc_claimAutoreleasedReturnValue();
        [v181 errorWithDomain:v182 code:11 userInfo:v183];
        v29 = 0LL;
        *a14 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_263;
      }

      v29 = 0LL;
    }

    else
    {
      [MEMORY[0x189604010] setWithArray:v208];
      v183 = (void *)objc_claimAutoreleasedReturnValue();
      [MEMORY[0x189604010] setWithObject:v210];
      v184 = (void *)objc_claimAutoreleasedReturnValue();
      -[TPModel createDynamicInfoWithIncludedPeerIDs:excludedPeerIDs:dispositions:preapprovals:signingKeyPair:error:]( v217,  "createDynamicInfoWithIncludedPeerIDs:excludedPeerIDs:dispositions:preapprovals:signingKeyPair:error:",  v183,  v184,  v222,  v195,  v200,  a14);
      v29 = (id)objc_claimAutoreleasedReturnValue();

LABEL_263:
    }

LABEL_265:
    goto LABEL_266;
  }

  v235[0] = MEMORY[0x1895F87A8];
  v235[1] = 3221225472LL;
  v235[2] = __198__TPModel_calculateDynamicInfoFromModel_peer_peerPermanentInfo_peerStableInfo_startingDynamicInfo_addingPeerIDs_removingPeerIDs_preapprovedKeys_signingKeyPair_currentMachineIDs_sponsorPeerID_error___block_invoke_79;
  v235[3] = &unk_18A22BC50;
  v235[4] = v217;
  v235[5] = v212;
  [v214 objectsPassingTest:v235];
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  v193 = (void *)[v128 mutableCopy];

  v233 = 0u;
  v234 = 0u;
  v231 = 0u;
  v232 = 0u;
  v129 = v214;
  v130 = [v129 countByEnumeratingWithState:&v231 objects:v275 count:16];
  if (!v130) {
    goto LABEL_210;
  }
  v213 = *(void *)v232;
  while (2)
  {
    v131 = 0LL;
    while (2)
    {
      if (*(void *)v232 != v213) {
        objc_enumerationMutation(v129);
      }
      v132 = *(void *)(*((void *)&v231 + 1) + 8 * v131);
      v133 = (void *)MEMORY[0x1895C3FC8]();
      v230 = 0LL;
      v134 = -[TPModel peerWithID:error:](v217, "peerWithID:error:", v132, &v230);
      v135 = v230;
      if (v135)
      {
        v67 = v135;
        TPModelLog();
        v136 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v136, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = v132;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v67;
          v137 = v136;
          v138 = "Error finding excluded peer %{public}@: %{public}@";
          v139 = 22;
          goto LABEL_193;
        }

        goto LABEL_194;
      }

      [v134 stableInfo];
      v67 = (id)objc_claimAutoreleasedReturnValue();
      [v67 recoverySigningPublicKey];
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      v141 = v140 == 0LL;

      if (!v141)
      {
        [v134 stableInfo];
        v142 = (void *)objc_claimAutoreleasedReturnValue();
        [v142 recoverySigningPublicKey];
        v143 = (void *)objc_claimAutoreleasedReturnValue();
        v229 = 0LL;
        v144 = -[TPModel isRecoveryKeyExcluded:error:](v217, "isRecoveryKeyExcluded:error:", v143, &v229);
        v67 = v229;

        if (v67)
        {
          TPModelLog();
          v136 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v136, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            *(void *)&buf[4] = v67;
            v137 = v136;
            v138 = "Error determining whether recovery key is excluded: %{public}@";
            v139 = 12;
LABEL_193:
            _os_log_impl(&dword_188398000, v137, OS_LOG_TYPE_DEFAULT, v138, buf, v139);
          }

          goto LABEL_194;
        }

        if (!v144)
        {
          v228 = 0LL;
          -[TPModel allTrustedPeersWithCurrentRecoveryKeyWithError:]( v217,  "allTrustedPeersWithCurrentRecoveryKeyWithError:",  &v228);
          v136 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          v67 = v228;
          if (v67)
          {
            TPModelLog();
            v145 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v145, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              *(void *)&buf[4] = v67;
              _os_log_impl( &dword_188398000,  v145,  OS_LOG_TYPE_DEFAULT,  "Error finding peers with current recovery key: %{public}@",  buf,  0xCu);
            }
          }

          else
          {
            if (-[os_log_s count](v136, "count"))
            {
              v67 = 0LL;
              goto LABEL_194;
            }

            [v134 stableInfo];
            v146 = (void *)objc_claimAutoreleasedReturnValue();
            [v146 recoverySigningPublicKey];
            v147 = (void *)objc_claimAutoreleasedReturnValue();
            -[TPModel recoveryKeyPeerID:](v217, "recoveryKeyPeerID:", v147);
            v145 = (os_log_s *)objc_claimAutoreleasedReturnValue();

            [v193 addObject:v145];
          }

LABEL_194:
        }
      }

      objc_autoreleasePoolPop(v133);
      if (v130 != ++v131) {
        continue;
      }
      break;
    }

    v148 = [v129 countByEnumeratingWithState:&v231 objects:v275 count:16];
    v130 = v148;
    if (v148) {
      continue;
    }
    break;
  }

LABEL_210:
  v226 = 0u;
  v227 = 0u;
  v224 = 0u;
  v225 = 0u;
  v149 = v129;
  v150 = [v149 countByEnumeratingWithState:&v224 objects:v274 count:16];
  if (!v150) {
    goto LABEL_229;
  }
  v151 = *(void *)v225;
  while (2)
  {
    v152 = 0LL;
    while (2)
    {
      if (*(void *)v225 != v151) {
        objc_enumerationMutation(v149);
      }
      v153 = *(void **)(*((void *)&v224 + 1) + 8 * v152);
      if (([v153 containsString:@"RK-"] & 1) != 0
        || (-[TPModel allCustodianRecoveryKeyPeerIDs](v217, "allCustodianRecoveryKeyPeerIDs"),
            v154 = (void *)objc_claimAutoreleasedReturnValue(),
            v155 = [v154 containsObject:v153],
            v154,
            (v155 & 1) != 0))
      {
        v67 = 0LL;
        goto LABEL_218;
      }

      v223 = 0LL;
      v156 = -[TPModel peerWithID:error:](v217, "peerWithID:error:", v153, &v223);
      v67 = v223;

      if (!v156)
      {
        TPModelLog();
        v157 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        v158 = os_log_type_enabled(v157, OS_LOG_TYPE_DEFAULT);
        if (v67)
        {
          if (v158)
          {
            *(_DWORD *)buf = 138543618;
            *(void *)&buf[4] = v153;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v67;
            v159 = v157;
            v160 = "Error finding peer %{public}@ in model, removing: %{public}@";
            v161 = 22;
            goto LABEL_226;
          }
        }

        else if (v158)
        {
          *(_DWORD *)buf = 138543362;
          *(void *)&buf[4] = v153;
          v159 = v157;
          v160 = "Peer %{public}@ not registered in the model, removing";
          v161 = 12;
LABEL_226:
          _os_log_impl(&dword_188398000, v159, OS_LOG_TYPE_DEFAULT, v160, buf, v161);
        }

        [v193 removeObject:v153];
      }

LABEL_218:
      if (v150 != ++v152) {
        continue;
      }
      break;
    }

    v162 = [v149 countByEnumeratingWithState:&v224 objects:v274 count:16];
    v150 = v162;
    if (v162) {
      continue;
    }
    break;
  }

LABEL_229:
  [v211 includedPeerIDs];
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  [v211 excludedPeerIDs];
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v195
    || ([v211 preapprovals],
        v67 = (id)objc_claimAutoreleasedReturnValue(),
        ([v195 isEqual:v67] & 1) != 0))
  {
    [v211 dispositions];
    v186 = (void *)objc_claimAutoreleasedReturnValue();
    v187 = [v222 isEqualToDictionary:v186];

    if (v195)
    {

      if ((v187 & 1) == 0) {
        goto LABEL_236;
      }
    }

    else
    {

      if (!v187) {
        goto LABEL_236;
      }
    }

    TPModelLog();
    v188 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v188, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_188398000,  v188,  OS_LOG_TYPE_DEFAULT,  "Analysis didn't actually change anything, returning old dynamicInfo",  buf,  2u);
    }

    v29 = v211;
  }

  else
  {

LABEL_234:
LABEL_235:

LABEL_236:
    TPModelLog();
    v165 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v165, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v207;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v193;
      _os_log_impl( &dword_188398000,  v165,  OS_LOG_TYPE_DEFAULT,  "After exclusion filtering: included:%{public}@ excluded:%{public}@",  buf,  0x16u);
    }
    v166 = -[TPModel createDynamicInfoWithIncludedPeerIDs:excludedPeerIDs:dispositions:preapprovals:signingKeyPair:error:]( v217,  "createDynamicInfoWithIncludedPeerIDs:excludedPeerIDs:dispositions:preapprovals:signingKeyPair:error:",  v207,  v193,  v222,  v195,  v200,  a14);
    TPModelLog();
    v167 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v167, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v166;
      _os_log_impl(&dword_188398000, v167, OS_LOG_TYPE_DEFAULT, "Returning new dynamicinfo: %{public}@", buf, 0xCu);
    }

    v29 = v166;
  }

LABEL_266:
LABEL_267:

LABEL_268:
  v61 = v199;
LABEL_269:

LABEL_270:
LABEL_271:

  return v29;
}

void sub_1883A3410(_Unwind_Exception *a1)
{
}

void sub_1883A3D7C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

LABEL_26:
  _Block_object_dispose(&v58, 8);
  return v42;
}

void sub_1883A4510( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, char a35)
{
}

LABEL_11:
  return v19;
}
}

  return v6;
}

  return v18;
}

LABEL_18:
        objc_autoreleasePoolPop(v17);
      }

      v33 = [obj countByEnumeratingWithState:&v35 objects:v44 count:16];
      if (!v33)
      {
LABEL_20:

        uint64_t v10 = v28;
        char v13 = v28;
        unsigned int v9 = v26;
        char v8 = v27;
        goto LABEL_22;
      }
    }
  }

  unint64_t v12 = v11;
  if (a5)
  {
    unint64_t v12 = v11;
    char v13 = 0LL;
    *a5 = v12;
  }

  else
  {
    char v13 = 0LL;
  }
  }

  _Block_object_dispose(v32, 8);
  _Block_object_dispose(&v34, 8);

  objc_autoreleasePoolPop(context);
  v17 = v22;
  if ((v9 & 1) == 0 && a3 && v22)
  {
    *a3 = v22;
    v17 = v22;
  }

  return v9;
}

  [v3 stableInfo];
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    v32 = v8;
    [v3 stableInfo];
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    [v33 recoverySigningPublicKey];
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(v42 + 48) recoverySigningPubKey];
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v34 isEqualToData:v35])
    {
      [v3 stableInfo];
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      [v36 recoveryEncryptionPublicKey];
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      [*(id *)(v42 + 48) recoveryEncryptionPubKey];
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = [v37 isEqualToData:v38];

      char v8 = v32;
      if (v39) {
        [*(id *)(*(void *)(*(void *)(v42 + 64) + 8) + 40) addObject:v32];
      }
    }

    else
    {

      char v8 = v32;
    }
  }
}

  [v3 addObject:@"unknown"];
  a1 &= ~0x20uLL;
  if ((a1 & 0x80) != 0) {
    goto LABEL_19;
  }
LABEL_9:
  if ((a1 & 0x40) == 0) {
    goto LABEL_10;
  }
LABEL_20:
  [v3 addObject:@"self"];
  a1 &= ~0x40uLL;
  if (a1)
  {
LABEL_21:
    objc_msgSend(NSString, "stringWithFormat:", @"extra: %lx", a1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 addObject:v4];
  }

LABEL_22:
  return v13;
}

  [v3 allObjects];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 sortedArrayUsingSelector:sel_compare_];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 componentsJoinedByString:@"|"];
  int v7 = (void *)objc_claimAutoreleasedReturnValue();

  [NSString stringWithFormat:@"(%@)", v7];
  char v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void sub_1883A568C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_1883A5A6C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, char a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, char a27)
{
}

void sub_1883A5F88( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
}

void sub_1883A6218( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
}

void sub_1883A651C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

LABEL_12:
  _Block_object_dispose(buf, 8);
  objc_autoreleasePoolPop(context);
  if (v18)
  {
    v5 = 0LL;
    if (a5) {
      *a5 = v18;
    }
  }

  _Block_object_dispose(&v33, 8);

  return v5;
}

  _Block_object_dispose(buf, 8);
  objc_autoreleasePoolPop(context);
  if (v15)
  {
    v5 = 0LL;
    if (a5) {
      *a5 = v15;
    }
  }

  _Block_object_dispose(&v33, 8);

  return v5;
}

  return v5;
}

    char v8 = 0;
  }

void sub_1883A6930( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_1883A7268( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, char a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, char a31)
{
}

void sub_1883A7CD8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, char a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, char a37)
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

LABEL_8:
}

LABEL_15:
}

  [v3 addObject:@"excluded"];
  a1 &= ~4uLL;
  if ((a1 & 8) == 0)
  {
LABEL_6:
    if ((a1 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }

LABEL_16:
        ++v13;
      }

      while (v11 != v13);
      uint64_t v11 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
    }

    while (v11);
  }

  [v3 addObject:@"outdated"];
  a1 &= ~8uLL;
  if ((a1 & 0x10) == 0)
  {
LABEL_7:
    if ((a1 & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }

void failWithNoPeerWithIDError(void *a1)
{
  v6[1] = *MEMORY[0x1895F89C0];
  if (a1)
  {
    v2 = (void *)MEMORY[0x189607870];
    uint64_t v3 = TPErrorDomain;
    uint64_t v5 = *MEMORY[0x1896075E0];
    v6[0] = @"No peer for given peerID";
    [MEMORY[0x189603F68] dictionaryWithObjects:v6 forKeys:&v5 count:1];
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 errorWithDomain:v3 code:7 userInfo:v4];
    *a1 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_9:
}

LABEL_19:
  if (v10)
  {
    TPModelLog();
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = *(void *)(a1 + 32);
      *(_DWORD *)v37 = 138543618;
      *(void *)&v37[4] = v4;
      *(_WORD *)&v37[12] = 2114;
      *(void *)&v37[14] = v23;
      _os_log_impl( &dword_188398000,  v22,  OS_LOG_TYPE_DEFAULT,  "status: peer %{public}@ excludes %{public}@",  v37,  0x16u);
    }

    *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) |= 4uLL;
  }

  objc_msgSend(v3, "permanentInfo", *(_OWORD *)v37, *(void *)&v37[16], v38);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = [v24 epoch];
  [*(id *)(a1 + 40) permanentInfo];
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = [v26 epoch];

  if (v25 > v27)
  {
    TPModelLog();
    v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v29 = *(void *)(a1 + 32);
      *(_DWORD *)v37 = 138543618;
      *(void *)&v37[4] = v4;
      *(_WORD *)&v37[12] = 2114;
      *(void *)&v37[14] = v29;
      _os_log_impl( &dword_188398000,  v28,  OS_LOG_TYPE_DEFAULT,  "status: peer %{public}@ outdates %{public}@",  v37,  0x16u);
    }

    *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) |= 8uLL;
  }

  [v3 permanentInfo];
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = [v30 epoch];
  [*(id *)(a1 + 40) permanentInfo];
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = [v32 epoch] + 1;

  if (v31 > v33)
  {
    TPModelLog();
    v34 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      v35 = *(void *)(a1 + 32);
      *(_DWORD *)v37 = 138543618;
      *(void *)&v37[4] = v4;
      *(_WORD *)&v37[12] = 2114;
      *(void *)&v37[14] = v35;
      _os_log_impl( &dword_188398000,  v34,  OS_LOG_TYPE_DEFAULT,  "status: peer %{public}@ far outdates %{public}@",  v37,  0x16u);
    }

    v14 = *(void *)(*(void *)(a1 + 56) + 8LL);
    BOOL v15 = *(void *)(v14 + 24) | 0x10LL;
    goto LABEL_31;
  }

LABEL_32:
}

id TPPeerStatusToString(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = v2;
  if (!a1)
  {
    [v2 addObject:@"none_set"];
    goto LABEL_22;
  }

  if ((a1 & 1) != 0)
  {
    [v2 addObject:@"partial"];
    a1 &= ~1uLL;
    if ((a1 & 2) == 0)
    {
LABEL_4:
      if ((a1 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_15;
    }
  }

  else if ((a1 & 2) == 0)
  {
    goto LABEL_4;
  }

  [v3 addObject:@"full"];
  a1 &= ~2uLL;
  if ((a1 & 4) == 0)
  {
LABEL_5:
    if ((a1 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }

LABEL_10:
  return v5;
}

  return v5;
}

uint64_t TPPBPeerStableInfoSettingReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x189611CF0];
  v4 = (int *)MEMORY[0x189611CE8];
  uint64_t v5 = (int *)MEMORY[0x189611CE0];
  if (*(void *)(a2 + (int)*MEMORY[0x189611CF0]) < *(void *)(a2 + (int)*MEMORY[0x189611CE8]))
  {
    int v7 = (int *)MEMORY[0x189611CD8];
    do
    {
      if (*(_BYTE *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0LL;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1LL || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(_BYTE *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0LL;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }

      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5)) {
        unint64_t v10 = 0LL;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 2)
      {
        char v23 = 0;
        unsigned int v24 = 0;
        uint64_t v25 = 0LL;
        *(_BYTE *)(a1 + 20) |= 2u;
        while (1)
        {
          uint64_t v26 = *v3;
          unint64_t v27 = *(void *)(a2 + v26);
          if (v27 == -1LL || v27 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v28 = *(_BYTE *)(*(void *)(a2 + *v7) + v27);
          *(void *)(a2 + v26) = v27 + 1;
          v25 |= (unint64_t)(v28 & 0x7F) << v23;
          if ((v28 & 0x80) == 0) {
            goto LABEL_41;
          }
          v23 += 7;
          BOOL v14 = v24++ >= 9;
          if (v14)
          {
            uint64_t v25 = 0LL;
            goto LABEL_43;
          }
        }

        *(_BYTE *)(a2 + *v5) = 1;
LABEL_41:
        if (*(_BYTE *)(a2 + *v5)) {
          uint64_t v25 = 0LL;
        }
LABEL_43:
        *(_BYTE *)(a1 + 16) = v25 != 0;
      }

      else if ((v10 >> 3) == 1)
      {
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0LL;
        *(_BYTE *)(a1 + 20) |= 1u;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1LL || v21 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v22 = *(_BYTE *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            goto LABEL_37;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            uint64_t v19 = 0LL;
            goto LABEL_39;
          }
        }

        *(_BYTE *)(a2 + *v5) = 1;
LABEL_37:
        if (*(_BYTE *)(a2 + *v5)) {
          uint64_t v19 = 0LL;
        }
LABEL_39:
        *(void *)(a1 + _Block_object_dispose(va, 8) = v19;
      }

      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result) {
          return result;
        }
      }
    }

    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }

  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1883AD814( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
}

CFStringRef TPMachineIDStatusToString(unint64_t a1)
{
  if (a1 > 5) {
    return @"allowed";
  }
  else {
    return off_18A22BF10[a1];
  }
}

BOOL TPPBPolicyRedactionAuthenticatedCiphertextReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x189611CF0];
  v4 = (int *)MEMORY[0x189611CE8];
  uint64_t v5 = (int *)MEMORY[0x189611CE0];
  if (*(void *)(a2 + (int)*MEMORY[0x189611CF0]) < *(void *)(a2 + (int)*MEMORY[0x189611CE8]))
  {
    int v7 = (int *)MEMORY[0x189611CD8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5)) {
        return *(_BYTE *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0LL;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1LL || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(_BYTE *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0LL;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }

      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5)) {
        unint64_t v10 = 0LL;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(_BYTE *)(a2 + *v5) == 0;
      }
      unint64_t v17 = v10 >> 3;
      if ((_DWORD)v17 == 2)
      {
        uint64_t v18 = PBReaderReadData();
        uint64_t v19 = 8LL;
        goto LABEL_24;
      }

      if ((_DWORD)v17 == 1)
      {
        uint64_t v18 = PBReaderReadData();
        uint64_t v19 = 16LL;
LABEL_24:
        uint64_t v20 = *(void **)(a1 + v19);
        *(void *)(a1 + v19) = v18;

        goto LABEL_26;
      }

      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0LL;
      }
LABEL_26:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(_BYTE *)(a2 + *v5) == 0;
      }
    }

    uint64_t v18 = PBReaderReadData();
    uint64_t v19 = 24LL;
    goto LABEL_24;
  }

  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL TPPBDictionaryMatchingRuleFieldRegexMatchReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x189611CF0];
  v4 = (int *)MEMORY[0x189611CE8];
  uint64_t v5 = (int *)MEMORY[0x189611CE0];
  if (*(void *)(a2 + (int)*MEMORY[0x189611CF0]) < *(void *)(a2 + (int)*MEMORY[0x189611CE8]))
  {
    int v7 = (int *)MEMORY[0x189611CD8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5)) {
        return *(_BYTE *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0LL;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1LL || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(_BYTE *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0LL;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }

      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5)) {
        unint64_t v10 = 0LL;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(_BYTE *)(a2 + *v5) == 0;
      }
      if (!(v10 >> 3))
      {
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 8LL;
LABEL_22:
        uint64_t v19 = *(void **)(a1 + v18);
        *(void *)(a1 + v1_Block_object_dispose((const void *)(v17 - 112), 8) = v17;

        goto LABEL_24;
      }

      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0LL;
      }
LABEL_24:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(_BYTE *)(a2 + *v5) == 0;
      }
    }

    uint64_t v17 = PBReaderReadString();
    uint64_t v18 = 16LL;
    goto LABEL_22;
  }

  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t TPPBDictionaryMatchingRuleReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x189611CF0];
  v4 = (int *)MEMORY[0x189611CE8];
  uint64_t v5 = (int *)MEMORY[0x189611CE0];
  int v7 = (int *)MEMORY[0x189611CD8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5)) {
      return *(_BYTE *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0LL;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1LL || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(_BYTE *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v14 = v9++ >= 9;
      if (v14)
      {
        unint64_t v10 = 0LL;
        int v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }

    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    int v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5)) {
      unint64_t v10 = 0LL;
    }
LABEL_14:
    if (v15 || (v10 & 7) == 4) {
      return *(_BYTE *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 0u:
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0LL;
        *(_BYTE *)(a1 + 52) |= 1u;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1LL || v21 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v22 = *(_BYTE *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            goto LABEL_43;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_45;
          }
        }

        *(_BYTE *)(a2 + *v5) = 1;
LABEL_43:
        if (*(_BYTE *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_45:
        *(_DWORD *)(a1 + 4_Block_object_dispose((const void *)(v17 - 112), 8) = v19;
        goto LABEL_40;
      case 1u:
        unsigned int v24 = objc_alloc_init(&OBJC_CLASS___TPPBDictionaryMatchingRule);
        [(id)a1 addAnd:v24];
        goto LABEL_31;
      case 2u:
        unsigned int v24 = objc_alloc_init(&OBJC_CLASS___TPPBDictionaryMatchingRule);
        [(id)a1 addOr:v24];
        goto LABEL_31;
      case 3u:
        unsigned int v24 = objc_alloc_init(&OBJC_CLASS___TPPBDictionaryMatchingRule);
        objc_storeStrong((id *)(a1 + 32), v24);
LABEL_31:
        goto LABEL_39;
      case 4u:
        unsigned int v24 = objc_alloc_init(&OBJC_CLASS___TPPBDictionaryMatchingRuleFieldRegexMatch);
        objc_storeStrong((id *)(a1 + 24), v24);
        goto LABEL_39;
      case 5u:
        unsigned int v24 = objc_alloc_init(&OBJC_CLASS___TPPBDictionaryMatchingRuleFieldExists);
        objc_storeStrong((id *)(a1 + 16), v24);
        if (PBReaderPlaceMark()
          && (TPPBDictionaryMatchingRuleFieldExistsReadFrom((uint64_t)v24, a2) & 1) != 0)
        {
LABEL_39:
          PBReaderRecallMark();

LABEL_40:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(_BYTE *)(a2 + *v5) == 0;
          }
          continue;
        }

LABEL_47:
        return 0LL;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result) {
          return result;
        }
        goto LABEL_40;
    }
  }

BOOL TPPBSecureElementIdentityReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x189611CF0];
  v4 = (int *)MEMORY[0x189611CE8];
  uint64_t v5 = (int *)MEMORY[0x189611CE0];
  if (*(void *)(a2 + (int)*MEMORY[0x189611CF0]) < *(void *)(a2 + (int)*MEMORY[0x189611CE8]))
  {
    int v7 = (int *)MEMORY[0x189611CD8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5)) {
        return *(_BYTE *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0LL;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1LL || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(_BYTE *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0LL;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }

      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5)) {
        unint64_t v10 = 0LL;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(_BYTE *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadData();
        uint64_t v18 = 16LL;
LABEL_22:
        uint64_t v19 = *(void **)(a1 + v18);
        *(void *)(a1 + v1_Block_object_dispose((const void *)(v17 - 112), 8) = v17;

        goto LABEL_24;
      }

      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0LL;
      }
LABEL_24:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(_BYTE *)(a2 + *v5) == 0;
      }
    }

    uint64_t v17 = PBReaderReadData();
    uint64_t v18 = 8LL;
    goto LABEL_22;
  }

  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL TPPBPolicyKeyViewMappingReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x189611CF0];
  v4 = (int *)MEMORY[0x189611CE8];
  uint64_t v5 = (int *)MEMORY[0x189611CE0];
  if (*(void *)(a2 + (int)*MEMORY[0x189611CF0]) < *(void *)(a2 + (int)*MEMORY[0x189611CE8]))
  {
    int v7 = (int *)MEMORY[0x189611CD8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5)) {
        return *(_BYTE *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0LL;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1LL || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(_BYTE *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0LL;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }

      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5)) {
        unint64_t v10 = 0LL;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(_BYTE *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = objc_alloc_init(&OBJC_CLASS___TPPBDictionaryMatchingRule);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (!PBReaderPlaceMark() || (TPPBDictionaryMatchingRuleReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0LL;
        }

        PBReaderRecallMark();
        goto LABEL_24;
      }

      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0LL;
      }
LABEL_26:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(_BYTE *)(a2 + *v5) == 0;
      }
    }

    uint64_t v18 = PBReaderReadString();
    uint64_t v17 = *(TPPBDictionaryMatchingRule **)(a1 + 16);
    *(void *)(a1 + 16) = v18;
LABEL_24:

    goto LABEL_26;
  }

  return *(_BYTE *)(a2 + *v5) == 0;
}

id signingOperation()
{
  if (signingOperation_onceToken != -1) {
    dispatch_once(&signingOperation_onceToken, &__block_literal_global_1155);
  }
  return (id)signingOperation_op;
}

void __signingOperation_block_invoke()
{
  id v3 = (id)[objc_alloc(MEMORY[0x189612710]) initWithCurve:4];
  id v0 = objc_alloc_init(MEMORY[0x189612728]);
  uint64_t v1 = [objc_alloc(MEMORY[0x189612720]) initWithKeySpecifier:v3 digestOperation:v0];
  v2 = (void *)signingOperation_op;
  signingOperation_op = v1;
}

BOOL TPPBDispositionDuplicateMachineIDReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x189611CF0];
  v4 = (int *)MEMORY[0x189611CE8];
  uint64_t v5 = (int *)MEMORY[0x189611CE0];
  v6 = (int *)MEMORY[0x189611CD8];
  while (1)
  {
    int v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
      return v7 == 0;
    }
    if (*(_BYTE *)(a2 + *v5))
    {
      int v7 = 1;
      return v7 == 0;
    }

    char v8 = 0;
    unsigned int v9 = 0;
    uint64_t v10 = 0LL;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1LL || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(_BYTE *)(*(void *)(a2 + *v6) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      if (v9++ >= 9)
      {
        LOBYTE(v10) = 0;
        int v7 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }

    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    int v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5)) {
      LOBYTE(v10) = 0;
    }
LABEL_14:
    if (v7) {
      BOOL v15 = 1;
    }
    else {
      BOOL v15 = (v10 & 7) == 4;
    }
    if (v15) {
      return v7 == 0;
    }
    if ((PBReaderSkipValueWithTag() & 1) == 0) {
      return 0LL;
    }
  }

uint64_t checkTypesafeSignature(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  unsigned int v11 = atomic_load((unsigned int *)&gSigCount);
  if (v11 != -1)
  {
    do
      unsigned int v12 = __ldaxr((unsigned int *)&gSigCount);
    while (__stlxr(v12 + 1, (unsigned int *)&gSigCount));
  }

  char v13 = (void *)MEMORY[0x1895C3FC8]();
  prefixedData(v9, v10);
  BOOL v14 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = [v7 checkSignature:v8 matchesData:v14];

  objc_autoreleasePoolPop(v13);
  return v15;
}

id prefixedData(void *a1, void *a2)
{
  id v3 = a1;
  [a2 dataUsingEncoding:4];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = (void *)[v4 mutableCopy];

  [v5 appendData:v3];
  return v5;
}

id typesafeSignature(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  id v10 = (void *)MEMORY[0x1895C3FC8]();
  prefixedData(v8, v9);
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue();
  id v15 = 0LL;
  [v7 signatureForData:v11 withError:&v15];
  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue();
  id v13 = v15;

  objc_autoreleasePoolPop(v10);
  if (a4 && v13) {
    *a4 = v13;
  }

  return v12;
}

void startTrackingCheckSigCount()
{
}

void stopTrackingCheckSigCount()
{
}

uint64_t checkSigCount()
{
  return atomic_load((unsigned int *)&gSigCount);
}

id TPModelLog()
{
  if (TPModelLog_onceToken != -1) {
    dispatch_once(&TPModelLog_onceToken, &__block_literal_global_1332);
  }
  return (id)TPModelLog_log;
}

void __TPModelLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.security.trustedpeers", "model");
  uint64_t v1 = (void *)TPModelLog_log;
  TPModelLog_log = (uint64_t)v0;
}

id TPClassificationLog()
{
  if (TPClassificationLog_onceToken != -1) {
    dispatch_once(&TPClassificationLog_onceToken, &__block_literal_global_3);
  }
  return (id)TPClassificationLog_log;
}

void __TPClassificationLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.security.trustedpeers", "classification");
  uint64_t v1 = (void *)TPClassificationLog_log;
  TPClassificationLog_log = (uint64_t)v0;
}

uint64_t SetAllowiProdOverride(uint64_t result)
{
  AllowiProdOverrideValue = result;
  AllowiProdOverrideSet = 1;
  return result;
}

uint64_t AllowiProdOverride()
{
  if (AllowiProdOverrideSet == 1) {
    return AllowiProdOverrideValue;
  }
  else {
    return _os_feature_enabled_impl();
  }
}

BOOL TPBecomeiProdOverride()
{
  if (gTPBecomeiProdOverrideStatus) {
    return gTPBecomeiProdOverrideStatus == 1;
  }
  if (TPBecomeiProdOverride_onceToken != -1) {
    dispatch_once(&TPBecomeiProdOverride_onceToken, &__block_literal_global_7);
  }
  return TPBecomeiProdOverride_ffTPBecomeiProdOverrideStatus != 0;
}

void __TPBecomeiProdOverride_block_invoke()
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  TPBecomeiProdOverride_ffTPBecomeiProdOverrideStatus = _os_feature_enabled_impl();
  TPModelLog();
  os_log_t v0 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    if (TPBecomeiProdOverride_ffTPBecomeiProdOverrideStatus) {
      uint64_t v1 = "enabled";
    }
    else {
      uint64_t v1 = "disabled";
    }
    int v2 = 136315138;
    id v3 = v1;
    _os_log_impl( &dword_188398000,  v0,  OS_LOG_TYPE_DEFAULT,  "BecomeiProd Status set via feature flag to %s",  (uint8_t *)&v2,  0xCu);
  }
}

void TPSetBecomeiProdOverride(int a1)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  if (a1) {
    int v2 = 1;
  }
  else {
    int v2 = 2;
  }
  gTPBecomeiProdOverrideStatus = v2;
  TPModelLog();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = "disabled";
    if (a1) {
      uint64_t v4 = "enabled";
    }
    int v5 = 136315138;
    v6 = v4;
    _os_log_impl(&dword_188398000, v3, OS_LOG_TYPE_DEFAULT, "BecomeiProd Status overridden to %s", (uint8_t *)&v5, 0xCu);
  }
}

void TPClearBecomeiProdOverride()
{
  gTPBecomeiProdOverrideStatus = 0;
  TPModelLog();
  os_log_t v0 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl(&dword_188398000, v0, OS_LOG_TYPE_DEFAULT, "BecomeiProd Status override removed", v1, 2u);
  }
}

BOOL TPBecomeAppleTVOverride()
{
  if (gTPBecomeAppleTVOverrideStatus) {
    return gTPBecomeAppleTVOverrideStatus == 1;
  }
  if (TPBecomeAppleTVOverride_onceToken != -1) {
    dispatch_once(&TPBecomeAppleTVOverride_onceToken, &__block_literal_global_11);
  }
  return TPBecomeAppleTVOverride_ffTPBecomeAppleTVOverrideStatus != 0;
}

void __TPBecomeAppleTVOverride_block_invoke()
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  TPBecomeAppleTVOverride_ffTPBecomeAppleTVOverrideStatus = _os_feature_enabled_impl();
  TPModelLog();
  os_log_t v0 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    if (TPBecomeAppleTVOverride_ffTPBecomeAppleTVOverrideStatus) {
      uint64_t v1 = "enabled";
    }
    else {
      uint64_t v1 = "disabled";
    }
    int v2 = 136315138;
    id v3 = v1;
    _os_log_impl( &dword_188398000,  v0,  OS_LOG_TYPE_DEFAULT,  "BecomeAppleTV Status set via feature flag to %s",  (uint8_t *)&v2,  0xCu);
  }
}

void TPSetBecomeAppleTVOverride(int a1)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  if (a1) {
    int v2 = 1;
  }
  else {
    int v2 = 2;
  }
  gTPBecomeAppleTVOverrideStatus = v2;
  TPModelLog();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = "disabled";
    if (a1) {
      uint64_t v4 = "enabled";
    }
    int v5 = 136315138;
    v6 = v4;
    _os_log_impl( &dword_188398000,  v3,  OS_LOG_TYPE_DEFAULT,  "BecomeAppleTV Status overridden to %s",  (uint8_t *)&v5,  0xCu);
  }
}

void TPClearBecomeAppleTVOverride()
{
  gTPBecomeAppleTVOverrideStatus = 0;
  TPModelLog();
  os_log_t v0 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl(&dword_188398000, v0, OS_LOG_TYPE_DEFAULT, "BecomeAppleTV Status override removed", v1, 2u);
  }
}

BOOL TPPBDispositionEntryReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x189611CF0];
  uint64_t v4 = (int *)MEMORY[0x189611CE8];
  int v5 = (int *)MEMORY[0x189611CE0];
  if (*(void *)(a2 + (int)*MEMORY[0x189611CF0]) < *(void *)(a2 + (int)*MEMORY[0x189611CE8]))
  {
    uint64_t v7 = (int *)MEMORY[0x189611CD8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5)) {
        return *(_BYTE *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0LL;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1LL || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(_BYTE *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0LL;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }

      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5)) {
        unint64_t v10 = 0LL;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(_BYTE *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = *(TPPBDisposition **)(a1 + 16);
        *(void *)(a1 + 16) = v17;
LABEL_24:

        goto LABEL_26;
      }

      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0LL;
      }
LABEL_26:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(_BYTE *)(a2 + *v5) == 0;
      }
    }

    uint64_t v18 = objc_alloc_init(&OBJC_CLASS___TPPBDisposition);
    objc_storeStrong((id *)(a1 + 8), v18);
    if (!PBReaderPlaceMark() || !TPPBDispositionReadFrom((id *)&v18->super.super.isa, a2))
    {

      return 0LL;
    }

    PBReaderRecallMark();
    goto LABEL_24;
  }

  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL TPPBDispositionDisallowedMachineIDReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x189611CF0];
  uint64_t v4 = (int *)MEMORY[0x189611CE8];
  int v5 = (int *)MEMORY[0x189611CE0];
  v6 = (int *)MEMORY[0x189611CD8];
  while (1)
  {
    int v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
      return v7 == 0;
    }
    if (*(_BYTE *)(a2 + *v5))
    {
      int v7 = 1;
      return v7 == 0;
    }

    char v8 = 0;
    unsigned int v9 = 0;
    uint64_t v10 = 0LL;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1LL || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(_BYTE *)(*(void *)(a2 + *v6) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      if (v9++ >= 9)
      {
        LOBYTE(v10) = 0;
        int v7 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }

    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    int v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5)) {
      LOBYTE(v10) = 0;
    }
LABEL_14:
    if (v7) {
      BOOL v15 = 1;
    }
    else {
      BOOL v15 = (v10 & 7) == 4;
    }
    if (v15) {
      return v7 == 0;
    }
    if ((PBReaderSkipValueWithTag() & 1) == 0) {
      return 0LL;
    }
  }

BOOL TPPBAncientEpochReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x189611CF0];
  uint64_t v4 = (int *)MEMORY[0x189611CE8];
  int v5 = (int *)MEMORY[0x189611CE0];
  if (*(void *)(a2 + (int)*MEMORY[0x189611CF0]) < *(void *)(a2 + (int)*MEMORY[0x189611CE8]))
  {
    int v7 = (int *)MEMORY[0x189611CD8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5)) {
        return *(_BYTE *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0LL;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1LL || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(_BYTE *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0LL;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }

      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5)) {
        unint64_t v10 = 0LL;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(_BYTE *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 1)
      {
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0LL;
        *(_BYTE *)(a1 + 24) |= 2u;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1LL || v21 >= *(void *)(a2 + *v4))
          {
            unsigned int v24 = &OBJC_IVAR___TPPBAncientEpoch__myEpoch;
            goto LABEL_38;
          }

          char v22 = *(_BYTE *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            break;
          }
          v17 += 7;
          BOOL v23 = v18++ > 8;
          if (v23)
          {
            uint64_t v19 = 0LL;
            unsigned int v24 = &OBJC_IVAR___TPPBAncientEpoch__myEpoch;
            goto LABEL_41;
          }
        }

        unsigned int v24 = &OBJC_IVAR___TPPBAncientEpoch__myEpoch;
LABEL_39:
        if (*(_BYTE *)(a2 + *v5)) {
          uint64_t v19 = 0LL;
        }
LABEL_41:
        *(void *)(a1 + *v24) = v19;
        goto LABEL_42;
      }

      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0LL;
      }
LABEL_42:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(_BYTE *)(a2 + *v5) == 0;
      }
    }

    char v25 = 0;
    unsigned int v26 = 0;
    uint64_t v19 = 0LL;
    *(_BYTE *)(a1 + 24) |= 1u;
    while (1)
    {
      uint64_t v27 = *v3;
      unint64_t v28 = *(void *)(a2 + v27);
      if (v28 == -1LL || v28 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v29 = *(_BYTE *)(*(void *)(a2 + *v7) + v28);
      *(void *)(a2 + v27) = v28 + 1;
      v19 |= (unint64_t)(v29 & 0x7F) << v25;
      if ((v29 & 0x80) == 0)
      {
        unsigned int v24 = &OBJC_IVAR___TPPBAncientEpoch__candidateEpoch;
        goto LABEL_39;
      }

      v25 += 7;
      BOOL v23 = v26++ > 8;
      if (v23)
      {
        uint64_t v19 = 0LL;
        unsigned int v24 = &OBJC_IVAR___TPPBAncientEpoch__candidateEpoch;
        goto LABEL_41;
      }
    }

    unsigned int v24 = &OBJC_IVAR___TPPBAncientEpoch__candidateEpoch;
LABEL_38:
    *(_BYTE *)(a2 + *v5) = 1;
    goto LABEL_39;
  }

  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t TPPBPolicyProhibitsReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x189611CF0];
  uint64_t v4 = (int *)MEMORY[0x189611CE8];
  int v5 = (int *)MEMORY[0x189611CE0];
  if (*(void *)(a2 + (int)*MEMORY[0x189611CF0]) < *(void *)(a2 + (int)*MEMORY[0x189611CE8]))
  {
    int v7 = (int *)MEMORY[0x189611CD8];
    while (2)
    {
      if (!*(_BYTE *)(a2 + *v5))
      {
        char v8 = 0;
        unsigned int v9 = 0;
        unint64_t v10 = 0LL;
        while (1)
        {
          uint64_t v11 = *v3;
          unint64_t v12 = *(void *)(a2 + v11);
          if (v12 == -1LL || v12 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v13 = *(_BYTE *)(*(void *)(a2 + *v7) + v12);
          *(void *)(a2 + v11) = v12 + 1;
          v10 |= (unint64_t)(v13 & 0x7F) << v8;
          if ((v13 & 0x80) == 0) {
            goto LABEL_12;
          }
          v8 += 7;
          BOOL v14 = v9++ >= 9;
          if (v14)
          {
            unint64_t v10 = 0LL;
            int v15 = *(unsigned __int8 *)(a2 + *v5);
            goto LABEL_14;
          }
        }

        *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
        int v15 = *(unsigned __int8 *)(a2 + *v5);
        if (*(_BYTE *)(a2 + *v5)) {
          unint64_t v10 = 0LL;
        }
LABEL_14:
        if (v15) {
          BOOL v16 = 1;
        }
        else {
          BOOL v16 = (v10 & 7) == 4;
        }
        if (!v16)
        {
          switch((v10 >> 3))
          {
            case 1u:
              char v17 = 0;
              unsigned int v18 = 0;
              uint64_t v19 = 0LL;
              *(_BYTE *)(a1 + 48) |= 1u;
              break;
            case 2u:
              uint64_t v24 = PBReaderReadString();
              uint64_t v25 = 40LL;
              goto LABEL_32;
            case 3u:
              uint64_t v24 = PBReaderReadString();
              uint64_t v25 = 32LL;
              goto LABEL_32;
            case 4u:
              uint64_t v24 = PBReaderReadString();
              uint64_t v25 = 16LL;
              goto LABEL_32;
            case 5u:
              uint64_t v24 = PBReaderReadString();
              uint64_t v25 = 24LL;
LABEL_32:
              unsigned int v26 = *(void **)(a1 + v25);
              *(void *)(a1 + v25) = v24;

              goto LABEL_37;
            default:
              uint64_t result = PBReaderSkipValueWithTag();
              if (!(_DWORD)result) {
                return result;
              }
LABEL_37:
              if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
                return *(_BYTE *)(a2 + *v5) == 0;
              }
              continue;
          }

          while (1)
          {
            uint64_t v20 = *v3;
            unint64_t v21 = *(void *)(a2 + v20);
            if (v21 == -1LL || v21 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v22 = *(_BYTE *)(*(void *)(a2 + *v7) + v21);
            *(void *)(a2 + v20) = v21 + 1;
            v19 |= (unint64_t)(v22 & 0x7F) << v17;
            if ((v22 & 0x80) == 0) {
              goto LABEL_34;
            }
            v17 += 7;
            BOOL v14 = v18++ >= 9;
            if (v14)
            {
              uint64_t v19 = 0LL;
              goto LABEL_36;
            }
          }

          *(_BYTE *)(a2 + *v5) = 1;
LABEL_34:
          if (*(_BYTE *)(a2 + *v5)) {
            uint64_t v19 = 0LL;
          }
LABEL_36:
          *(void *)(a1 + _Block_object_dispose((const void *)(v17 - 112), 8) = v19;
          goto LABEL_37;
        }
      }

      break;
    }
  }

  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL TPPBUnknownMachineIDReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x189611CF0];
  uint64_t v4 = (int *)MEMORY[0x189611CE8];
  int v5 = (int *)MEMORY[0x189611CE0];
  v6 = (int *)MEMORY[0x189611CD8];
  while (1)
  {
    int v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
      return v7 == 0;
    }
    if (*(_BYTE *)(a2 + *v5))
    {
      int v7 = 1;
      return v7 == 0;
    }

    char v8 = 0;
    unsigned int v9 = 0;
    uint64_t v10 = 0LL;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1LL || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(_BYTE *)(*(void *)(a2 + *v6) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      if (v9++ >= 9)
      {
        LOBYTE(v10) = 0;
        int v7 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }

    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    int v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5)) {
      LOBYTE(v10) = 0;
    }
LABEL_14:
    if (v7) {
      BOOL v15 = 1;
    }
    else {
      BOOL v15 = (v10 & 7) == 4;
    }
    if (v15) {
      return v7 == 0;
    }
    if ((PBReaderSkipValueWithTag() & 1) == 0) {
      return 0LL;
    }
  }

BOOL TPPBDispositionEvictedMachineIDReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x189611CF0];
  uint64_t v4 = (int *)MEMORY[0x189611CE8];
  int v5 = (int *)MEMORY[0x189611CE0];
  v6 = (int *)MEMORY[0x189611CD8];
  while (1)
  {
    int v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
      return v7 == 0;
    }
    if (*(_BYTE *)(a2 + *v5))
    {
      int v7 = 1;
      return v7 == 0;
    }

    char v8 = 0;
    unsigned int v9 = 0;
    uint64_t v10 = 0LL;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1LL || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(_BYTE *)(*(void *)(a2 + *v6) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      if (v9++ >= 9)
      {
        LOBYTE(v10) = 0;
        int v7 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }

    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    int v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5)) {
      LOBYTE(v10) = 0;
    }
LABEL_14:
    if (v7) {
      BOOL v15 = 1;
    }
    else {
      BOOL v15 = (v10 & 7) == 4;
    }
    if (v15) {
      return v7 == 0;
    }
    if ((PBReaderSkipValueWithTag() & 1) == 0) {
      return 0LL;
    }
  }

BOOL TPPBDispositionReadFrom(id *a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x189611CF0];
  uint64_t v4 = (int *)MEMORY[0x189611CE8];
  int v5 = (int *)MEMORY[0x189611CE0];
  int v7 = (int *)MEMORY[0x189611CD8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5)) {
      return *(_BYTE *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0LL;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1LL || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(_BYTE *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      if (v9++ >= 9)
      {
        unint64_t v10 = 0LL;
        int v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }

    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    int v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5)) {
      unint64_t v10 = 0LL;
    }
LABEL_14:
    if (v15 || (v10 & 7) == 4) {
      return *(_BYTE *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        char v17 = objc_alloc_init(&OBJC_CLASS___TPPBAncientEpoch);
        objc_storeStrong(a1 + 1, v17);
        goto LABEL_48;
      case 2u:
        char v17 = objc_alloc_init(&OBJC_CLASS___TPPBPolicyProhibits);
        objc_storeStrong(a1 + 6, v17);
        goto LABEL_44;
      case 3u:
        char v17 = objc_alloc_init(&OBJC_CLASS___TPPBUnknownMachineID);
        objc_storeStrong(a1 + 7, v17);
        uint64_t v18 = PBReaderPlaceMark();
        if (!(_DWORD)v18 || !TPPBUnknownMachineIDReadFrom(v18, a2)) {
          goto LABEL_48;
        }
        goto LABEL_44;
      case 4u:
        char v17 = objc_alloc_init(&OBJC_CLASS___TPPBDispositionDuplicateMachineID);
        objc_storeStrong(a1 + 3, v17);
        uint64_t v19 = PBReaderPlaceMark();
        if (!(_DWORD)v19 || !TPPBDispositionDuplicateMachineIDReadFrom(v19, a2)) {
          goto LABEL_48;
        }
        goto LABEL_44;
      case 5u:
        char v17 = objc_alloc_init(&OBJC_CLASS___TPPBDispositionDisallowedMachineID);
        objc_storeStrong(a1 + 2, v17);
        uint64_t v20 = PBReaderPlaceMark();
        if (!(_DWORD)v20 || !TPPBDispositionDisallowedMachineIDReadFrom(v20, a2)) {
          goto LABEL_48;
        }
        goto LABEL_44;
      case 6u:
        char v17 = objc_alloc_init(&OBJC_CLASS___TPPBDispositionEvictedMachineID);
        objc_storeStrong(a1 + 4, v17);
        uint64_t v21 = PBReaderPlaceMark();
        if (!(_DWORD)v21 || !TPPBDispositionEvictedMachineIDReadFrom(v21, a2)) {
          goto LABEL_48;
        }
        goto LABEL_44;
      case 7u:
        char v17 = objc_alloc_init(&OBJC_CLASS___TPPBDispositionUnknownReasonRemovalMachineID);
        objc_storeStrong(a1 + 8, v17);
        uint64_t v22 = PBReaderPlaceMark();
        if (!(_DWORD)v22 || !TPPBDispositionUnknownReasonRemovalMachineIDReadFrom(v22, a2)) {
          goto LABEL_48;
        }
        goto LABEL_44;
      case 8u:
        char v17 = objc_alloc_init(&OBJC_CLASS___TPPBDispositionGhostedMachineID);
        objc_storeStrong(a1 + 5, v17);
        uint64_t v23 = PBReaderPlaceMark();
        if ((_DWORD)v23 && TPPBDispositionGhostedMachineIDReadFrom(v23, a2))
        {
LABEL_44:
          PBReaderRecallMark();

LABEL_45:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(_BYTE *)(a2 + *v5) == 0;
          }
          continue;
        }

LABEL_48:
        return 0LL;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0) {
          return 0LL;
        }
        goto LABEL_45;
    }
  }

LABEL_20:
  return v9;
}

uint64_t TPPBPeerPermanentInfoReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x189611CF0];
  uint64_t v4 = (int *)MEMORY[0x189611CE8];
  int v5 = (int *)MEMORY[0x189611CE0];
  if (*(void *)(a2 + (int)*MEMORY[0x189611CF0]) < *(void *)(a2 + (int)*MEMORY[0x189611CE8]))
  {
    int v7 = (int *)MEMORY[0x189611CD8];
    do
    {
      if (*(_BYTE *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0LL;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1LL || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(_BYTE *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0LL;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }

      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5)) {
        unint64_t v10 = 0LL;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          char v17 = 0;
          unsigned int v18 = 0;
          uint64_t v19 = 0LL;
          *(_BYTE *)(a1 + 56) |= 2u;
          while (1)
          {
            uint64_t v20 = *v3;
            unint64_t v21 = *(void *)(a2 + v20);
            if (v21 == -1LL || v21 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v22 = *(_BYTE *)(*(void *)(a2 + *v7) + v21);
            *(void *)(a2 + v20) = v21 + 1;
            v19 |= (unint64_t)(v22 & 0x7F) << v17;
            if ((v22 & 0x80) == 0) {
              goto LABEL_41;
            }
            v17 += 7;
            BOOL v14 = v18++ >= 9;
            if (v14)
            {
              uint64_t v19 = 0LL;
              goto LABEL_43;
            }
          }

          *(_BYTE *)(a2 + *v5) = 1;
LABEL_41:
          if (*(_BYTE *)(a2 + *v5)) {
            uint64_t v19 = 0LL;
          }
LABEL_43:
          uint64_t v32 = 16LL;
          goto LABEL_48;
        case 2u:
          uint64_t v24 = PBReaderReadData();
          uint64_t v25 = 48LL;
          goto LABEL_32;
        case 3u:
          uint64_t v24 = PBReaderReadData();
          uint64_t v25 = 24LL;
          goto LABEL_32;
        case 4u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 32LL;
          goto LABEL_32;
        case 5u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 40LL;
LABEL_32:
          unsigned int v26 = *(void **)(a1 + v25);
          *(void *)(a1 + v25) = v24;

          continue;
        case 6u:
          char v27 = 0;
          unsigned int v28 = 0;
          uint64_t v19 = 0LL;
          *(_BYTE *)(a1 + 56) |= 1u;
          break;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result) {
            return result;
          }
          continue;
      }

      while (1)
      {
        uint64_t v29 = *v3;
        unint64_t v30 = *(void *)(a2 + v29);
        if (v30 == -1LL || v30 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v31 = *(_BYTE *)(*(void *)(a2 + *v7) + v30);
        *(void *)(a2 + v29) = v30 + 1;
        v19 |= (unint64_t)(v31 & 0x7F) << v27;
        if ((v31 & 0x80) == 0) {
          goto LABEL_45;
        }
        v27 += 7;
        BOOL v14 = v28++ >= 9;
        if (v14)
        {
          uint64_t v19 = 0LL;
          goto LABEL_47;
        }
      }

      *(_BYTE *)(a2 + *v5) = 1;
LABEL_45:
      if (*(_BYTE *)(a2 + *v5)) {
        uint64_t v19 = 0LL;
      }
LABEL_47:
      uint64_t v32 = 8LL;
LABEL_48:
      *(void *)(a1 + v32) = v19;
    }

    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }

  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t TPPBPeerDynamicInfoReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x189611CF0];
  uint64_t v4 = (int *)MEMORY[0x189611CE8];
  int v5 = (int *)MEMORY[0x189611CE0];
  int v7 = (int *)MEMORY[0x189611CD8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5)) {
      return *(_BYTE *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0LL;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1LL || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(_BYTE *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v14 = v9++ >= 9;
      if (v14)
      {
        unint64_t v10 = 0LL;
        int v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }

    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    int v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5)) {
      unint64_t v10 = 0LL;
    }
LABEL_14:
    if (v15 || (v10 & 7) == 4) {
      return *(_BYTE *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0LL;
        *(_BYTE *)(a1 + 48) |= 1u;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1LL || v21 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v22 = *(_BYTE *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            goto LABEL_39;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            uint64_t v19 = 0LL;
            goto LABEL_41;
          }
        }

        *(_BYTE *)(a2 + *v5) = 1;
LABEL_39:
        if (*(_BYTE *)(a2 + *v5)) {
          uint64_t v19 = 0LL;
        }
LABEL_41:
        *(void *)(a1 + _Block_object_dispose((const void *)(v17 - 112), 8) = v19;
        goto LABEL_42;
      case 2u:
        PBReaderReadString();
        uint64_t v24 = (TPPBDispositionEntry *)objc_claimAutoreleasedReturnValue();
        if (v24) {
          [(id)a1 addIncluded:v24];
        }
        goto LABEL_37;
      case 3u:
        PBReaderReadString();
        uint64_t v24 = (TPPBDispositionEntry *)objc_claimAutoreleasedReturnValue();
        if (v24) {
          [(id)a1 addExcluded:v24];
        }
        goto LABEL_37;
      case 4u:
        uint64_t v24 = objc_alloc_init(&OBJC_CLASS___TPPBDispositionEntry);
        [(id)a1 addDispositions:v24];
        if (PBReaderPlaceMark() && TPPBDispositionEntryReadFrom((uint64_t)v24, a2))
        {
          PBReaderRecallMark();
LABEL_37:

LABEL_42:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(_BYTE *)(a2 + *v5) == 0;
          }
          continue;
        }

        return 0LL;
      case 5u:
        PBReaderReadString();
        uint64_t v24 = (TPPBDispositionEntry *)objc_claimAutoreleasedReturnValue();
        if (v24) {
          [(id)a1 addPreapprovals:v24];
        }
        goto LABEL_37;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result) {
          return result;
        }
        goto LABEL_42;
    }
  }

BOOL TPPBPolicySecretReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x189611CF0];
  uint64_t v4 = (int *)MEMORY[0x189611CE8];
  int v5 = (int *)MEMORY[0x189611CE0];
  if (*(void *)(a2 + (int)*MEMORY[0x189611CF0]) < *(void *)(a2 + (int)*MEMORY[0x189611CE8]))
  {
    int v7 = (int *)MEMORY[0x189611CD8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5)) {
        return *(_BYTE *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0LL;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1LL || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(_BYTE *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0LL;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }

      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5)) {
        unint64_t v10 = 0LL;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(_BYTE *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 8LL;
LABEL_22:
        uint64_t v19 = *(void **)(a1 + v18);
        *(void *)(a1 + v1_Block_object_dispose((const void *)(v17 - 112), 8) = v17;

        goto LABEL_24;
      }

      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0LL;
      }
LABEL_24:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(_BYTE *)(a2 + *v5) == 0;
      }
    }

    uint64_t v17 = PBReaderReadData();
    uint64_t v18 = 16LL;
    goto LABEL_22;
  }

  return *(_BYTE *)(a2 + *v5) == 0;
}

LABEL_13:
  return v8;
}

uint64_t TPPBCustodianRecoveryKeyReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x189611CF0];
  uint64_t v4 = (int *)MEMORY[0x189611CE8];
  int v5 = (int *)MEMORY[0x189611CE0];
  if (*(void *)(a2 + (int)*MEMORY[0x189611CF0]) < *(void *)(a2 + (int)*MEMORY[0x189611CE8]))
  {
    int v7 = (int *)MEMORY[0x189611CD8];
    do
    {
      if (*(_BYTE *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0LL;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1LL || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(_BYTE *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0LL;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }

      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5)) {
        unint64_t v10 = 0LL;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 32LL;
          goto LABEL_24;
        case 2u:
          uint64_t v17 = PBReaderReadData();
          uint64_t v18 = 24LL;
          goto LABEL_24;
        case 3u:
          uint64_t v17 = PBReaderReadData();
          uint64_t v18 = 8LL;
LABEL_24:
          uint64_t v20 = *(void **)(a1 + v18);
          *(void *)(a1 + v1_Block_object_dispose((const void *)(v17 - 112), 8) = v17;

          continue;
        case 4u:
          char v21 = 0;
          unsigned int v22 = 0;
          uint64_t v23 = 0LL;
          *(_BYTE *)(a1 + 40) |= 1u;
          break;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result) {
            return result;
          }
          continue;
      }

      while (1)
      {
        uint64_t v24 = *v3;
        unint64_t v25 = *(void *)(a2 + v24);
        if (v25 == -1LL || v25 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v26 = *(_BYTE *)(*(void *)(a2 + *v7) + v25);
        *(void *)(a2 + v24) = v25 + 1;
        v23 |= (unint64_t)(v26 & 0x7F) << v21;
        if ((v26 & 0x80) == 0) {
          goto LABEL_33;
        }
        v21 += 7;
        BOOL v14 = v22++ >= 9;
        if (v14)
        {
          LODWORD(v23) = 0;
          goto LABEL_35;
        }
      }

      *(_BYTE *)(a2 + *v5) = 1;
LABEL_33:
      if (*(_BYTE *)(a2 + *v5)) {
        LODWORD(v23) = 0;
      }
LABEL_35:
      *(_DWORD *)(a1 + 16) = v23;
    }

    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }

  return *(_BYTE *)(a2 + *v5) == 0;
}

LABEL_49:
    uint64_t v19 = 0;
  }

LABEL_50:
  return v19;
}

uint64_t TPPBPeerStableInfoReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x189611CF0];
  uint64_t v4 = (int *)MEMORY[0x189611CE8];
  int v5 = (int *)MEMORY[0x189611CE0];
  int v7 = (int *)MEMORY[0x189611CD8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5)) {
      return *(_BYTE *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0LL;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1LL || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(_BYTE *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v14 = v9++ >= 9;
      if (v14)
      {
        unint64_t v10 = 0LL;
        int v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }

    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    int v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5)) {
      unint64_t v10 = 0LL;
    }
LABEL_14:
    if (v15 || (v10 & 7) == 4) {
      return *(_BYTE *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0LL;
        *(_BYTE *)(a1 + 140) |= 1u;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1LL || v21 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v22 = *(_BYTE *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            goto LABEL_79;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            uint64_t v19 = 0LL;
            goto LABEL_81;
          }
        }

        *(_BYTE *)(a2 + *v5) = 1;
LABEL_79:
        if (*(_BYTE *)(a2 + *v5)) {
          uint64_t v19 = 0LL;
        }
LABEL_81:
        uint64_t v51 = 8LL;
        goto LABEL_90;
      case 2u:
        char v23 = 0;
        unsigned int v24 = 0;
        uint64_t v19 = 0LL;
        *(_BYTE *)(a1 + 140) |= 4u;
        while (2)
        {
          uint64_t v25 = *v3;
          unint64_t v26 = *(void *)(a2 + v25);
          if (v26 == -1LL || v26 >= *(void *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }

          else
          {
            char v27 = *(_BYTE *)(*(void *)(a2 + *v7) + v26);
            *(void *)(a2 + v25) = v26 + 1;
            v19 |= (unint64_t)(v27 & 0x7F) << v23;
            if (v27 < 0)
            {
              v23 += 7;
              BOOL v14 = v24++ >= 9;
              if (v14)
              {
                uint64_t v19 = 0LL;
                goto LABEL_85;
              }

              continue;
            }
          }

          break;
        }

        if (*(_BYTE *)(a2 + *v5)) {
          uint64_t v19 = 0LL;
        }
LABEL_85:
        uint64_t v51 = 24LL;
        goto LABEL_90;
      case 3u:
        uint64_t v28 = PBReaderReadString();
        uint64_t v29 = 56LL;
        goto LABEL_50;
      case 4u:
        unint64_t v30 = objc_alloc_init(&OBJC_CLASS___TPPBPolicySecret);
        [(id)a1 addPolicySecrets:v30];
        goto LABEL_68;
      case 5u:
        uint64_t v28 = PBReaderReadString();
        uint64_t v29 = 64LL;
        goto LABEL_50;
      case 6u:
        uint64_t v28 = PBReaderReadString();
        uint64_t v29 = 40LL;
        goto LABEL_50;
      case 7u:
        uint64_t v28 = PBReaderReadData();
        uint64_t v29 = 88LL;
        goto LABEL_50;
      case 8u:
        uint64_t v28 = PBReaderReadData();
        uint64_t v29 = 80LL;
        goto LABEL_50;
      case 9u:
        uint64_t v28 = PBReaderReadString();
        uint64_t v29 = 104LL;
        goto LABEL_50;
      case 0xAu:
        char v31 = 0;
        unsigned int v32 = 0;
        uint64_t v19 = 0LL;
        *(_BYTE *)(a1 + 140) |= 2u;
        while (2)
        {
          uint64_t v33 = *v3;
          unint64_t v34 = *(void *)(a2 + v33);
          if (v34 == -1LL || v34 >= *(void *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }

          else
          {
            char v35 = *(_BYTE *)(*(void *)(a2 + *v7) + v34);
            *(void *)(a2 + v33) = v34 + 1;
            v19 |= (unint64_t)(v35 & 0x7F) << v31;
            if (v35 < 0)
            {
              v31 += 7;
              BOOL v14 = v32++ >= 9;
              if (v14)
              {
                uint64_t v19 = 0LL;
                goto LABEL_89;
              }

              continue;
            }
          }

          break;
        }

        if (*(_BYTE *)(a2 + *v5)) {
          uint64_t v19 = 0LL;
        }
LABEL_89:
        uint64_t v51 = 16LL;
LABEL_90:
        *(void *)(a1 + v51) = v19;
        goto LABEL_99;
      case 0xBu:
        uint64_t v28 = PBReaderReadString();
        uint64_t v29 = 48LL;
LABEL_50:
        v36 = *(void **)(a1 + v29);
        *(void *)(a1 + v29) = v28;

        goto LABEL_99;
      case 0xCu:
        char v37 = 0;
        unsigned int v38 = 0;
        uint64_t v39 = 0LL;
        *(_BYTE *)(a1 + 140) |= 8u;
        while (2)
        {
          uint64_t v40 = *v3;
          unint64_t v41 = *(void *)(a2 + v40);
          if (v41 == -1LL || v41 >= *(void *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }

          else
          {
            char v42 = *(_BYTE *)(*(void *)(a2 + *v7) + v41);
            *(void *)(a2 + v40) = v41 + 1;
            v39 |= (unint64_t)(v42 & 0x7F) << v37;
            if (v42 < 0)
            {
              v37 += 7;
              BOOL v14 = v38++ >= 9;
              if (v14)
              {
                LODWORD(v39) = 0;
                goto LABEL_94;
              }

              continue;
            }
          }

          break;
        }

        if (*(_BYTE *)(a2 + *v5)) {
          LODWORD(v39) = 0;
        }
LABEL_94:
        *(_DWORD *)(a1 + 112) = v39;
        goto LABEL_99;
      case 0xDu:
        unint64_t v30 = objc_alloc_init(&OBJC_CLASS___TPPBCustodianRecoveryKey);
        [(id)a1 addCustodianRecoveryKeys:v30];
        goto LABEL_68;
      case 0xEu:
        unint64_t v30 = objc_alloc_init(&OBJC_CLASS___TPPBSecureElementIdentity);
        objc_storeStrong((id *)(a1 + 96), v30);
        goto LABEL_68;
      case 0xFu:
        unint64_t v30 = objc_alloc_init(&OBJC_CLASS___TPPBPeerStableInfoSetting);
        uint64_t v43 = 120LL;
        goto LABEL_66;
      case 0x10u:
        unint64_t v30 = objc_alloc_init(&OBJC_CLASS___TPPBPeerStableInfoSetting);
        uint64_t v43 = 128LL;
LABEL_66:
        objc_storeStrong((id *)(a1 + v43), v30);
        if (PBReaderPlaceMark() && (TPPBPeerStableInfoSettingReadFrom((uint64_t)v30, a2) & 1) != 0)
        {
LABEL_68:
          PBReaderRecallMark();

LABEL_99:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(_BYTE *)(a2 + *v5) == 0;
          }
          continue;
        }

LABEL_101:
        return 0LL;
      case 0x12u:
        char v45 = 0;
        unsigned int v46 = 0;
        uint64_t v47 = 0LL;
        *(_BYTE *)(a1 + 140) |= 0x10u;
        while (2)
        {
          uint64_t v48 = *v3;
          unint64_t v49 = *(void *)(a2 + v48);
          if (v49 == -1LL || v49 >= *(void *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }

          else
          {
            char v50 = *(_BYTE *)(*(void *)(a2 + *v7) + v49);
            *(void *)(a2 + v4_Block_object_dispose((const void *)(v17 - 112), 8) = v49 + 1;
            v47 |= (unint64_t)(v50 & 0x7F) << v45;
            if (v50 < 0)
            {
              v45 += 7;
              BOOL v14 = v46++ >= 9;
              if (v14)
              {
                uint64_t v47 = 0LL;
                goto LABEL_98;
              }

              continue;
            }
          }

          break;
        }

        if (*(_BYTE *)(a2 + *v5)) {
          uint64_t v47 = 0LL;
        }
LABEL_98:
        *(_BYTE *)(a1 + 136) = v47 != 0;
        goto LABEL_99;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result) {
          return result;
        }
        goto LABEL_99;
    }
  }

uint64_t TPPBVoucherReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x189611CF0];
  uint64_t v4 = (int *)MEMORY[0x189611CE8];
  int v5 = (int *)MEMORY[0x189611CE0];
  if (*(void *)(a2 + (int)*MEMORY[0x189611CF0]) < *(void *)(a2 + (int)*MEMORY[0x189611CE8]))
  {
    int v7 = (int *)MEMORY[0x189611CD8];
    do
    {
      if (*(_BYTE *)(a2 + *v5)) {
        return *(_BYTE *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0LL;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1LL || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(_BYTE *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0LL;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }

      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5)) {
        unint64_t v10 = 0LL;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(_BYTE *)(a2 + *v5) == 0;
      }
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        uint64_t v24 = PBReaderReadString();
        uint64_t v25 = 24LL;
      }

      else
      {
        if ((_DWORD)v17 != 2)
        {
          if ((_DWORD)v17 == 1)
          {
            char v18 = 0;
            unsigned int v19 = 0;
            uint64_t v20 = 0LL;
            *(_BYTE *)(a1 + 32) |= 1u;
            while (1)
            {
              uint64_t v21 = *v3;
              unint64_t v22 = *(void *)(a2 + v21);
              if (v22 == -1LL || v22 >= *(void *)(a2 + *v4)) {
                break;
              }
              char v23 = *(_BYTE *)(*(void *)(a2 + *v7) + v22);
              *(void *)(a2 + v21) = v22 + 1;
              v20 |= (unint64_t)(v23 & 0x7F) << v18;
              if ((v23 & 0x80) == 0) {
                goto LABEL_34;
              }
              v18 += 7;
              BOOL v14 = v19++ >= 9;
              if (v14)
              {
                LODWORD(v20) = 0;
                goto LABEL_36;
              }
            }

            *(_BYTE *)(a2 + *v5) = 1;
LABEL_34:
            if (*(_BYTE *)(a2 + *v5)) {
              LODWORD(v20) = 0;
            }
LABEL_36:
            *(_DWORD *)(a1 + 16) = v20;
          }

          else
          {
            uint64_t result = PBReaderSkipValueWithTag();
            if (!(_DWORD)result) {
              return result;
            }
          }

          continue;
        }

        uint64_t v24 = PBReaderReadString();
        uint64_t v25 = 8LL;
      }

      unint64_t v26 = *(void **)(a1 + v25);
      *(void *)(a1 + v25) = v24;
    }

    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }

  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t TPPBPolicyDocumentReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x189611CF0];
  uint64_t v4 = (int *)MEMORY[0x189611CE8];
  int v5 = (int *)MEMORY[0x189611CE0];
  int v7 = (int *)MEMORY[0x189611CD8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5)) {
      return *(_BYTE *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0LL;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1LL || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(_BYTE *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v14 = v9++ >= 9;
      if (v14)
      {
        unint64_t v10 = 0LL;
        int v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }

    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    int v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5)) {
      unint64_t v10 = 0LL;
    }
LABEL_14:
    if (v15 || (v10 & 7) == 4) {
      return *(_BYTE *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0LL;
        *(_BYTE *)(a1 + 88) |= 1u;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1LL || v21 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v22 = *(_BYTE *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            goto LABEL_55;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            uint64_t v19 = 0LL;
            goto LABEL_57;
          }
        }

        *(_BYTE *)(a2 + *v5) = 1;
LABEL_55:
        if (*(_BYTE *)(a2 + *v5)) {
          uint64_t v19 = 0LL;
        }
LABEL_57:
        *(void *)(a1 + _Block_object_dispose((const void *)(v17 - 112), 8) = v19;
        goto LABEL_44;
      case 2u:
        uint64_t v24 = objc_alloc_init(&OBJC_CLASS___TPPBPolicyModelToCategory);
        [(id)a1 addModelToCategory:v24];
        goto LABEL_42;
      case 3u:
        uint64_t v24 = objc_alloc_init(&OBJC_CLASS___TPPBPolicyCategoriesByView);
        [(id)a1 addCategoriesByView:v24];
        goto LABEL_42;
      case 4u:
        uint64_t v24 = objc_alloc_init(&OBJC_CLASS___TPPBPolicyIntroducersByCategory);
        [(id)a1 addIntroducersByCategory:v24];
        goto LABEL_42;
      case 5u:
        uint64_t v24 = objc_alloc_init(&OBJC_CLASS___TPPBPolicyRedaction);
        [(id)a1 addRedactions:v24];
        goto LABEL_42;
      case 6u:
        uint64_t v24 = objc_alloc_init(&OBJC_CLASS___TPPBPolicyKeyViewMapping);
        [(id)a1 addKeyViewMapping:v24];
        if (PBReaderPlaceMark() && TPPBPolicyKeyViewMappingReadFrom((uint64_t)v24, a2))
        {
LABEL_42:
          PBReaderRecallMark();
LABEL_43:

LABEL_44:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(_BYTE *)(a2 + *v5) == 0;
          }
          continue;
        }

BOOL TPPBPolicyCategoriesByViewReadFrom(void *a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x189611CF0];
  uint64_t v4 = (int *)MEMORY[0x189611CE8];
  int v5 = (int *)MEMORY[0x189611CE0];
  if (*(void *)(a2 + (int)*MEMORY[0x189611CF0]) < *(void *)(a2 + (int)*MEMORY[0x189611CE8]))
  {
    int v7 = (int *)MEMORY[0x189611CD8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5)) {
        return *(_BYTE *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0LL;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1LL || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(_BYTE *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0LL;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }

      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5)) {
        unint64_t v10 = 0LL;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(_BYTE *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadString();
        unsigned int v18 = (void *)a1[2];
        a1[2] = v17;
LABEL_23:

        goto LABEL_25;
      }

      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0LL;
      }
LABEL_25:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(_BYTE *)(a2 + *v5) == 0;
      }
    }

    PBReaderReadString();
    unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18) {
      [a1 addCategories:v18];
    }
    goto LABEL_23;
  }

  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL TPPBPolicyIntroducersByCategoryReadFrom(void *a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x189611CF0];
  uint64_t v4 = (int *)MEMORY[0x189611CE8];
  int v5 = (int *)MEMORY[0x189611CE0];
  if (*(void *)(a2 + (int)*MEMORY[0x189611CF0]) < *(void *)(a2 + (int)*MEMORY[0x189611CE8]))
  {
    int v7 = (int *)MEMORY[0x189611CD8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5)) {
        return *(_BYTE *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0LL;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1LL || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(_BYTE *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0LL;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }

      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5)) {
        unint64_t v10 = 0LL;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(_BYTE *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadString();
        unsigned int v18 = (void *)a1[1];
        a1[1] = v17;
LABEL_23:

        goto LABEL_25;
      }

      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0LL;
      }
LABEL_25:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(_BYTE *)(a2 + *v5) == 0;
      }
    }

    PBReaderReadString();
    unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18) {
      [a1 addIntroducers:v18];
    }
    goto LABEL_23;
  }

  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL TPPBDispositionGhostedMachineIDReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x189611CF0];
  uint64_t v4 = (int *)MEMORY[0x189611CE8];
  int v5 = (int *)MEMORY[0x189611CE0];
  v6 = (int *)MEMORY[0x189611CD8];
  while (1)
  {
    int v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
      return v7 == 0;
    }
    if (*(_BYTE *)(a2 + *v5))
    {
      int v7 = 1;
      return v7 == 0;
    }

    char v8 = 0;
    unsigned int v9 = 0;
    uint64_t v10 = 0LL;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1LL || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(_BYTE *)(*(void *)(a2 + *v6) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      if (v9++ >= 9)
      {
        LOBYTE(v10) = 0;
        int v7 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }

    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    int v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5)) {
      LOBYTE(v10) = 0;
    }
LABEL_14:
    if (v7) {
      BOOL v15 = 1;
    }
    else {
      BOOL v15 = (v10 & 7) == 4;
    }
    if (v15) {
      return v7 == 0;
    }
    if ((PBReaderSkipValueWithTag() & 1) == 0) {
      return 0LL;
    }
  }

void sub_1883C4F14( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
}

uint64_t __Block_byref_object_copy__2793(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__2794(uint64_t a1)
{
}

void sub_1883C527C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

BOOL TPPBPolicyModelToCategoryReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x189611CF0];
  uint64_t v4 = (int *)MEMORY[0x189611CE8];
  int v5 = (int *)MEMORY[0x189611CE0];
  if (*(void *)(a2 + (int)*MEMORY[0x189611CF0]) < *(void *)(a2 + (int)*MEMORY[0x189611CE8]))
  {
    int v7 = (int *)MEMORY[0x189611CD8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5)) {
        return *(_BYTE *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0LL;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1LL || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(_BYTE *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0LL;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }

      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5)) {
        unint64_t v10 = 0LL;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(_BYTE *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 16LL;
LABEL_22:
        uint64_t v19 = *(void **)(a1 + v18);
        *(void *)(a1 + v1_Block_object_dispose(va, 8) = v17;

        goto LABEL_24;
      }

      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0LL;
      }
LABEL_24:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(_BYTE *)(a2 + *v5) == 0;
      }
    }

    uint64_t v17 = PBReaderReadString();
    uint64_t v18 = 8LL;
    goto LABEL_22;
  }

  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL TPPBPolicyRedactionReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x189611CF0];
  uint64_t v4 = (int *)MEMORY[0x189611CE8];
  int v5 = (int *)MEMORY[0x189611CE0];
  if (*(void *)(a2 + (int)*MEMORY[0x189611CF0]) < *(void *)(a2 + (int)*MEMORY[0x189611CE8]))
  {
    int v7 = (int *)MEMORY[0x189611CD8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5)) {
        return *(_BYTE *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0LL;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1LL || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(_BYTE *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0LL;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }

      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5)) {
        unint64_t v10 = 0LL;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(_BYTE *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = *(TPPBPolicyRedactionAuthenticatedCiphertext **)(a1 + 16);
        *(void *)(a1 + 16) = v17;
LABEL_24:

        goto LABEL_26;
      }

      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0LL;
      }
LABEL_26:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(_BYTE *)(a2 + *v5) == 0;
      }
    }

    uint64_t v18 = objc_alloc_init(&OBJC_CLASS___TPPBPolicyRedactionAuthenticatedCiphertext);
    objc_storeStrong((id *)(a1 + 8), v18);
    if (!PBReaderPlaceMark() || !TPPBPolicyRedactionAuthenticatedCiphertextReadFrom((uint64_t)v18, a2))
    {

      return 0LL;
    }

    PBReaderRecallMark();
    goto LABEL_24;
  }

  return *(_BYTE *)(a2 + *v5) == 0;
}

void CCHmacFinal(CCHmacContext *ctx, void *macOut)
{
}

void CCHmacInit(CCHmacContext *ctx, CCHmacAlgorithm algorithm, const void *key, size_t keyLength)
{
}

void CCHmacUpdate(CCHmacContext *ctx, const void *data, size_t dataLength)
{
}

int CC_SHA224_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1895F82B8](md, c);
}

int CC_SHA224_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x1895F82C0](c);
}

int CC_SHA224_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1895F82C8](c, data, *(void *)&len);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1895F82D8](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x1895F82E0](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1895F82E8](c, data, *(void *)&len);
}

int CC_SHA384_Final(unsigned __int8 *md, CC_SHA512_CTX *c)
{
  return MEMORY[0x1895F82F8](md, c);
}

int CC_SHA384_Init(CC_SHA512_CTX *c)
{
  return MEMORY[0x1895F8300](c);
}

int CC_SHA384_Update(CC_SHA512_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1895F8308](c, data, *(void *)&len);
}

int CC_SHA512_Final(unsigned __int8 *md, CC_SHA512_CTX *c)
{
  return MEMORY[0x1895F8318](md, c);
}

int CC_SHA512_Init(CC_SHA512_CTX *c)
{
  return MEMORY[0x1895F8320](c);
}

int CC_SHA512_Update(CC_SHA512_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1895F8328](c, data, *(void *)&len);
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x189611CF8]();
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x189611D00]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x189611D10]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x189611D20]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x189611D28]();
}

uint64_t PBDataWriterWriteUint64Field()
{
  return MEMORY[0x189611D38]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x189611D40]();
}

uint64_t PBReaderReadData()
{
  return MEMORY[0x189611D48]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x189611D50]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x189611D58]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x189611D60]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1895F8D88]();
}

void _os_log_error_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x1895F9710](__count, __size);
}

uint64_t ccdigest()
{
  return MEMORY[0x1895F9A90]();
}

uint64_t ccsha384_di()
{
  return MEMORY[0x1895FA280]();
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency( dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1895FAD68](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1895FAD80](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void free(void *a1)
{
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

void objc_autoreleasePoolPop(void *context)
{
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1896165E8]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1896165F0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x189616600]();
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1896166C8](self, _cmd, offset, atomic);
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x189616990](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1895FC440](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

uint64_t objc_msgSend_calculateDynamicInfoFromModel_peer_peerPermanentInfo_peerStableInfo_startingDynamicInfo_addingPeerIDs_removingPeerIDs_preapprovedKeys_signingKeyPair_currentMachineIDs_sponsorPeerID_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_calculateDynamicInfoFromModel_peer_peerPermanentInfo_peerStableInfo_startingDynamicInfo_addingPeerIDs_removingPeerIDs_preapprovedKeys_signingKeyPair_currentMachineIDs_sponsorPeerID_error_);
}

uint64_t objc_msgSend_calculateHmacWithHmacKey_permanentInfoData_permanentInfoSig_stableInfoData_stableInfoSig_dynamicInfoData_dynamicInfoSig_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_calculateHmacWithHmacKey_permanentInfoData_permanentInfoSig_stableInfoData_stableInfoSig_dynamicInfoData_dynamicInfoSig_);
}

uint64_t objc_msgSend_cloneWithVersionNumber_prependingCategoriesByView_prependingKeyViewMapping_prependingRedactions_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_cloneWithVersionNumber_prependingCategoriesByView_prependingKeyViewMapping_prependingRedactions_);
}

uint64_t objc_msgSend_considerCandidateID_withSponsorID_sponsorPermanentInfo_toExpandIncludedPeerIDs_andExcludedPeerIDs_dispositions_currentMachineIDs_forEpoch_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_considerCandidateID_withSponsorID_sponsorPermanentInfo_toExpandIncludedPeerIDs_andExcludedPeerIDs_dispositions_currentMachineIDs_forEpoch_);
}

uint64_t objc_msgSend_considerPreapprovalsSponsoredByPeer_toRecursivelyExpandIncludedPeerIDs_andExcludedPeerIDs_dispositions_currentMachineIDs_forEpoch_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_considerPreapprovalsSponsoredByPeer_toRecursivelyExpandIncludedPeerIDs_andExcludedPeerIDs_dispositions_currentMachineIDs_forEpoch_);
}

uint64_t objc_msgSend_considerVouchersSponsoredByPeerID_sponsorPermanentInfo_toRecursivelyExpandIncludedPeerIDs_andExcludedPeerIDs_dispositions_currentMachineIDs_forEpoch_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_considerVouchersSponsoredByPeerID_sponsorPermanentInfo_toRecursivelyExpandIncludedPeerIDs_andExcludedPeerIDs_dispositions_currentMachineIDs_forEpoch_);
}

uint64_t objc_msgSend_createDynamicInfoWithIncludedPeerIDs_excludedPeerIDs_dispositions_preapprovals_signingKeyPair_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_createDynamicInfoWithIncludedPeerIDs_excludedPeerIDs_dispositions_preapprovals_signingKeyPair_error_);
}

uint64_t objc_msgSend_dynamicInfoPBWithClock_includedPeerIDs_excludedPeerIDs_dispositions_preapprovals_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_dynamicInfoPBWithClock_includedPeerIDs_excludedPeerIDs_dispositions_preapprovals_);
}

uint64_t objc_msgSend_dynamicInfoWithClock_includedPeerIDs_excludedPeerIDs_dispositions_preapprovals_signingKeyPair_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_dynamicInfoWithClock_includedPeerIDs_excludedPeerIDs_dispositions_preapprovals_signingKeyPair_error_);
}

uint64_t objc_msgSend_initWithClock_frozenPolicyVersion_flexiblePolicyVersion_policySecrets_syncUserControllableViews_secureElementIdentity_walrusSetting_webAccess_deviceName_serialNumber_osVersion_signingKeyPair_recoverySigningPubKey_recoveryEncryptionPubKey_isInheritedAccount_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_initWithClock_frozenPolicyVersion_flexiblePolicyVersion_policySecrets_syncUserControllableViews_secureElementIdentity_walrusSetting_webAccess_deviceName_serialNumber_osVersion_signingKeyPair_recoverySigningPubKey_recoveryEncryptionPubKey_isInheritedAccount_error_);
}

uint64_t objc_msgSend_initWithMachineID_modelID_epoch_signingPubKey_encryptionPubKey_creationTime_data_sig_peerID_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_initWithMachineID_modelID_epoch_signingPubKey_encryptionPubKey_creationTime_data_sig_peerID_);
}

uint64_t objc_msgSend_initWithModel_version_viewList_priorityViews_userControllableViews_syncUserControllableViews_viewsToPiggybackTLKs_keyViewMapping_isInheritedAccount_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_initWithModel_version_viewList_priorityViews_userControllableViews_syncUserControllableViews_viewsToPiggybackTLKs_keyViewMapping_isInheritedAccount_);
}

uint64_t objc_msgSend_initWithUUID_signingPublicKey_encryptionPublicKey_kind_data_sig_peerID_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_initWithUUID_signingPublicKey_encryptionPublicKey_kind_data_sig_peerID_);
}

uint64_t objc_msgSend_policyWithModelToCategory_categoriesByView_introducersByCategory_keyViewMapping_unknownRedactions_userControllableViewList_piggybackViews_priorityViews_inheritedExcludedViews_version_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_policyWithModelToCategory_categoriesByView_introducersByCategory_keyViewMapping_unknownRedactions_userControllableViewList_piggybackViews_priorityViews_inheritedExcludedViews_version_);
}

uint64_t objc_msgSend_recursivelyExpandIncludedPeerIDs_andExcludedPeerIDs_dispositions_withPeersTrustedBySponsorID_currentMachineIDs_forEpoch_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_recursivelyExpandIncludedPeerIDs_andExcludedPeerIDs_dispositions_withPeersTrustedBySponsorID_currentMachineIDs_forEpoch_);
}