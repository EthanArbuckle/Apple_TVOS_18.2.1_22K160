LABEL_35:
}

      v18 = 0LL;
      goto LABEL_38;
    }
  }

  if (!v11 && !-[RBLaunchManager _checkLaunchForBackoff:error:](self, "_checkLaunchForBackoff:error:", v19, a6)) {
    goto LABEL_35;
  }
  [v10 _additionalEnvironment];
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  RBSStringForKey();
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21) {
    [v10 setHomeDirectory:v21];
  }
  [v10 _additionalEnvironment];
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  RBSStringForKey();
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23) {
    [v10 setTmpDirectory:v23];
  }
  jobManager = self->_jobManager;
  v46 = 0LL;
  v25 = -[RBLaunchdJobManager createAndLaunchWithIdentity:context:error:]( jobManager,  "createAndLaunchWithIdentity:context:error:",  v19,  v10,  &v46);
  v26 = v46;
  v27 = v26;
  if (v25)
  {
    v45 = v26;
    if (!v11) {
      goto LABEL_24;
    }
    [v11 identifier];
    v43 = v10;
    v28 = v23;
    v29 = a6;
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    [v25 identifier];
    v44 = v21;
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = [v30 isEqual:v31];

    v21 = v44;
    a6 = v29;
    v23 = v28;
    v10 = v43;
    if (v32)
    {
      rbs_process_log();
      v33 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        [v11 identifier];
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v48 = v19;
        v49 = 2114;
        v50 = v34;
        _os_log_impl( &dword_188634000,  v33,  OS_LOG_TYPE_INFO,  "returning existing extension %{public}@ already running as pid %{public}@",  buf,  0x16u);

        v21 = v44;
      }

      v35 = v11;
    }

    else
    {
LABEL_24:
      -[RBLaunchManager _resolveNewProcessForInstance:requestIdentity:context:withError:]( self,  "_resolveNewProcessForInstance:requestIdentity:context:withError:",  v25,  v19,  v10,  a6);
      v35 = (id)objc_claimAutoreleasedReturnValue();
    }

    v18 = v35;
    v27 = v45;
  }

  else
  {
    rbs_general_log();
    v36 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      -[RBLaunchManager executeLaunchRequest:existingProcess:requestIdentity:withError:].cold.1();
    }

    if (a6)
    {
      _errorWithRequestCodeAndInfoBuilder((void *)*MEMORY[0x1896124B0], 5LL, @"Launch failed.", v27, 0LL);
      v18 = 0LL;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v18 = 0LL;
    }
  }

LABEL_38:
  return v18;
}

      v19 = 0LL;
      goto LABEL_43;
    }

    xpc_dictionary_set_string(v25, "_ManagedBy", "com.apple.runningboard");
    [v8 identity];
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    _addRBProperties(v25, v31, v8);

    [v8 identity];
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    [v32 personaString];
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
    {
      if (-[RBLaunchdJobManager _addPersonaFromExtensionContext:toServiceDict:]( self,  "_addPersonaFromExtensionContext:toServiceDict:",  v8,  v25))
      {
        if (-[RBLaunchdJobManager _addContainerPropertiesFromExtensionContext:toServiceDict:]( self,  "_addContainerPropertiesFromExtensionContext:toServiceDict:",  v8,  v25))
        {
          goto LABEL_18;
        }

        if (!a5) {
          goto LABEL_35;
        }
        v47 = @"Unable to launch extension (could not add container path to overlay)";
      }

      else
      {
        if (!a5) {
          goto LABEL_35;
        }
        v47 = @"Unable to launch extension (could not get persona values for overlay)";
      }

      _posixErrorWithCodeAndDescription(22LL, v47);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
}

LABEL_58:
  v48 = [v7 legacyFinishTaskReason];
  if (-[RBSLegacyAttribute _isLegacyReasonFinishableTask:]((BOOL)a1, v37) && v48 - 1 >= v37) {
    [v7 setLegacyFinishTaskReason:v37];
  }

LABEL_62:
}

LABEL_46:
      }

      goto LABEL_29;
    }

    v29 = @"Originator and target must be different processes";
LABEL_38:
    *a3 = v29;
    goto LABEL_39;
  }

  if (v6 != 4)
  {
LABEL_25:
    v24 = v6 - 16;
    if (v6 - 10000 <= 8)
    {
      if (((1LL << v24) & 0x194) != 0) {
        goto LABEL_27;
      }
      if (((1LL << v24) & 0x21) != 0)
      {
        [v5 originatorEntitlements];
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if ([v7 hasEntitlement:@"com.apple.backboard.client"]) {
          goto LABEL_29;
        }
        v25 = v7;
LABEL_28:
        if ([v25 hasEntitlementDomain:32])
        {
LABEL_29:

          goto LABEL_30;
        }

LABEL_37:
        v29 = @"Client is missing required entitlement";
        goto LABEL_38;
      }

      if (v6 == 10006)
      {
        [v5 originatorEntitlements];
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if ([v7 hasEntitlementDomain:32]) {
          goto LABEL_29;
        }
        [v5 originatorProcess];
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = [v27 isPlatformBinary];

        if ((v28 & 1) != 0) {
          goto LABEL_29;
        }
        goto LABEL_37;
      }
    }

    v26 = 0LL;
    *a3 = @"Invalid assertion reason provided";
    goto LABEL_41;
  }

  [v5 originatorProcess];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = [v5 targetProcess];
  if (v7 == (void *)v20)
  {

    goto LABEL_29;
  }

  v21 = (void *)v20;
  [v5 originatorEntitlements];
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v7 isPlatformBinary] & 1) != 0 || (objc_msgSend(v22, "hasEntitlementDomain:", 63))
  {
    v23 = 4;
  }

  else
  {
    [v5 entitlementManager];
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    [v31 entitlementsForProcess:v21];
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (([v21 isPlatformBinary] & 1) != 0
      || [v32 hasEntitlementDomain:63])
    {
      rbs_assertion_log();
      v33 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v40 = v7;
        v41 = 2114;
        v42 = v21;
        _os_log_impl( &dword_188634000,  v33,  OS_LOG_TYPE_DEFAULT,  "allowing legacy background task: untrusted process %{public}@ is targeting trusted process %{public}@",  buf,  0x16u);
      }

      v23 = 4;
    }

    else
    {
      *a3 = @"Originator and target must be the same process";
      v23 = 1;
    }
  }

  if (v23 != 4) {
    goto LABEL_40;
  }
LABEL_30:
  *a3 = 0LL;
  v26 = 1LL;
LABEL_41:

  return v26;
}

LABEL_20:
  return a1;
}

      [MEMORY[0x189603FE0] set];
      v66 = (id)objc_claimAutoreleasedReturnValue();
      v77 = 0u;
      v78 = 0u;
      v79 = 0u;
      v80 = 0u;
      obj = v7;
      v25 = [obj countByEnumeratingWithState:&v77 objects:v86 count:16];
      if (!v25) {
        goto LABEL_72;
      }
      v26 = v25;
      v71 = *(void *)v78;
LABEL_22:
      v27 = 0LL;
      while (1)
      {
        if (*(void *)v78 != v71) {
          objc_enumerationMutation(obj);
        }
        v28 = *(id *)(*((void *)&v77 + 1) + 8 * v27);
        v29 = (const char *)[v28 UTF8String];
        if (stat(v29, &buffer)) {
          break;
        }
        if ((buffer.st_mode & 0xF000) == 0x8000) {
          goto LABEL_30;
        }
        rbs_process_log();
        v37 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
        {
          v44 = *(void *)(v69 + 32);
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = v44;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v28;
          v39 = v37;
          v40 = "%{public}@ Not checking lock on special file: %{public}@";
          goto LABEL_49;
        }

  return v14;
}

void ___backgroundContentFetchingProcessAssertionDuration_block_invoke()
{
  _backgroundContentFetchingProcessAssertionDuration___backgroundContentFetchingProcessAssertionDuration = _positiveDoubleForDefault(@"BKBackgroundContentFetchingProcessAssertionDuration", 30.0);
}

double _positiveDoubleForDefault(const __CFString *a1, double a2)
{
  v3 = (const __CFNumber *)CFPreferencesCopyValue( a1,  @"com.apple.assertiond",  (CFStringRef)*MEMORY[0x189605198],  (CFStringRef)*MEMORY[0x189605178]);
  if (v3)
  {
    v4 = v3;
    CFTypeID v5 = CFGetTypeID(v3);
    if (v5 == CFNumberGetTypeID())
    {
      double valuePtr = 0.0;
      int Value = CFNumberGetValue(v4, kCFNumberDoubleType, &valuePtr);
      if (valuePtr > 0.0 && Value != 0) {
        a2 = valuePtr;
      }
    }

    CFRelease(v4);
  }

  return a2;
}

void ___backgroundTaskCompletionDurationAllowedAfterContentFetchingAssertion_block_invoke()
{
  _backgroundTaskCompletionDurationAllowedAfterContentFetchingAssertion___backgroundTaskCompletionDurationAllowedAfterContentFetchingAssertion = _positiveDoubleForDefault(@"BKBackgroundContentFetchingTaskCompletionDuration", 10.0);
}

void OUTLINED_FUNCTION_0( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

LABEL_8:
  return a4;
}

  return v19;
}

LABEL_7:
}

  os_unfair_lock_unlock(&self->_lock);

  return v5;
}

  v11 = 1LL;
LABEL_11:

LABEL_12:
  return v11;
}

    v17 = 0LL;
    goto LABEL_8;
  }

  v11 = [v7 copy];
  v12 = (void *)v8[2];
  v8[2] = v11;
  v13 = &OBJC_IVAR___RBTargetPropertyDomainRestriction__stringValue;
LABEL_6:

  v15 = *v13;
  v16 = *(void **)((char *)v8 + v15);
  *(void *)((char *)v8 + v15) = 0LL;

  v17 = v8;
LABEL_8:

  return v17;
}

LABEL_9:
}

  return v7;
}

  [MEMORY[0x189612338] stateWithProcess:v6];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[RBProcessState isBeingDebugged](self, "isBeingDebugged");
  v10 = -[RBProcessState inheritances](self, "inheritances");
  [v10 allNamespaces];
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  else {
    terminationResistance = 20LL;
  }
  [v8 setTerminationResistance:terminationResistance];
  tags = self->_tags;
  legacyAssertions = self->_legacyAssertions;
  primitiveAssertions = self->_primitiveAssertions;
  v16 = self->_endowmentInfos;
  v17 = primitiveAssertions;
  v18 = legacyAssertions;
  v19 = tags;
  if (v9) {
    v20 = 3LL;
  }
  else {
    v20 = 1LL;
  }
  [v8 setDebugState:v20];
  [v8 setTaskState:v7];
  [v8 setEndowmentNamespaces:v11];
  [v8 setTags:v19];
  [v8 setLegacyAssertions:v18];
  [v8 setPrimitiveAssertions:v17];
  [v8 setEndowmentInfos:v16];

  return v8;
}

    v14 = 0LL;
    goto LABEL_10;
  }

  v13 = -[RBAllEntitlementPredicate initWithDictionary:forDomain:attribute:errors:]( objc_alloc(&OBJC_CLASS___RBAllEntitlementPredicate),  "initWithDictionary:forDomain:attribute:errors:",  v9,  v10,  v11,  v12);
LABEL_6:
  v14 = v13;
LABEL_10:

  return v14;
}

  return a4;
}

  return v11;
}

  return a4;
}

void OUTLINED_FUNCTION_0_0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

void OUTLINED_FUNCTION_3( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_188638A58( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
}

LABEL_15:
        result = v5;
      }

      break;
  }

  return result;
}

    [v20 activate];
    goto LABEL_22;
  }

  if ((unint64_t)(v21 - 102) >= 2)
  {
    if (v21 != 101) {
      goto LABEL_22;
    }
    goto LABEL_12;
  }

  v26 = -[RBAssertionManager _lock_hasStartTimeDefiningAssertionsForTargetProcessIdentity:]( self,  "_lock_hasStartTimeDefiningAssertionsForTargetProcessIdentity:",  v16);
  rbs_ttl_log();
  v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  v27 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
  if (!v26)
  {
    if (!v27) {
      goto LABEL_15;
    }
    *(_DWORD *)buf = 138543362;
    v50 = v20;
    v25 = "Assertion %{public}@ will be created as active as no start-time-defining assertions exist";
    goto LABEL_14;
  }

  if (v27)
  {
    *(_DWORD *)buf = 138543362;
    v50 = v20;
    v28 = "Assertion %{public}@ will be created as inactive as start-time-defining assertions exist";
LABEL_20:
    _os_log_impl(&dword_188634000, v23, OS_LOG_TYPE_DEFAULT, v28, buf, 0xCu);
  }

    v8 = 0LL;
    goto LABEL_16;
  }

  if ([v6 isEqualToString:@"ActiveHardMemoryLimit"])
  {
    if (v9 >> 62 != 3) {
      goto LABEL_15;
    }
LABEL_20:
    if ((v9 & 0x3FFFFFFF00000000LL) == 0x3FFFFFFF00000000LL) {
      v10 = -1LL;
    }
    else {
      v10 = HIDWORD(v9) & 0x3FFFFFFF;
    }
    goto LABEL_23;
  }

  v8 = 0LL;
  if ([v6 isEqualToString:@"ActiveSoftMemoryLimit"]
    && (v9 & 0x8000000000000000LL) != 0
    && (v9 & 0x4000000000000000LL) == 0)
  {
    goto LABEL_20;
  }

          v7 = v23;
          CFTypeID v5 = v24;
          v11 = v22;
        }
      }

      else
      {
        v8 = 0LL;
      }
    }

    v6[2](v6, v8, v9);

    objc_autoreleasePoolPop(v7);
  }
}

      *v20 = personalPersonaUID;
      goto LABEL_16;
    }
  }

  else
  {
    v20 = v28;
  }

  if (objc_opt_class())
  {
    personalPersonaUID = self->_personalPersonaUID;
    v22 = self->_personalPersonaUniqueString;

    v14 = v22;
    if (!v20) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }

  v21 = 0;
LABEL_19:
  v24 = CFAbsoluteTimeGetCurrent();
  rbs_job_log();
  v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544386;
    *(void *)&buf[4] = v10;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "-[RBPersonaManager personaForIdentity:context:personaUID:personaUniqueString:]";
    *(_WORD *)&buf[22] = 2048;
    *(double *)&buf[24] = (v24 - Current) * 1000.0;
    *(_WORD *)&buf[32] = 1024;
    *(_DWORD *)&buf[34] = personalPersonaUID;
    *(_WORD *)&buf[38] = 2114;
    *(void *)&buf[40] = v14;
    _os_log_impl( &dword_188634000,  v25,  OS_LOG_TYPE_DEFAULT,  "%{public}@: %s required %f ms (wallclock); resolved to {%u, %{public}@}",
      buf,
      0x30u);
  }

  for (i = 1LL; i != -1; --i)
LABEL_24:

  return v21;
}

  v21 = 0;
LABEL_17:

  return v21;
}
  }

  os_unfair_lock_unlock(*v2 + 10);
}

  if (a4)
  {
    v10 = (void *)MEMORY[0x189607870];
    v11 = *MEMORY[0x1896123E0];
    v22[0] = *MEMORY[0x1896075F0];
    numberint Value = self->_numberValue;
    if (!numberValue) {
      numberint Value = (NSNumber *)self->_stringValue;
    }
    [NSString stringWithFormat:@"Target doesn't have %@='%@'", self->_property, numberValue];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v13;
    v22[1] = *MEMORY[0x1896123D8];
    v14 = -[RBTargetPropertyDomainRestriction description](self, "description");
    v23[1] = v14;
    [MEMORY[0x189603F68] dictionaryWithObjects:v23 forKeys:v22 count:2];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 errorWithDomain:v11 code:3 userInfo:v15];
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    LOBYTE(a4) = 0;
  }

void sub_1886396EC(_Unwind_Exception *a1)
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

void OUTLINED_FUNCTION_0_1( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_18863B9C4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, char a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, char a27)
{
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void OUTLINED_FUNCTION_0_2(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

  ;
}

void sub_18863E23C(_Unwind_Exception *a1)
{
}

LABEL_5:
    v9 = -[RBAssertionManager _invalidateAssertion:sync:](self, "_invalidateAssertion:sync:", v8, v5);
    goto LABEL_9;
  }

  os_unfair_lock_unlock(&self->_lock);
  if (v8) {
    goto LABEL_5;
  }
  rbs_assertion_log();
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138543362;
    v13 = v7;
    _os_log_impl( &dword_188634000,  v10,  OS_LOG_TYPE_DEFAULT,  "Ignoring invalidation request for %{public}@ because it doesn't exist",  (uint8_t *)&v12,  0xCu);
  }

  v9 = 0;
LABEL_9:

  return v9;
}

  return v31;
}

LABEL_23:
  }

  else
  {
    os_unfair_lock_unlock(&self->_lock);
    rbs_process_log();
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[RBAssertionManager isProcessForeground:].cold.1();
    }
    v21 = 0;
  }

  return v21;
}
      }

      v23 = [v3 countByEnumeratingWithState:&v30 objects:v37 count:16];
    }

    while (v23);
  }
}
  }

        [v12 specifiedIdentity];
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          [v12 specifiedIdentity];
          v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (v22) {
            goto LABEL_49;
          }
        }

        else if ([v12 isXPCService])
        {
          v23 = [v12 hostPid];
          if ((int)v23 < 1)
          {
            v25 = 0LL;
          }

          else
          {
            [MEMORY[0x189607968] numberWithInt:v23];
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = -[RBProcessManager processForIdentifier:](self, "processForIdentifier:", v24);
          }

          [v25 auditToken];
          uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = v27;
          if (v27)
          {
            [v27 realToken];
            v45 = buf;
            LODWORD(v20) = audit_token_to_euid(&v45);
            v45 = buf;
            v29 = audit_token_to_auid(&v45);
            if (v29 + 1 >= 2) {
              v20 = v29;
            }
            else {
              v20 = v20;
            }
            rbs_process_log();
            v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              v45.val[0] = 67109376;
              v45.val[1] = v10;
              LOWORD(v45.val[2]) = 1024;
              *(unsigned int *)((char *)&v45.val[2] + 2) = v20;
              _os_log_impl( &dword_188634000,  v30,  OS_LOG_TYPE_DEFAULT,  "_resolveProcessWithIdentifier pid %d host is auid %d",  (uint8_t *)&v45,  0xEu);
            }
          }

          v31 = (void *)MEMORY[0x1896122E8];
          [v12 executablePath];
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          [v25 instance];
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          [v12 uuid];
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          [v31 identityForXPCServiceExecutablePath:v32 pid:v10 auid:v20 host:v33 UUID:v34];
          v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();

          if (v22) {
            goto LABEL_49;
          }
        }

        else
        {
          [v12 resolvedIdentityWithPid:v10 auid:v20];
          v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (v22) {
            goto LABEL_49;
          }
          rbs_process_log();
          v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            buf.val[0] = 67109120;
            buf.val[1] = v10;
            _os_log_impl( &dword_188634000,  v26,  OS_LOG_TYPE_DEFAULT,  "Unable to obtain process properties from launchd for pid=%d",  (uint8_t *)&buf,  8u);
          }
        }

        if (RBSPIDExists())
        {
          RBSExecutablePathForPID();
          v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v36 = v35;
          if (v35) {
            goto LABEL_48;
          }
          v37 = RBSPIDExists();
          rbs_process_log();
          v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          v38 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
          if (v37)
          {
            if (v38)
            {
              buf.val[0] = 67109120;
              buf.val[1] = v10;
              _os_log_impl( &dword_188634000,  v22,  OS_LOG_TYPE_DEFAULT,  "RBSExecutablePathForPID couldn't get exec path for pid that exists, %d",  (uint8_t *)&buf,  8u);
            }

            v36 = @"no-exec-path";
LABEL_48:
            [MEMORY[0x1896122E8] identityForExecutablePath:v36 pid:v10 auid:v20];
            v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();

            if (!v22)
            {
              rbs_process_log();
              v41 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT)) {
                -[RBProcessManager _resolveProcessWithIdentifier:auditToken:properties:].cold.1(v10, v41);
              }
              v22 = 0LL;
              v13 = 0LL;
              goto LABEL_51;
            }
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

LABEL_13:
    v6 = v10;
    goto LABEL_14;
  }

  if (v7 != 2)
  {
    if (v7 != 3) {
      goto LABEL_14;
    }
    -[RBAssertionManager _lock_originatorExitTimeForAssertion:](self, "_lock_originatorExitTimeForAssertion:", v4);
    goto LABEL_13;
  }

  [v4 target];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 process];
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    timeProvider = self->_timeProvider;
    [v4 target];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 process];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBTimeProviding startTimeForProcess:](timeProvider, "startTimeForProcess:", v16);
    v6 = v17;
  }
    }
  }

  return a1;
}

  [*(id *)(a1 + 56) send];
}

    Current = CFAbsoluteTimeGetCurrent();
    -[RBContainerManager _fetchCache:](self, "_fetchCache:", v11);
    v23 = 0LL;
    v18 = -[RBContainerManager _lookupContainerPathForIdentity:context:persona:containerIdentifier:retry:error:]( self,  "_lookupContainerPathForIdentity:context:persona:containerIdentifier:retry:error:",  v10,  v11,  v12,  v13,  1LL,  &v23);
    v17 = v23;
    -[RBContainerManager _clearCache](self, "_clearCache");
    v20 = CFAbsoluteTimeGetCurrent();
    rbs_job_log();
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v25 = "-[RBContainerManager containerPathForIdentity:context:persona:error:]";
      v26 = 2048;
      uint64_t v27 = v20 - Current;
      _os_log_impl( &dword_188634000,  v21,  OS_LOG_TYPE_DEFAULT,  "%s: containermanager query required %f seconds wall clock time.",  buf,  0x16u);
    }

    if (a6 && v17)
    {
      v17 = v17;
      *a6 = v17;
    }

    goto LABEL_18;
  }

  rbs_job_log();
  v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v25 = v10;
    v26 = 2114;
    uint64_t v27 = *(double *)&v12;
    _os_log_impl( &dword_188634000,  v13,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Missing container identifier during container path look up, persona %{public}@",  buf,  0x16u);
  }

  v18 = 0LL;
LABEL_19:

  return v18;
}
  }
      v14 = -[os_log_s name](v6, "name");
      [v9 setObject:v6 forKey:v14];

      v10 = 0LL;
      goto LABEL_14;
    }

    goto LABEL_18;
  }

  if (xpc_BOOL_get_value(v5))
  {
    v7 = (void *)a1[4];
    [NSString stringWithUTF8String:a2];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 objectForKey:v8];
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v9 = (void *)a1[6];
      goto LABEL_13;
    }

    v10 = 0LL;
LABEL_18:
    v13 = 1LL;
    goto LABEL_16;
  }

  rbs_process_log();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
LABEL_19:
    v16 = *(void *)(a1[5] + 32LL);
    [v5 debugDescription];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543874;
    v19 = v16;
    v20 = 2080;
    v21 = a2;
    v22 = 2112;
    v23 = v17;
    _os_log_error_impl( &dword_188634000,  v6,  OS_LOG_TYPE_ERROR,  "%{public}@: LaunchRequestEndpointIdentifiers entry (%s) is malformed (expect only true or string mappings) - ignoring %@",  (uint8_t *)&v18,  0x20u);
  }

  if (v24)
  {
  }

  os_unfair_lock_unlock(p_lock);
  return v18;
}
}

LABEL_14:
  return v6;
}

  return a4;
}
    }
  }

        *a3 = v12;
        goto LABEL_15;
      }
    }

    a1 = v7;
    v12 = 0LL;
    if (!a3) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }

    *a3 = v11;
    goto LABEL_15;
  }
}

    -[RBAssertion terminationContextForTargetProcess:originatorProcessIsActive:].cold.1(v16);
    goto LABEL_15;
  }

  if (v8 == 1
    && -[RBAssertion terminateTargetOnOriginatorExit](self, "terminateTargetOnOriginatorExit")
    && (!v9 || !a4))
  {
    v23 = (void *)MEMORY[0x189612398];
    v24 = (void *)NSString;
    v25 = v9;
    if (!v9)
    {
      v25 = -[RBAssertion originator](self, "originator");
    }

    [v24 stringWithFormat:@"Terminating process %@ because the owner of this process %@ has exited (assertionID %@)", v6, v25, v7];
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    [v23 defaultContextWithExplanation:v26];
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9) {
    [v16 setExceptionCode:2970726673];
    }
    [v16 setReportType:0];
  }

  else
  {
    v16 = 0LL;
  }

void sub_188643C7C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_188643E74( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_188643F8C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_188644360( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

LABEL_12:
    rbs_ttl_log();
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v50 = v20;
      v25 = "Assertion %{public}@ will be created as active";
      goto LABEL_14;
    }

LABEL_13:
  v16 = v11;
  xpc_dictionary_set_string(v7, "Label", (const char *)-[__CFString UTF8String](v16, "UTF8String"));

  v17 = xpc_array_create(0LL, 0LL);
  v18 = [v43 _overrideExecutablePath];
  v19 = (const char *)[v18 fileSystemRepresentation];

  v40 = v9;
  v41 = v8;
  if (v19)
  {
    xpc_array_set_string(v17, 0xFFFFFFFFFFFFFFFFLL, v19);
    xpc_dictionary_set_string(v7, "Program", v19);
  }

  else
  {
    rbs_process_log();
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
      -[RBLaunchdJobManager _addSharedPropertiesToData:forIdentity:context:].cold.1(v43, v20);
    }
  }

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  [v43 arguments];
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = [v21 countByEnumeratingWithState:&v48 objects:v55 count:16];
  if (v22)
  {
    v23 = v22;
    v24 = *(void *)v49;
    do
    {
      for (i = 0LL; i != v23; ++i)
      {
        if (*(void *)v49 != v24) {
          objc_enumerationMutation(v21);
        }
        v26 = [*(id *)(*((void *)&v48 + 1) + 8 * i) description];
        xpc_array_set_string(v17, 0xFFFFFFFFFFFFFFFFLL, (const char *)[v26 UTF8String]);
      }

      v23 = [v21 countByEnumeratingWithState:&v48 objects:v55 count:16];
    }

    while (v23);
  }

  v42 = v7;
  xpc_dictionary_set_value(v7, "ProgramArguments", v17);
  uint64_t v27 = xpc_dictionary_create(0LL, 0LL, 0LL);
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  [v43 _additionalEnvironment];
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = [v28 countByEnumeratingWithState:&v44 objects:v54 count:16];
  if (v29)
  {
    v30 = v29;
    v31 = *(void *)v45;
    do
    {
      for (j = 0LL; j != v30; ++j)
      {
        if (*(void *)v45 != v31) {
          objc_enumerationMutation(v28);
        }
        v33 = *(void **)(*((void *)&v44 + 1) + 8 * j);
        [v43 _additionalEnvironment];
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        [v34 objectForKey:v33];
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        v36 = [v33 description];
        v37 = (const char *)[v36 UTF8String];
        v38 = [v35 description];
        xpc_dictionary_set_string(v27, v37, (const char *)[v38 UTF8String]);
      }

      v30 = [v28 countByEnumeratingWithState:&v44 objects:v54 count:16];
    }

    while (v30);
  }

  if ((v40 & 4) != 0)
  {
    rbs_job_log();
    v39 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v53 = v41;
      _os_log_impl( &dword_188634000,  v39,  OS_LOG_TYPE_DEFAULT,  "Launching %{public}@ to build DYLD closure. The new process will exit as soon as the operation completes.",  buf,  0xCu);
    }

    xpc_dictionary_set_string(v27, "DYLD_JUST_BUILD_CLOSURE", "1");
  }

  xpc_dictionary_set_value(v42, "EnvironmentVariables", v27);
  if (v40 < 0) {
    xpc_dictionary_set_BOOL(v42, "RunAtLoad", 1);
  }
}

LABEL_13:
  return v14;
}
}
}

  os_unfair_lock_unlock(&self->_lock);

  return v6;
}

  v10 = 0LL;
  v13 = 0LL;
LABEL_15:

LABEL_16:
  return v13;
}

LABEL_21:
  [v20 deactivate];
LABEL_22:
  [v15 identity];
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (([v20 startPolicy] == 103
     || [v20 startPolicy] == 101
     || [v20 startPolicy] == 102)
    && (-[NSMutableDictionary objectForKeyedSubscript:]( self->_relativeStartTimesByTargetIdentity,  "objectForKeyedSubscript:",  v29),  v30 = (void *)objc_claimAutoreleasedReturnValue(),  v30,  !v30))
  {
    v32 = (void *)MEMORY[0x189607968];
    -[RBTimeProviding currentTime](self->_timeProvider, "currentTime");
    objc_msgSend(v32, "numberWithDouble:");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_relativeStartTimesByTargetIdentity,  "setObject:forKeyedSubscript:",  v33,  v29);

    v31 = 1;
  }

  else
  {
    v31 = 0;
  }

  [v20 invalidationDuration];
  v35 = v34;
  -[RBAssertionManager _lock_invalidationTimeForAssertion:](self, "_lock_invalidationTimeForAssertion:", v20);
  if (v35 == 0.0 || (v37 = v36, -[RBTimeProviding currentTime](self->_timeProvider, "currentTime"), v37 > v38))
  {
    [v14 holdToken];
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    if (v39)
    {
      pluginHoldsForAssertions = self->_pluginHoldsForAssertions;
      [v14 holdToken];
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      [v20 identifier];
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](pluginHoldsForAssertions, "setObject:forKey:", v41, v42);
    }

    a8 = v20;
  }

  else
  {
    if (v31) {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_relativeStartTimesByTargetIdentity,  "setObject:forKeyedSubscript:",  0LL,  v29);
    }
    if (a8)
    {
      v43 = (void *)MEMORY[0x189607870];
      v44 = *MEMORY[0x1896123E0];
      v47[0] = *MEMORY[0x1896075F0];
      v47[1] = @"IgnoreOnReconnect";
      v48[0] = @"Assertion's invalidation time is in the past";
      v48[1] = MEMORY[0x189604A88];
      [MEMORY[0x189603F68] dictionaryWithObjects:v48 forKeys:v47 count:2];
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      [v43 errorWithDomain:v44 code:2 userInfo:v45];
      *a8 = (id)objc_claimAutoreleasedReturnValue();

      a8 = 0LL;
    }
  }

  return a8;
}
  }

      return;
    }

    rbs_ttl_log();
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      CFTypeID v5 = *(void *)(a1 + 32);
      v7 = 138543362;
      v8 = v5;
      _os_log_impl(&dword_188634000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Resuming task.", (uint8_t *)&v7, 0xCu);
    }

    RBPowerlogEvent(4LL, *(void **)(a1 + 16), 0xFFFFFFFFLL, *(unsigned int *)(a1 + 8));
    if (*(_BYTE *)(a1 + 77)
      && MEMORY[0x1896170A0]
      && spd_client_stop_monitoring_all_sockets_for_pid() == 5)
    {
      rbs_process_log();
      v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[RBProcess _lock_resume].cold.4();
      }
    }

    *(_BYTE *)(a1 + 129) = 0;
    if (!pid_resume())
    {
      rbs_process_log();
      v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
        -[RBProcess _lock_resume].cold.1();
      }
      goto LABEL_21;
    }

    if (*__error() == 3) {
      return;
    }
    if (*(void *)(a1 + 56))
    {
      rbs_process_log();
      v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
        -[RBProcess _lock_resume].cold.3();
      }
      goto LABEL_21;
    }

    if (*__error() != 1)
    {
      rbs_process_log();
      v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
        -[RBProcess _lock_resume].cold.2();
      }
      goto LABEL_21;
    }
  }

  return v16;
}

              v28 = 0LL;
              goto LABEL_22;
            }
          }

          else if ([v16 isEqualToString:@"TargetsHosted"])
          {
            [v6 targetIdentity];
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            [v21 hostIdentifier];
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = [v22 pid];
            [v6 originatorProcess];
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = v11;
            v26 = objc_msgSend(v24, "rbs_pid");

            uint64_t v27 = v23 == v26;
            v11 = v25;
            if (!v27)
            {
              v29 = v43;
              if (v43)
              {
                v30 = (void *)MEMORY[0x189607870];
                v31 = *MEMORY[0x1896123E0];
                v38 = *MEMORY[0x1896075F0];
                v49[0] = @"This domain attribute can only target processes hosted by the originator";
                v39 = *MEMORY[0x1896123D8];
                v48[0] = v38;
                v48[1] = v39;
                [v42 description];
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                v49[1] = v34;
                v35 = (void *)MEMORY[0x189603F68];
                v36 = v49;
                v37 = v48;
                goto LABEL_20;
              }

              goto LABEL_21;
            }
          }
        }

        v13 = [v11 countByEnumeratingWithState:&v44 objects:v52 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }

    v28 = 1LL;
LABEL_22:
  }

  else
  {
    v28 = 0LL;
  }

  return v28;
}

  return v16;
}

  return a1;
}

LABEL_40:
            goto LABEL_43;
          }

          v48 = v96;
          if (a6 == 1)
          {
            v53 = (void *)MEMORY[0x189607870];
            v116 = v80;
            v117 = @"Specified target process does not exist";
            [MEMORY[0x189603F68] dictionaryWithObjects:&v117 forKeys:&v116 count:1];
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            [v53 errorWithDomain:v81 code:2 userInfo:v54];
            v49 = (os_log_s *)objc_claimAutoreleasedReturnValue();

            [v82 setObject:v49 forKeyedSubscript:v89];
            goto LABEL_40;
          }

          [v83 addObject:v20];
          rbs_assertion_log();
          v49 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_40;
          }
          *(_DWORD *)buf = v75;
          v119 = v20;
          v50 = v49;
          v51 = "Silently discarding assertion acquired after target exited: %{public}@";
LABEL_52:
          v52 = 12;
LABEL_39:
          _os_log_impl(&dword_188634000, v50, OS_LOG_TYPE_DEFAULT, v51, buf, v52);
          goto LABEL_40;
        }

        rbs_assertion_log();
        v47 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        v48 = v96;
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v75;
          v119 = v20;
          _os_log_impl( &dword_188634000,  v47,  OS_LOG_TYPE_DEFAULT,  "Suspended assertion %{public}@ on acquisition",  buf,  0xCu);
        }

        [v20 suspend];
        -[RBAssertionManager _lock_addAssertion:](self, "_lock_addAssertion:", v20);
LABEL_43:

        v18 = v48 + 1;
      }

      while (v18 != v86);
      v55 = [obj countByEnumeratingWithState:&v111 objects:v125 count:16];
      v15 = v76;
      v86 = v55;
    }

    while (v55);
  }
  v97 = -[RBAssertionManager _lock_deactivateExistingAssertionsDelayedByIncomingAssertions:]( self,  "_lock_deactivateExistingAssertionsDelayedByIncomingAssertions:",  v16);
  objc_msgSend(v16, "unionSet:");
  v56 = v79;
  if ([v79 count])
  {
    v77 = v15;
    [MEMORY[0x189603FE0] set];
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v103 = 0u;
    v104 = 0u;
    v105 = 0u;
    v106 = 0u;
    v58 = v79;
    v59 = [v58 countByEnumeratingWithState:&v103 objects:v115 count:16];
    if (v59)
    {
      v60 = v59;
      v61 = *(void *)v104;
      do
      {
        for (j = 0LL; j != v60; ++j)
        {
          if (*(void *)v104 != v61) {
            objc_enumerationMutation(v58);
          }
          v63 = *(void **)(*((void *)&v103 + 1) + 8 * j);
          if (-[NSMutableSet containsObject:]( self->_acquiringAssertionIdentifiers,  "containsObject:",  v63))
          {
            -[NSMutableSet removeObject:](self->_acquiringAssertionIdentifiers, "removeObject:", v63);
            rbs_assertion_log();
            v64 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v119 = v63;
              _os_log_impl( &dword_188634000,  v64,  OS_LOG_TYPE_DEFAULT,  "Dropping unacquired identifier %{public}@",  buf,  0xCu);
            }
          }

          else
          {
            -[RBAssertionCollection assertionWithIdentifier:](self->_assertions, "assertionWithIdentifier:", v63);
            v64 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            rbs_assertion_log();
            v65 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v119 = v63;
              _os_log_impl(&dword_188634000, v65, OS_LOG_TYPE_DEFAULT, "Invalidating identifier %{public}@", buf, 0xCu);
            }

            if (v64)
            {
              -[os_log_s setInvalidationReason:](v64, "setInvalidationReason:", 3LL);
              [v57 addObject:v64];
            }

            else
            {
              rbs_assertion_log();
              v66 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                v119 = v63;
                _os_log_error_impl( &dword_188634000,  v66,  OS_LOG_TYPE_ERROR,  "Cannot invalidate unknown identifier %{public}@",  buf,  0xCu);
              }
            }
          }
        }

        v60 = [v58 countByEnumeratingWithState:&v103 objects:v115 count:16];
      }

      while (v60);
    }
    v67 = -[RBAssertionManager _lock_deactivateAssertions:](self, "_lock_deactivateAssertions:", v57);
    v16 = v87;
    [v87 unionSet:v67];
    [v83 unionSet:v57];

    v56 = v79;
    v15 = v77;
  }

  if ([v16 count])
  {
    v68 = v83;
    v69 = -[RBAssertionManager _lock_updateStatesDueToChangingAssertions:invalidatedAssertions:]( self,  "_lock_updateStatesDueToChangingAssertions:invalidatedAssertions:",  v16,  v83);
  }

  else
  {
    v69 = 0LL;
    v68 = v83;
  }

  if ([v68 count])
  {
    -[RBAssertionManager _lock_finalizeRemovingAssertions:](self, "_lock_finalizeRemovingAssertions:", v68);
    -[RBAssertionManager _lock_notifyDelegateOfInvalidatedAssertions:]( self,  "_lock_notifyDelegateOfInvalidatedAssertions:",  v68);
  }

  if ([v69 hasChanges])
  {
    v100[0] = MEMORY[0x1895F87A8];
    v100[1] = 3221225472LL;
    v100[2] = __140__RBAssertionManager__acquireAssertions_invalidateIdentifiers_forOriginatorProcess_completionPolicy_acquisitionErrorsByIndex_completeStage___block_invoke;
    v100[3] = &unk_18A255F90;
    v100[4] = self;
    v101 = v69;
    v70 = v15;
    v102 = v15;
    v71 = (void *)MEMORY[0x1895CA0E4](v100);
    [MEMORY[0x1896123C0] currentContext];
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = v72;
    if (a6 == 1 && v72)
    {
      [v72 handoffToQueue:self->_calloutQueue block:v71];
      os_unfair_lock_unlock(lock);
    }

    else
    {
      dispatch_async((dispatch_queue_t)self->_calloutQueue, v71);
      os_unfair_lock_unlock(lock);
      if (a6 == 1) {
        dispatch_sync((dispatch_queue_t)self->_calloutQueue, &__block_literal_global_105);
      }
    }

    v15 = v70;
    p_lock = &self->_lock;
  }

  else
  {
    p_lock = &self->_lock;
    os_unfair_lock_unlock(lock);
    (*((void (**)(id, uint64_t, void))v15 + 2))(v15, 1LL, 0LL);
  }

  os_unfair_lock_assert_not_owner(p_lock);
}

  rbs_general_log();
  v48 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
    -[RBLaunchdJobManager createAndLaunchWithIdentity:context:error:].cold.1();
  }

  if (!a5) {
    goto LABEL_52;
  }
  if (!v18)
  {
    v59 = (void *)MEMORY[0x189607870];
    v60 = *MEMORY[0x1896124C0];
    v102 = *MEMORY[0x1896075E0];
    [NSString stringWithFormat:@"Launchd job spawn failed to create job"];
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v103 = v61;
    [MEMORY[0x189603F68] dictionaryWithObjects:&v103 forKeys:&v102 count:1];
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    [v59 errorWithDomain:v60 code:0 userInfo:v62];
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    v18 = 0LL;
LABEL_52:
    v49 = 0LL;
    goto LABEL_81;
  }

  v18 = v18;
  v49 = 0LL;
  *a5 = v18;
LABEL_81:

  return v49;
}

  return v27;
}

void OUTLINED_FUNCTION_0_3(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

id _errorWithRequestCodeAndInfoBuilder(void *a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v9 = a1;
  id v10 = a3;
  id v11 = a4;
  v12 = a5;
  [MEMORY[0x189603FC8] dictionaryWithCapacity:2];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v10) {
    [v13 setObject:v10 forKey:*MEMORY[0x1896075F0]];
  }
  if (v11) {
    [v14 setObject:v11 forKey:*MEMORY[0x189607798]];
  }
  if (v12) {
    v12[2](v12, v14);
  }
  [MEMORY[0x189607870] errorWithDomain:v9 code:a2 userInfo:v14];
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

void OUTLINED_FUNCTION_1_3( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void _parseEntitlementConfigAndAddToRestrictedEntitlements(void *a1, void *a2)
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  id v3 = a1;
  id v4 = a2;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  uint64_t v23 = [v3 countByEnumeratingWithState:&v30 objects:v37 count:16];
  if (v23)
  {
    uint64_t v22 = *(void *)v31;
    *(void *)&__int128 v5 = 138412290LL;
    __int128 v20 = v5;
    id v21 = v3;
    do
    {
      for (uint64_t i = 0LL; i != v23; ++i)
      {
        if (*(void *)v31 != v22) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void *)(*((void *)&v30 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKeyedSubscript:", v7, v20);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        [v8 objectForKeyedSubscript:@"Type"];
        id v9 = (void *)objc_claimAutoreleasedReturnValue();
        if ([v9 isEqualToString:@"Daemon"])
        {
          v24 = v9;
          uint64_t v10 = [MEMORY[0x1896122E8] identityForDaemonJobLabel:v7];
LABEL_10:
          id v11 = (os_log_s *)v10;
          v25 = v8;
          [v8 objectForKeyedSubscript:@"Entitlements"];
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          __int128 v26 = 0u;
          __int128 v27 = 0u;
          __int128 v28 = 0u;
          __int128 v29 = 0u;
          uint64_t v13 = [v12 countByEnumeratingWithState:&v26 objects:v34 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = *(void *)v27;
            do
            {
              for (uint64_t j = 0LL; j != v14; ++j)
              {
                if (*(void *)v27 != v15) {
                  objc_enumerationMutation(v12);
                }
                uint64_t v17 = *(void *)(*((void *)&v26 + 1) + 8 * j);
                [v4 objectForKey:v17];
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                if (v18)
                {
                  v19 = v18;
                  [v18 addObject:v11];
                }

                else
                {
                  [MEMORY[0x189603FE0] setWithObject:v11];
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  [v4 setObject:v19 forKey:v17];
                }
              }

              uint64_t v14 = [v12 countByEnumeratingWithState:&v26 objects:v34 count:16];
            }

            while (v14);
          }

          id v3 = v21;
          id v9 = v24;
          v8 = v25;
          goto LABEL_23;
        }

        if ([v9 isEqualToString:@"App"])
        {
          v24 = v9;
          uint64_t v10 = [MEMORY[0x1896122E8] identityForEmbeddedApplicationIdentifier:v7 jobLabel:v7 auid:0 platform:6];
          goto LABEL_10;
        }

        rbs_general_log();
        id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = v20;
          uint64_t v36 = v7;
          _os_log_fault_impl( &dword_188634000,  v11,  OS_LOG_TYPE_FAULT,  "_parseEntitlementConfigAndAddToRestrictedEntitlements failed fetching type of identity %@",  buf,  0xCu);
        }

os_log_s *_getPlistInRunningBoardLibrary(void *a1)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v1 = a1;
  RBSPathForSystemDirectory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 stringByAppendingPathComponent:@"RunningBoard"];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringByAppendingPathComponent:v1];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  id v13 = 0LL;
  [MEMORY[0x189603F48] dataWithContentsOfFile:v4 options:8 error:&v13];
  __int128 v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = v13;
  if (v6)
  {
    id v7 = v6;
    rbs_general_log();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
LABEL_12:
      uint64_t v10 = 0LL;
      goto LABEL_13;
    }

    [v7 localizedDescription];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    uint64_t v15 = v9;
    _os_log_impl( &dword_188634000,  v8,  OS_LOG_TYPE_DEFAULT,  "_getPlistInRunningBoardLibrary skipped because NSData dataWithContentsOfFile resulted in %{public}@",  buf,  0xCu);
LABEL_11:

    goto LABEL_12;
  }

  id v12 = 0LL;
  [MEMORY[0x1896079E8] propertyListWithData:v5 options:0 format:0 error:&v12];
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  id v7 = v12;
  if (v7)
  {
    rbs_general_log();
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_FAULT)) {
      _getPlistInRunningBoardLibrary_cold_2(v7, (os_log_s *)v9);
    }
    goto LABEL_11;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    rbs_general_log();
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_FAULT)) {
      _getPlistInRunningBoardLibrary_cold_1();
    }
    goto LABEL_11;
  }

  v8 = v8;
  uint64_t v10 = v8;
LABEL_13:

  return v10;
}

id restrictedEntitlementsFromPlist()
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  [MEMORY[0x189603FC8] dictionary];
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  _getPlistInRunningBoardLibrary(@"runningboardEntitlementsConfiguration.plist");
  id v1 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = v1;
  if (v1)
  {
    _parseEntitlementConfigAndAddToRestrictedEntitlements(v1, v0);
  }

  else
  {
    rbs_general_log();
    v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
      restrictedEntitlementsFromPlist_cold_1(v2);
    }
  }

  _getPlistInRunningBoardLibrary(@"runningboardAdditionalEntitlementsConfiguration.plist");
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = v3;
  if (v3)
  {
    _parseEntitlementConfigAndAddToRestrictedEntitlements(v3, v0);
  }

  else
  {
    rbs_general_log();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_188634000,  v4,  OS_LOG_TYPE_INFO,  "RunningBoard did not find a secondary entitlements configuration at runningboardAdditionalEntitlementsConfiguration.plist",  buf,  2u);
    }
  }

  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x189604038]) initWithSuiteName:@"com.apple.runningboard"];
  [v15 objectForKey:@"AdditionalEntitlementsConfigurations"];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  _parseEntitlementConfigAndAddToRestrictedEntitlements(v14, v0);
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v5 = v0;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0LL; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        rbs_general_log();
        id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v10, v14);
          id v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          uint64_t v23 = v10;
          __int16 v24 = 2114;
          v25 = v12;
          _os_log_impl( &dword_188634000,  v11,  OS_LOG_TYPE_INFO,  "generated restrictions for entitlement %{public}@: %{public}@",  buf,  0x16u);
        }
      }

      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }

    while (v7);
  }

  return v5;
}

LABEL_18:
      ++v13;
    }

    while (v11 != v13);
    __int128 v19 = [v9 countByEnumeratingWithState:&v25 objects:v33 count:16];
    id v11 = v19;
  }

  while (v19);

  __int128 v20 = v24;
  if (v24) {
    [v9 minusSet:v24];
  }
  uint64_t v7 = v21;
  id v5 = v22;
LABEL_27:

LABEL_28:
}

    [v8 _overrideExecutablePath];
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v34)
    {
      logQueue = self->_logQueue;
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __63__RBLaunchdJobManager__createAndSubmitExtensionJob_UUID_error___block_invoke;
      block[3] = &unk_18A2561D8;
      id v9 = v9;
      v57 = v9;
      uint64_t v36 = v8;
      v58 = v36;
      v50 = v34;
      v51 = v34;
      v59 = v51;
      v37 = v12;
      v60 = v37;
      dispatch_async((dispatch_queue_t)logQueue, block);
      v49 = v36;
      uint64_t v38 = -[RBLaunchdInterfacing domainForPid:](self->_launchdInterface, "domainForPid:", [v36 hostPid]);
      launchdInterface = self->_launchdInterface;
      v55 = 0LL;
      v40 = -[RBLaunchdInterfacing submitExtension:overlay:domain:error:]( launchdInterface,  "submitExtension:overlay:domain:error:",  v51,  v37,  v38,  &v55);
      v41 = v55;
      v42 = v41;
      v53 = (void *)v38;
      if (v40)
      {
        if (v9 || ([v49 oneShotUUID], (id v9 = (id)objc_claimAutoreleasedReturnValue()) != 0))
        {
          v52 = v42;
          [v9 getUUIDBytes:v62];
          rbs_job_log();
          v43 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            *(void *)&uint8_t buf[4] = v9;
            _os_log_impl( &dword_188634000,  v43,  OS_LOG_TYPE_INFO,  "Setting one-shot instance on launch: %{public}@",  buf,  0xCu);
          }
          v44 = -[RBLaunchdInterfacing instancePropertiesFromOverlay:]( self->_launchdInterface,  "instancePropertiesFromOverlay:",  v10);
          v45 = self->_launchdInterface;
          v54 = 0LL;
          -[RBLaunchdInterfacing forJob:createInstance:properties:error:]( v45,  "forJob:createInstance:properties:error:",  v40,  v62,  v44,  &v54);
          __int128 v19 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = v54;

          if (a5 && !v19) {
            *a5 = v46;
          }
        }

        else
        {
          v46 = v42;
          __int128 v19 = v40;
        }
      }

      else if (a5)
      {
        v46 = v41;
        __int128 v19 = 0LL;
        *a5 = v46;
      }

      else
      {
        __int128 v19 = 0LL;
        v46 = v41;
      }

      v34 = v50;
    }

    else if (a5)
    {
      _posixErrorWithCodeAndDescription(22LL, @"Unable to launch extension without path");
      __int128 v19 = 0LL;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      __int128 v19 = 0LL;
    }

    goto LABEL_43;
  }

  if (a5)
  {
    __int128 v20 = (void *)MEMORY[0x189607870];
    __int128 v21 = *MEMORY[0x189607688];
    *(void *)buf = *MEMORY[0x1896075E0];
    v62[0] = @"Unable to launch extension without overlay";
    [MEMORY[0x189603F68] dictionaryWithObjects:v62 forKeys:buf count:1];
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
    [v20 errorWithDomain:v21 code:22 userInfo:v22];
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();

    __int128 v19 = 0LL;
    *a5 = v23;
  }

  else
  {
    __int128 v19 = 0LL;
  }

        goto LABEL_19;
      }
}

void OUTLINED_FUNCTION_3_0(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void sub_18864B120( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, char a21)
{
}

void OUTLINED_FUNCTION_0_4( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

LABEL_43:
      id v5 = 0LL;
    }
  }

LABEL_44:
  return v5;
}

LABEL_11:
  return v10;
}

  return a4;
}
}

LABEL_75:
  return 1;
}

void _addRBProperties(void *a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = xpc_dictionary_get_value(v5, "_AdditionalProperties");
  id v9 = (void *)v8;
  uint64_t v10 = MEMORY[0x1895F9250];
  if (!v8 || MEMORY[0x1895CA750](v8) != v10)
  {
    xpc_object_t empty = xpc_dictionary_create_empty();

    xpc_dictionary_set_value(v5, "_AdditionalProperties", empty);
    id v9 = empty;
  }

  uint64_t v12 = xpc_dictionary_get_value(v9, "RunningBoard");
  id v13 = (void *)v12;
  if (!v12 || MEMORY[0x1895CA750](v12) != v10)
  {
    xpc_object_t v14 = xpc_dictionary_create_empty();

    xpc_dictionary_set_value(v9, "RunningBoard", v14);
    id v13 = v14;
  }

  if (v6)
  {
    [v6 encodeForJob];
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      xpc_dictionary_set_value(v13, "RunningBoardLaunchedIdentity", v15);
    }

    else
    {
      rbs_job_log();
      uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        _addRBProperties_cold_1();
      }
    }
  }

  xpc_dictionary_set_BOOL(v13, "RunningBoardLaunched", 1);
  xpc_dictionary_get_value(v13, "Managed");
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 beforeTranslocationBundlePath];
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    id v19 = [v7 beforeTranslocationBundlePath];
    xpc_dictionary_set_string(v13, "BeforeTranslocationBundlePath", (const char *)[v19 UTF8String]);
  }

  [v7 homeDirectory];
  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    id v21 = [v7 homeDirectory];
    xpc_dictionary_set_string(v13, "HOME", (const char *)[v21 UTF8String]);
  }

  [v7 tmpDirectory];
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    id v23 = [v7 tmpDirectory];
    xpc_dictionary_set_string(v13, "TMPDIR", (const char *)[v23 UTF8String]);
  }

  [v7 spawnConstraint];
  __int16 v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    [v7 spawnConstraint];
    uint64_t v25 = _CFXPCCreateXPCObjectFromCFObject();
    __int128 v26 = (void *)v25;
    if (!v25 || MEMORY[0x1895CA750](v25) != v10)
    {
      rbs_job_log();
      uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        [v7 spawnConstraint];
        __int128 v28 = (void *)objc_claimAutoreleasedReturnValue();
        int v29 = 138543618;
        id v30 = v6;
        __int16 v31 = 2114;
        __int128 v32 = v28;
        _os_log_impl( &dword_188634000,  v27,  OS_LOG_TYPE_DEFAULT,  "%{public}@ failed to set spawn constraint for job: %{public}@",  (uint8_t *)&v29,  0x16u);
      }
    }

    xpc_dictionary_set_value(v5, "SpawnConstraint", v26);
  }
}

LABEL_67:
  return v61;
}

id _posixErrorWithCodeAndDescription(uint64_t a1, void *a2)
{
  v11[1] = *MEMORY[0x1895F89C0];
  id v3 = (void *)MEMORY[0x189607870];
  uint64_t v4 = *MEMORY[0x189607688];
  uint64_t v10 = *MEMORY[0x1896075E0];
  v11[0] = a2;
  id v5 = (void *)MEMORY[0x189603F68];
  id v6 = a2;
  [v5 dictionaryWithObjects:v11 forKeys:&v10 count:1];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 errorWithDomain:v4 code:a1 userInfo:v7];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id _describeXPCObject()
{
  v0 = (void *)MEMORY[0x1895CA66C]();
  [NSString stringWithUTF8String:v0];
  id v1 = (void *)objc_claimAutoreleasedReturnValue();
  free(v0);
  return v1;
}

LABEL_45:
  return v19;
}

LABEL_61:
      uint64_t v38 = (id)v54;
      int v29 = v40;
      a5 = v39;
      self = v83;
LABEL_62:
      if (!v38)
      {
        objc_msgSend(MEMORY[0x1896122E0], "identifierWithPid:", objc_msgSend(v28, "pid"));
        v74 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (v29)
        {
          os_unfair_lock_lock(&self->_lock);
          -[NSMutableDictionary setObject:forKey:](self->_lock_jobsByIdentifier, "setObject:forKey:", v15, v74);
          os_unfair_lock_unlock(&self->_lock);
        }

        [MEMORY[0x189612300] instanceWithIdentifier:v74 identity:v8];
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v73 = 0LL;
        id v9 = v86;
        goto LABEL_79;
      }

LABEL_63:
      rbs_general_log();
      v70 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
        -[RBLaunchdJobManager createAndLaunchWithIdentity:context:error:].cold.3();
      }

      id v9 = v86;
      if (a5) {
        *a5 = v38;
      }
      if (!v29)
      {
        v49 = 0LL;
        goto LABEL_80;
      }

      rbs_general_log();
      v71 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_188634000, v71, OS_LOG_TYPE_INFO, "Removing job after failed start", buf, 2u);
      }

      v87 = v38;
      v72 = -[os_log_s remove:](v15, "remove:", &v87);
      v73 = v87;

      if ((v72 & 1) != 0)
      {
        v49 = 0LL;
        uint64_t v38 = v73;
        id v9 = v86;
LABEL_80:

        __int128 v18 = v38;
        goto LABEL_81;
      }

      rbs_general_log();
      v74 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR)) {
        -[RBLaunchdJobManager createAndLaunchWithIdentity:context:error:].cold.2();
      }
      v49 = 0LL;
      id v9 = v86;
LABEL_79:

      uint64_t v38 = v73;
      goto LABEL_80;
    }

    goto LABEL_40;
  }

  v90 = 0LL;
  v91 = 0LL;
  -[RBLaunchdJobManager _createLaunchdJobWithIdentity:context:actualIdentity:error:]( self,  "_createLaunchdJobWithIdentity:context:actualIdentity:error:",  v8,  v9,  &v91,  &v90);
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  __int16 v24 = v91;
  __int128 v18 = v90;
  if (_os_feature_enabled_impl() && v24 && v24 != v8 && ([v24 isEqual:v8] & 1) == 0)
  {
    rbs_job_log();
    uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v8;
      v105 = 2114;
      v106 = v24;
      _os_log_impl( &dword_188634000,  v25,  OS_LOG_TYPE_DEFAULT,  "Adjusting identity of job from %{public}@ to %{public}@",  buf,  0x16u);
    }

    __int128 v26 = v24;
    uint64_t v8 = v26;
  }

  if (v15)
  {
    v86 = v9;
    v89 = v18;
    uint64_t v27 = &v89;
    -[os_log_s submitAndStart:](v15, "submitAndStart:", &v89);
    __int128 v28 = (void *)objc_claimAutoreleasedReturnValue();
    int v29 = 1;
    goto LABEL_34;
  }

void sub_188654CE0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, char a39)
{
}

LABEL_26:
        uint64_t v33 = *(void **)(a1 + 48);
        [*(id *)(a1 + 32) identity];
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        [v33 _addReslideIdentityIfNeeded:v34 exitStatus:v14];

        _handleDeath(*(void **)(a1 + 32), *(void **)(a1 + 56), v14);
        [*(id *)(a1 + 40) cancelMonitor];
        break;
      default:
        rbs_general_log();
        xpc_object_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
          __60__RBLaunchdJobManager_invokeOnProcessDeath_handler_onQueue___block_invoke_cold_2(a1, v6, v14);
        }
        break;
    }

  return v20;
}

LABEL_29:
    goto LABEL_30;
  }

  rbs_general_log();
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  xpc_object_t v14 = v13;
  if (a3 != 113)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      __60__RBLaunchdJobManager_invokeOnProcessDeath_handler_onQueue___block_invoke_cold_1( a1,  v14,  v16,  v17,  v18,  v19,  v20,  v21);
    }
    goto LABEL_29;
  }

  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = *(void **)(a1 + 32);
    v35 = 138543362;
    uint64_t v36 = v15;
    _os_log_impl( &dword_188634000,  v14,  OS_LOG_TYPE_DEFAULT,  "%{public}@ job reported to RB as removed",  (uint8_t *)&v35,  0xCu);
  }

  _handleDeath(*(void **)(a1 + 32), *(void **)(a1 + 56), 0LL);
  [*(id *)(a1 + 40) cancelMonitor];
LABEL_30:
}
}

void _handleDeath(void *a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v5 = a1;
  id v6 = a3;
  id v7 = a2;
  rbs_ttl_log();
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v9)
    {
      int v10 = 138544130;
      id v11 = v5;
      __int16 v12 = 1024;
      int v13 = objc_msgSend(v6, "os_reason_namespace");
      __int16 v14 = 2048;
      uint64_t v15 = objc_msgSend(v6, "os_reason_code");
      __int16 v16 = 1024;
      int v17 = [v6 wait4Status];
      _os_log_impl( &dword_188634000,  v8,  OS_LOG_TYPE_DEFAULT,  "%{public}@ termination reported by launchd (%u, %llu, %u)",  (uint8_t *)&v10,  0x22u);
    }

    objc_msgSend( MEMORY[0x1896122B8],  "exitContextForNamespace:code:wait4Status:",  objc_msgSend(v6, "os_reason_namespace"),  objc_msgSend(v6, "os_reason_code"),  objc_msgSend(v6, "wait4Status"));
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    [v5 setLastExitContext:v8];
  }

  else if (v9)
  {
    int v10 = 138543362;
    id v11 = v5;
    _os_log_impl( &dword_188634000,  v8,  OS_LOG_TYPE_DEFAULT,  "%{public}@ termination reported by launchd without exit status",  (uint8_t *)&v10,  0xCu);
  }

  v7[2](v7);
}

void ___synchronizeJobsQueue_block_invoke()
{
  v2 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.runningboardservices.synchronizeJobs", v2);
  id v1 = (void *)_synchronizeJobsQueue_queue;
  _synchronizeJobsQueue_queue = (uint64_t)v0;
}

void OUTLINED_FUNCTION_0_5( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void OUTLINED_FUNCTION_6(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
}

  ;
}

  ;
}

  ;
}

_BYTE *OUTLINED_FUNCTION_11(_BYTE *result, _BYTE *a2)
{
  *result = 0;
  *a2 = 0;
  return result;
}

uint64_t OUTLINED_FUNCTION_12()
{
  return [v0 state];
}

void OUTLINED_FUNCTION_13(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

LABEL_19:
        return;
      }

      rbs_process_log();
      id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v3, OS_LOG_TYPE_INFO)) {
        goto LABEL_19;
      }
      __int16 v12 = *(void *)(a1 + 32);
      uint64_t v15 = 138543618;
      __int16 v16 = v12;
      int v17 = 2048;
      uint64_t v18 = _applyJetsamLenientModeState__count;
      id v5 = "%{public}@ Tried to disable jetsam lenient mode but it is still in use (count %lu)";
LABEL_17:
      id v6 = v3;
      id v7 = OS_LOG_TYPE_INFO;
      uint64_t v8 = 22;
      goto LABEL_18;
    }

    ++_applyJetsamLenientModeState__count;
    os_unfair_lock_unlock((os_unfair_lock_t)&_applyJetsamLenientModeState__lock);
    if (v10)
    {
      rbs_process_log();
      id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v3, OS_LOG_TYPE_INFO)) {
        goto LABEL_19;
      }
      id v11 = *(void *)(a1 + 32);
      uint64_t v15 = 138543618;
      __int16 v16 = v11;
      int v17 = 2048;
      uint64_t v18 = _applyJetsamLenientModeState__count;
      id v5 = "%{public}@ Tried to enable jetsam lenient mode but it is already enabled (count %lu)";
      goto LABEL_17;
    }

    if (!memorystatus_control())
    {
      rbs_process_log();
      id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_19;
      }
      __int16 v14 = *(void *)(a1 + 32);
      uint64_t v15 = 138543362;
      __int16 v16 = v14;
      id v5 = "%{public}@ Enabled jetsam lenient mode";
      goto LABEL_5;
    }

    if (*__error() != 3)
    {
      rbs_process_log();
      id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        -[RBProcess _applyJetsamLenientModeState:].cold.1();
      }
      goto LABEL_19;
    }
  }

      __int128 v32 = 0LL;
      goto LABEL_17;
    }
  }

  [v6 domainAttributeManager];
  __int128 v28 = (void *)objc_claimAutoreleasedReturnValue();
  [a1 domain];
  int v29 = (void *)objc_claimAutoreleasedReturnValue();
  [a1 name];
  id v30 = (void *)objc_claimAutoreleasedReturnValue();
  [v28 originatorEntitlementsForDomain:v29 andName:v30];
  int v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    __int128 v32 = 1LL;
    goto LABEL_16;
  }

  [v6 originatorEntitlements];
  __int16 v31 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v32 = [v17 matchesEntitlements:v31];

  if (!a3 || (v32 & 1) != 0) {
    goto LABEL_16;
  }
  uint64_t v33 = (void *)MEMORY[0x189607870];
  v34 = *MEMORY[0x1896123E0];
  v35 = *MEMORY[0x1896075F0];
  v39[0] = @"Required client entitlement is missing";
  uint64_t v36 = *MEMORY[0x1896123D8];
  v38[0] = v35;
  v38[1] = v36;
  [a1 description];
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  v39[1] = v18;
  [MEMORY[0x189603F68] dictionaryWithObjects:v39 forKeys:v38 count:2];
  __int16 v24 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v25 = v33;
  __int128 v26 = v34;
  uint64_t v27 = 3LL;
LABEL_14:
  [v25 errorWithDomain:v26 code:v27 userInfo:v24];
  *a3 = (id)objc_claimAutoreleasedReturnValue();

  __int128 v32 = 0LL;
LABEL_16:

LABEL_17:
LABEL_18:

  return v32;
}

    a1 = (void *)[v9 copy];
    goto LABEL_20;
  }

LABEL_6:
  rbs_process_log();
  int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  __int16 v14 = 1LL;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v15 = a1[4];
    uint64_t v18 = 138543362;
    id v19 = v15;
    _os_log_impl(&dword_188634000, v13, OS_LOG_TYPE_INFO, "%{public}@ Stackshot complete", (uint8_t *)&v18, 0xCu);
  }

  return a1;
}
}
}
}

LABEL_27:
      return;
    }

    v2 = *(void **)(a1 + 56);
    if (v2) {
      id v3 = [v2 role];
    }
    else {
      id v3 = 1;
    }
    uint64_t v4 = [*(id *)(a1 + 64) role];
    id v5 = v4;
    if (!*(void *)(a1 + 56) || v3 != v4)
    {
      id v6 = RBSDarwinRoleFromRBSRole();
      if (!setpriority(6, *(_DWORD *)(a1 + 8), v6))
      {
        rbs_ttl_log();
        uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          __int128 v20 = *(void *)(a1 + 32);
          NSStringFromRBSRole();
          id v21 = (void *)objc_claimAutoreleasedReturnValue();
          id v23 = 138543618;
          __int16 v24 = v20;
          uint64_t v25 = 2114;
          *(void *)__int128 v26 = v21;
          _os_log_impl( &dword_188634000,  v15,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Set darwin role to: %{public}@",  (uint8_t *)&v23,  0x16u);
        }

        goto LABEL_27;
      }

      if (*__error() == 3) {
        return;
      }
      rbs_process_log();
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = *(void *)(a1 + 32);
        BOOL v9 = *__error();
        NSStringFromRBSRole();
        int v10 = (void *)objc_claimAutoreleasedReturnValue();
        id v11 = __error();
        __int16 v12 = strerror(*v11);
        id v23 = 138544130;
        __int16 v24 = v8;
        uint64_t v25 = 1024;
        *(_DWORD *)__int128 v26 = v9;
        *(_WORD *)&v26[4] = 2114;
        *(void *)&v26[6] = v10;
        uint64_t v27 = 2080;
        __int128 v28 = v12;
        _os_log_impl( &dword_188634000,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Result %d setting darwin role to %{public}@: %s, falling back to setting priority",  (uint8_t *)&v23,  0x26u);
      }

      int v13 = (v5 < 3) << 12;
      if (v5 >= 3) {
        __int16 v14 = @"PRIO_DEFAULT";
      }
      else {
        __int16 v14 = @"PRIO_DARWIN_BG";
      }
      if (setpriority(4, *(_DWORD *)(a1 + 8), v13))
      {
        if (*__error() == 3) {
          return;
        }
        rbs_process_log();
        uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          -[RBProcess _lock_applyRole].cold.1(a1, (uint64_t)v14, v15);
        }
        goto LABEL_27;
      }

      rbs_ttl_log();
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v22 = *(void *)(a1 + 32);
        id v23 = 138543618;
        __int16 v24 = v22;
        uint64_t v25 = 2114;
        *(void *)__int128 v26 = v14;
        int v17 = "%{public}@ Set darwin priority to: %{public}@";
        uint64_t v18 = v15;
        id v19 = 22;
        goto LABEL_22;
      }

      goto LABEL_27;
    }
  }

      uint64_t v15 = -[RBTargetPropertyDomainRestriction _initWithProperty:value:]( objc_alloc(&OBJC_CLASS___RBTargetPropertyDomainRestriction),  "_initWithProperty:value:",  v6,  v7);
      int v10 = 0LL;
      goto LABEL_28;
    }

    if (a4)
    {
      __int16 v16 = (void *)MEMORY[0x189607870];
      uint64_t v27 = *MEMORY[0x1896075F0];
      [NSString stringWithFormat:@"RBTargetPropertyDomainRestriction doesn't specify value: %@", v5];
      int v17 = (void *)objc_claimAutoreleasedReturnValue();
      __int128 v28 = v17;
      uint64_t v18 = (void *)MEMORY[0x189603F68];
      id v19 = &v28;
      __int128 v20 = &v27;
      goto LABEL_21;
    }
  }

  else if (a4)
  {
    __int16 v16 = (void *)MEMORY[0x189607870];
    int v29 = *MEMORY[0x1896075F0];
    [NSString stringWithFormat:@"RBTargetPropertyDomainRestriction doesn't specify property: %@", v5];
    int v17 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v17;
    uint64_t v18 = (void *)MEMORY[0x189603F68];
    id v19 = (void **)v30;
    __int128 v20 = &v29;
LABEL_21:
    [v18 dictionaryWithObjects:v19 forKeys:v20 count:1];
    id v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 errorWithDomain:@"RBDomainAttributeManagerDataProviderErrorDomain" code:1 userInfo:v21];
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();

    int v10 = v22;
    uint64_t v15 = 0LL;
    *a4 = v10;
LABEL_28:

    goto LABEL_29;
  }

  uint64_t v15 = 0LL;
LABEL_29:

  return v15;
}

LABEL_17:
      return;
    }

    rbs_ttl_log();
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      id v11 = v5;
      _os_log_impl(&dword_188634000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Suspending task.", buf, 0xCu);
    }

    RBPowerlogEvent(3LL, *(void **)(a1 + 16), 0xFFFFFFFFLL, *(unsigned int *)(a1 + 8));
    if (*(_BYTE *)(a1 + 77)
      && MEMORY[0x189617098]
      && spd_client_start_monitoring_all_sockets_for_pid() == 5)
    {
      rbs_process_log();
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[RBProcess _lock_suspend].cold.3();
      }
    }

    if (pid_suspend())
    {
      if (*__error() == 3) {
        return;
      }
      rbs_process_log();
      v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
        -[RBProcess _lock_suspend].cold.2();
      }
      goto LABEL_17;
    }

    *(_BYTE *)(a1 + 129) = 1;
    if (notify_suspend_pid())
    {
      rbs_process_log();
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[RBProcess _lock_suspend].cold.1();
      }
    }

    uint64_t v8 = (dispatch_queue_s *)[MEMORY[0x1896123B0] sharedBackgroundWorkloop];
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __26__RBProcess__lock_suspend__block_invoke;
    block[3] = &unk_18A255C70;
    block[4] = a1;
    dispatch_async(v8, block);

    -[RBProcess _lock_shutdownSocketsAndLog:](a1, 1);
  }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)*v2 + 10);
}
    }

    else
    {
      uint64_t v18 = 0LL;
    }

    if (!a3) {
      goto LABEL_20;
    }
  }

  else
  {
    uint64_t v18 = 1LL;
    if (!a3) {
      goto LABEL_20;
    }
  }

  *a3 = v10 != 0LL;
LABEL_20:

LABEL_21:
  return v18;
}

LABEL_51:
        goto LABEL_52;
      }

      [v54 addObject:v24];
      rbs_process_log();
      __int128 v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
        -[RBProcess _allowedLockedFilePaths].cold.2();
      }
    }

    else
    {
      rbs_process_log();
      __int128 v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v35 = *__error();
        *(_DWORD *)buf = 138543874;
        v65 = v7;
        v66 = 1024;
        v67 = v18;
        v68 = 1024;
        v69 = v35;
        _os_log_impl( &dword_188634000,  v26,  OS_LOG_TYPE_DEFAULT,  "%{public}@: no passwd data for ruid %d (errno %d)",  buf,  0x18u);
      }

      __int16 v24 = v16;
    }

    goto LABEL_41;
  }

  return 0LL;
}

LABEL_56:
            goto LABEL_57;
          }

          if (v38)
          {
            buf.val[0] = 67109120;
            buf.val[1] = v10;
            v43 = "Can't lookup pid %d because it does not exist anymore";
            goto LABEL_54;
          }
        }

        else
        {
          rbs_process_log();
          uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            buf.val[0] = 67109120;
            buf.val[1] = v10;
            v43 = "Can't lookup pid %d because it does not exist";
LABEL_54:
            _os_log_impl(&dword_188634000, v22, OS_LOG_TYPE_DEFAULT, v43, (uint8_t *)&buf, 8u);
          }
        }

        int v13 = 0LL;
        goto LABEL_56;
      }

      rbs_process_log();
      int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
        -[RBProcessManager _resolveProcessWithIdentifier:auditToken:properties:].cold.2((uint64_t)v8, v10, v17);
      }
    }

    __int128 v20 = 0LL;
    goto LABEL_23;
  }

  int v13 = 0LL;
LABEL_57:

  return v13;
}

LABEL_50:
LABEL_51:
        if (++v27 == v26)
        {
          v61 = [obj countByEnumeratingWithState:&v77 objects:v86 count:16];
          __int128 v26 = v61;
          if (!v61)
          {
LABEL_72:
            v62 = (os_log_s *)obj;

            free(v64);
            goto LABEL_76;
          }

          goto LABEL_22;
        }
      }

      rbs_process_log();
      id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v46 = *(void *)(v69 + 32);
        v47 = __error();
        v48 = strerror(*v47);
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = v46;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v28;
        *(_WORD *)&buf[22] = 2082;
        *(void *)&buf[24] = v48;
        _os_log_error_impl( &dword_188634000,  v30,  OS_LOG_TYPE_ERROR,  "%{public}@ Could not stat %{public}@: %{public}s",  buf,  0x20u);
      }

LABEL_30:
      v75 = 0u;
      v76 = 0u;
      v73 = 0u;
      v74 = 0u;
      __int16 v31 = v70;
      __int128 v32 = [v31 countByEnumeratingWithState:&v73 objects:v85 count:16];
      if (v32)
      {
        uint64_t v33 = v32;
        v34 = *(void *)v74;
LABEL_32:
        v35 = 0LL;
        while (1)
        {
          if (*(void *)v74 != v34) {
            objc_enumerationMutation(v31);
          }
          uint64_t v36 = *(void *)(*((void *)&v73 + 1) + 8 * v35);
          if (v33 == ++v35)
          {
            uint64_t v33 = [v31 countByEnumeratingWithState:&v73 objects:v85 count:16];
            if (v33) {
              goto LABEL_32;
            }
            goto LABEL_38;
          }
        }

        rbs_process_log();
        v41 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          v42 = *(void *)(v69 + 32);
          *(_DWORD *)buf = 138543874;
          *(void *)&uint8_t buf[4] = v42;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v28;
          *(_WORD *)&buf[22] = 2114;
          *(void *)&buf[24] = v36;
          _os_log_impl( &dword_188634000,  v41,  OS_LOG_TYPE_INFO,  "%{public}@: Ignoring file %{public}@ because it is in an allowed path:  %{public}@",  buf,  0x20u);
        }

        rbs_process_log();
        v37 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
        {
          v43 = *(void *)(v69 + 32);
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v43;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v28;
          v39 = v37;
          v40 = "%{public}@: Ignoring file because it is in an allowed path: %{public}@";
          goto LABEL_49;
        }

        goto LABEL_50;
      }

LABEL_38:
      if (([v28 hasSuffix:@"-shm"] & 1) != 0
        || ([v28 hasSuffix:@"-wal"] & 1) != 0
        || [v28 hasSuffix:@"-journal"])
      {
        rbs_process_log();
        v37 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
        {
          uint64_t v38 = *(void *)(v69 + 32);
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v38;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v28;
          v39 = v37;
          v40 = "%{public}@ Ignoring SQLite journal file: %{public}@";
LABEL_49:
          _os_log_impl(&dword_188634000, v39, OS_LOG_TYPE_INFO, v40, buf, 0x16u);
          goto LABEL_50;
        }
      }

      else
      {
        value = 0;
        if (getxattr(v29, "com.apple.runningboard.can-suspend-locked", 0LL, 0LL, 0, 0) == 1) {
          getxattr(v29, "com.apple.runningboard.can-suspend-locked", &value, 1uLL, 0, 0);
        }
        if (value)
        {
          rbs_process_log();
          v37 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v37, OS_LOG_TYPE_INFO)) {
            goto LABEL_50;
          }
          v45 = *(void *)(v69 + 32);
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v45;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v28;
          v39 = v37;
          v40 = "%{public}@ Ignoring file with can-suspend-locked: %{public}@";
          goto LABEL_49;
        }

        v49 = _sqlite3_lockstate();
        if (v49)
        {
          if (v49 == 1)
          {
            rbs_process_log();
            v50 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
            {
              v51 = *(void *)(v69 + 32);
              *(_DWORD *)buf = 138543618;
              *(void *)&uint8_t buf[4] = v51;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v28;
              v52 = buf;
              v53 = v50;
              v54 = OS_LOG_TYPE_INFO;
              v55 = "%{public}@ Found locked SQLite database: %{public}@";
              goto LABEL_62;
            }
          }

          else
          {
            *(void *)&buf[8] = 0LL;
            *(_DWORD *)&buf[20] = 3;
            *(void *)buf = 0LL;
            *(_DWORD *)&buf[16] = pid;
            v57 = open(v29, 0x20000);
            if (v57 < 1) {
              goto LABEL_51;
            }
            v58 = v57;
            v59 = fcntl(v57, 66, buf);
            close(v58);
            if (v59 == -1 || (*(_WORD *)&buf[20] & 0xFFFD) != 1) {
              goto LABEL_51;
            }
            rbs_process_log();
            v50 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
            {
              v60 = *(void *)(v69 + 32);
              v81 = 138543618;
              v82 = v60;
              v83 = 2114;
              v84 = v28;
              v52 = (uint8_t *)&v81;
              v53 = v50;
              v54 = OS_LOG_TYPE_DEFAULT;
              v55 = "%{public}@ Found locked file lock: %{public}@";
LABEL_62:
              _os_log_impl(&dword_188634000, v53, v54, v55, v52, 0x16u);
            }
          }

          [v66 addObject:v28];
          goto LABEL_51;
        }

        rbs_process_log();
        v37 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
        {
          v56 = *(void *)(v69 + 32);
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v56;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v28;
          v39 = v37;
          v40 = "%{public}@ Ignoring unlocked SQLite database: %{public}@";
          goto LABEL_49;
        }
      }

      goto LABEL_50;
    }

    rbs_process_log();
    v62 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR)) {
      -[RBProcess _lock_lockedFilePathsIgnoring:].cold.1();
    }
    v66 = 0LL;
LABEL_76:
  }

  else
  {
    v66 = 0LL;
  }

  return v66;
}

          -[RBAssertionDescriptorValidator _flattenedAttributesFromContext:](self, v7);
          uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v27 = +[RBAssertionDescriptorValidator checkConflictingAttributes:error:]( &OBJC_CLASS___RBAssertionDescriptorValidator,  "checkConflictingAttributes:error:",  v36,  a4);

LABEL_39:
          __int16 v14 = v52;
          goto LABEL_40;
        }

        id v7 = v33;
        a4 = v32;
      }
    }

    goto LABEL_38;
  }

  if (a4)
  {
    -[RBAssertionDescriptorValidator _errorWithDescription:]( (uint64_t)self,  @"Cannot acquire an assertion with no attributes");
    uint64_t v27 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v27 = 0;
  }

LABEL_10:
  }

    *a3 = v6;
    goto LABEL_11;
  }

  return v3;
}
}

void OUTLINED_FUNCTION_0_6( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

void OUTLINED_FUNCTION_3_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

  ;
}

char *OUTLINED_FUNCTION_7(int *a1)
{
  return strerror(*a1);
}

  ;
}

void OUTLINED_FUNCTION_9_0( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void OUTLINED_FUNCTION_10_0(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

int *OUTLINED_FUNCTION_12_0()
{
  return __error();
}

int *OUTLINED_FUNCTION_13_0()
{
  return __error();
}

  ;
}

  ;
}

int *OUTLINED_FUNCTION_17()
{
  return __error();
}

void OUTLINED_FUNCTION_18(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose(va, 8) = a1;
}

void OUTLINED_FUNCTION_19(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

void OUTLINED_FUNCTION_20( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void OUTLINED_FUNCTION_21(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose(va, 8) = a1;
}

int *OUTLINED_FUNCTION_22()
{
  return __error();
}

  ;
}

  ;
}

int *OUTLINED_FUNCTION_25()
{
  return __error();
}

int *OUTLINED_FUNCTION_26()
{
  return __error();
}

void sub_18865F2E0(_Unwind_Exception *a1)
{
}

uint64_t __Block_byref_object_copy__2(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x1895CA0E4](*(void *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

uint64_t __Block_byref_object_copy__30(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__31(uint64_t a1)
{
}

LABEL_16:
  return a1;
}

  return (id)a1;
}

  return v8;
}

LABEL_41:
    int v10 = v49;
LABEL_31:

    if (++v12 == v10)
    {
      v41 = [obj countByEnumeratingWithState:&v55 objects:v64 count:16];
      int v10 = v41;
      if (!v41)
      {
        v42 = 1LL;
        goto LABEL_48;
      }

      goto LABEL_7;
    }
  }

  [v13 bundleIdentifier];
  uint64_t v38 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  id v11 = v47;
  if ((-[os_log_s isEqualToString:](v38, "isEqualToString:", @"com.apple.dt.XcodePreviews") & 1) != 0
    || -[os_log_s isEqualToString:](v38, "isEqualToString:", @"com.apple.PreviewShell"))
  {
    rbs_general_log();
    v40 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      v61 = v38;
      v62 = 2114;
      v63 = (os_log_s *)v13;
      _os_log_impl( &dword_188634000,  v40,  OS_LOG_TYPE_INFO,  "_predicatesMatchOnlyAllowedProcess allowing predicate matching %{public}@ (%{public}@)",  buf,  0x16u);
    }

    goto LABEL_41;
  }

  rbs_general_log();
  v43 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    v44 = *(os_log_s **)(v48 + 112);
    *(_DWORD *)buf = 138543618;
    v61 = (os_log_s *)v13;
    v62 = 2114;
    v63 = v44;
    _os_log_impl( &dword_188634000,  v43,  OS_LOG_TYPE_DEFAULT,  "_predicatesMatchOnlyAllowedProcess denying predicate %{public}@ for process %{public}@",  buf,  0x16u);
  }

  v42 = 0LL;
LABEL_48:
  id v3 = v46;
LABEL_49:

LABEL_50:
  return v42;
}

  uint64_t v15 = 0LL;
LABEL_57:

  return v15;
}

void OUTLINED_FUNCTION_2_2(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void OUTLINED_FUNCTION_4(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose(&STACK[0x7D0], 8) = a1;
}

  ;
}

LABEL_39:
  return v10;
}

void OUTLINED_FUNCTION_1_5( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

int *OUTLINED_FUNCTION_4_0()
{
  return __error();
}

void OUTLINED_FUNCTION_5_0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_18867192C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, void *a18)
{
}

void sub_188671CF8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, char a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, char a29)
{
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void OUTLINED_FUNCTION_0_8( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_1886764F8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_18867662C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_188676D1C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_188676E50( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void OUTLINED_FUNCTION_1_7(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

uint64_t OUTLINED_FUNCTION_2_3()
{
  return NSRequestConcreteImplementation();
}

  ;
}

uint64_t RBSAttributePathIncrement(char a1, char a2)
{
  int v2 = a1 & 0xF;
  if ((a1 & 0xFu) >= 0xEuLL) {
    int v2 = 14;
  }
  return ((a2 & 0xF) << (4 * (v2 + 1))) | (v2 + 1);
}

void sub_188678718( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_18867A618( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t _RBAssertionManagerStoreComparePids(_DWORD *a1, _DWORD *a2)
{
  return (*a1 - *a2);
}

void OUTLINED_FUNCTION_0_10( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

int *OUTLINED_FUNCTION_2_4()
{
  return __error();
}

  ;
}

LABEL_4:
  id v6 = 0;
LABEL_14:

  return v6;
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

id safeGetProperty(void *a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  id v7 = a2;
  id v8 = a4;
  [a1 objectForKeyedSubscript:v7];
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
LABEL_8:
    id v10 = 0LL;
    goto LABEL_9;
  }

  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    rbs_assertion_log();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      id v21 = v7;
      __int16 v22 = 2114;
      id v23 = (id)objc_opt_class();
      __int16 v24 = 2114;
      uint64_t v25 = a3;
      id v17 = v23;
      _os_log_error_impl( &dword_188634000,  v11,  OS_LOG_TYPE_ERROR,  "Detected misconfigured attribute. Property %{public}@ had class %{public}@ when class %{public}@ was expected",  buf,  0x20u);
    }

    if (v8)
    {
      uint64_t v12 = (void *)MEMORY[0x189607870];
      uint64_t v18 = *MEMORY[0x1896075F0];
      [NSString stringWithFormat:@"Detected misconfigured attribute. Property %@ had class %@ when class %@ was expected", v7, objc_opt_class(), a3];
      int v13 = (void *)objc_claimAutoreleasedReturnValue();
      id v19 = v13;
      [MEMORY[0x189603F68] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
      [v12 errorWithDomain:@"RBDomainAttributeManagerDataProviderErrorDomain" code:2 userInfo:v14];
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();

      [v8 addObject:v15];
    }

    goto LABEL_8;
  }

  id v10 = v9;
LABEL_9:

  return v10;
}

LABEL_30:
        break;
      case 5LL:
      case 6LL:
        if ((v8 & 1) == 0)
        {
          rbs_process_log();
          __int128 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
            -[RBLaunchdProperties _initWithProperties:].cold.6();
          }
        }

        id v21 = -[RBLaunchdProperties _configureXPCServiceWithProperties:](v6, "_configureXPCServiceWithProperties:", v5);
        goto LABEL_29;
      default:
        rbs_process_log();
        __int16 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
          -[RBLaunchdProperties _initWithProperties:].cold.2((uint64_t)&v6->_jobLabel, v5, v22);
        }

        goto LABEL_30;
    }
  }

  else
  {
    p_jobLabel = 0LL;
  }

  return p_jobLabel;
}

void OUTLINED_FUNCTION_2_5(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

void OUTLINED_FUNCTION_4_2(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void OUTLINED_FUNCTION_11_1(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose(va, 8) = a1;
}

  ;
}

id _RBLogAddStateCaptureBlockWithTitle(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  if (v5)
  {
    if (v6) {
      goto LABEL_3;
    }
LABEL_12:
    [MEMORY[0x1896077D8] currentHandler];
    id v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend( NSString,  "stringWithUTF8String:",  "id<RBSInvalidatable> _RBLogAddStateCaptureBlockWithTitle(__strong dispatch_queue_t, NSString *__strong, __strong R BLogStateCaptureBlock, BOOL)");
    __int16 v22 = (void *)objc_claimAutoreleasedReturnValue();
    [v21 handleFailureInFunction:v22, @"RBStateCaptureManager.m", 105, @"Invalid parameter not satisfying: %@", @"stateCaptureTitle" file lineNumber description];

    if (v7) {
      goto LABEL_4;
    }
    goto LABEL_13;
  }

  [MEMORY[0x1896077D8] currentHandler];
  id v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend( NSString,  "stringWithUTF8String:",  "id<RBSInvalidatable> _RBLogAddStateCaptureBlockWithTitle(__strong dispatch_queue_t, NSString *__strong, __strong RBL ogStateCaptureBlock, BOOL)");
  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue();
  [v19 handleFailureInFunction:v20, @"RBStateCaptureManager.m", 104, @"Invalid parameter not satisfying: %@", @"queue" file lineNumber description];

  if (!v6) {
    goto LABEL_12;
  }
LABEL_3:
  if (v7) {
    goto LABEL_4;
  }
LABEL_13:
  [MEMORY[0x1896077D8] currentHandler];
  id v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend( NSString,  "stringWithUTF8String:",  "id<RBSInvalidatable> _RBLogAddStateCaptureBlockWithTitle(__strong dispatch_queue_t, NSString *__strong, __strong RBL ogStateCaptureBlock, BOOL)");
  __int16 v24 = (void *)objc_claimAutoreleasedReturnValue();
  [v23 handleFailureInFunction:v24, @"RBStateCaptureManager.m", 106, @"Invalid parameter not satisfying: %@", @"stateCaptureBlock" file lineNumber description];

LABEL_4:
  id v8 = v7;
  id v9 = v6;
  id v10 = (void *)os_state_add_handler();
  if (v10)
  {
    os_unfair_lock_lock(&_lock);
    if (!_registeredStateCaptureBlocks)
    {
      id v11 = objc_alloc_init(MEMORY[0x189603FC8]);
      uint64_t v12 = (void *)_registeredStateCaptureBlocks;
      _registeredStateCaptureBlocks = (uint64_t)v11;
    }

    int v13 = objc_alloc_init(&OBJC_CLASS___RBLogStateCaptureEntry);
    uint64_t v15 = v13;
    if (v13) {
      objc_setProperty_nonatomic_copy(v13, v14, v8, 16LL);
    }
    -[RBLogStateCaptureEntry setTitle:]((uint64_t)v15, v9);
    -[RBLogStateCaptureEntry setQueue:]((uint64_t)v15, v5);
    uint64_t v16 = (void *)_registeredStateCaptureBlocks;
    [MEMORY[0x189607968] numberWithUnsignedLongLong:v10];
    id v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 setObject:v15 forKey:v17];

    os_unfair_lock_unlock(&_lock);
    id v10 = -[RBStateCaptureInvalidator initWithHandle:]( objc_alloc(&OBJC_CLASS___RBStateCaptureInvalidator),  (uint64_t)v10);
  }

  return v10;
}

void sub_1886831F4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_18868510C(_Unwind_Exception *a1)
{
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

void sub_188685DE8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, char a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, char a29)
{
}

void sub_188687818( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, char a27)
{
}

LABEL_49:
            v39 = (void *)MEMORY[0x189612300];
            [MEMORY[0x1896122E0] identifierWithPid:v10];
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            [v39 instanceWithIdentifier:v40 identity:v22];
            int v13 = (void *)objc_claimAutoreleasedReturnValue();

            rbs_process_log();
            v41 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
            {
              v42 = -[os_log_s shortDescription](v22, "shortDescription");
              buf.val[0] = 67109634;
              buf.val[1] = v10;
              LOWORD(buf.val[2]) = 2114;
              *(void *)((char *)&buf.val[2] + 2) = v42;
              HIWORD(buf.val[4]) = 1024;
              buf.val[5] = v10;
              _os_log_impl( &dword_188634000,  v41,  OS_LOG_TYPE_DEFAULT,  "Resolved pid %d to [%{public}@:%d]",  (uint8_t *)&buf,  0x18u);
            }

void sub_188688F90(_Unwind_Exception *a1)
{
}

void sub_188689B74( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

id OUTLINED_FUNCTION_0_11(id a1)
{
  return a1;
}

void OUTLINED_FUNCTION_1_9( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

LABEL_22:
  return a1;
}

              id v5 = v27;
              uint64_t v4 = v28;
            }
          }

          ++v6;
        }

        while (v6 != v4);
        uint64_t v4 = [obj countByEnumeratingWithState:&v34 objects:v45 count:16];
      }

      while (v4);
    }

    objc_msgSend(*(id *)(a1 + 32), "_lock_sendPendingStateUpdates");
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40LL));
}

    goto LABEL_23;
  }

void sub_18868CDC8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, char a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, char a31)
{
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

void sub_18868E1F4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, char a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, char a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, char a37)
{
}

void sub_18868E920(_Unwind_Exception *a1)
{
}

void OUTLINED_FUNCTION_0_12( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

uint64_t OUTLINED_FUNCTION_3_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) count];
}

LABEL_25:
    id v21 = -[RBProcessMap setValue:forIdentity:](self->_originatorInheritances, "setValue:forIdentity:", v7, v6);
    goto LABEL_26;
  }

  id v7 = 0LL;
LABEL_27:

  return v7;
}

LABEL_55:
                id v6 = v51;
                id v5 = v52;

                goto LABEL_56;
              }

              [v30 originator];
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              uint64_t v36 = [v53 containsObject:v35];

              if ((v36 & 1) == 0)
              {
                rbs_assertion_log();
                v37 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
                {
                  [v30 originator];
                  uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543362;
                  v72 = v38;
                  _os_log_impl( &dword_188634000,  v37,  OS_LOG_TYPE_DEFAULT,  "found a new process to check %{public}@",  buf,  0xCu);
                }

                [v30 originator];
                __int16 v31 = (void *)objc_claimAutoreleasedReturnValue();
                -[os_log_s addObject:](v16, "addObject:", v31);
LABEL_29:

                continue;
              }
            }
          }

          uint64_t v27 = [v25 countByEnumeratingWithState:&v58 objects:v75 count:16];
          if (v27) {
            continue;
          }
          break;
        }

LABEL_32:
        id v21 = v50 + 1;
        id v6 = v51;
        uint64_t v15 = 0x189603000LL;
        __int128 v20 = v47;
      }

      while (v50 + 1 != v49);
      v49 = [v19 countByEnumeratingWithState:&v62 objects:v76 count:16];
    }

    while (v49);
LABEL_34:
  }

  rbs_assertion_log();
  v39 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v72 = v53;
    _os_log_impl( &dword_188634000,  v39,  OS_LOG_TYPE_DEFAULT,  "Detected apparent loop in suspendable assertions with: %{public}@",  buf,  0xCu);
  }

  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  id v19 = v53;
  v40 = [v19 countByEnumeratingWithState:&v54 objects:v70 count:16];
  if (v40)
  {
    v41 = v40;
    v42 = *(void *)v55;
    do
    {
      for (k = 0LL; k != v41; ++k)
      {
        if (*(void *)v55 != v42) {
          objc_enumerationMutation(v19);
        }
        -[RBAssertionResolutionContext _suspendAssertionsForTarget:]( self,  "_suspendAssertionsForTarget:",  *(void *)(*((void *)&v54 + 1) + 8 * k));
      }

      v41 = [v19 countByEnumeratingWithState:&v54 objects:v70 count:16];
    }

    while (v41);
  }

  id v5 = v52;
LABEL_56:

LABEL_57:
}

  return (char)a4;
}

LABEL_24:
  return v2;
}

void sub_188691414( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

LABEL_210:
  }
}

LABEL_3:
  id v6 = 0;
LABEL_11:

  return v6;
}

  id v6 = 0;
LABEL_11:

  return v6;
}

  id v6 = 0;
LABEL_11:

  return v6;
}

  id v6 = 0;
LABEL_11:

  return v6;
}

  id v6 = 0;
LABEL_11:

  return v6;
}

  id v6 = 0;
LABEL_11:

  return v6;
}

  id v6 = 0;
LABEL_11:

  return v6;
}

  id v6 = 0;
LABEL_23:

  return v6;
}

void RBPowerlogEvent(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = RBPowerlogEvent_onceToken;
  id v8 = a2;
  if (v7 != -1) {
    dispatch_once(&RBPowerlogEvent_onceToken, &__block_literal_global_23);
  }
  id v9 = (void *)RBPowerlogEvent_eventQueue;
  id v10 = -[RBPLEvent initWithevent:identity:assertionCount:pid:]( objc_alloc(&OBJC_CLASS___RBPLEvent),  "initWithevent:identity:assertionCount:pid:",  a1,  v8,  a3,  a4);

  [v9 enqueueEvent:v10];
}

void __RBPowerlogEvent_block_invoke()
{
  dispatch_queue_t v0 = objc_alloc_init(&OBJC_CLASS___RBPLEventQueue);
  uint64_t v1 = (void *)RBPowerlogEvent_eventQueue;
  RBPowerlogEvent_eventQueue = (uint64_t)v0;
}

void OUTLINED_FUNCTION_9_2(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose((const void *)(v1 - 144), 8) = a1;
}

void _getPlistInRunningBoardLibrary_cold_1()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3_0( &dword_188634000,  v0,  v1,  "_getPlistInRunningBoardLibrary failed because result is not dictionary (%{public}@)",  v2);
  OUTLINED_FUNCTION_1_1();
}

void _getPlistInRunningBoardLibrary_cold_2(void *a1, os_log_s *a2)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  [a1 localizedDescription];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3_0( &dword_188634000,  a2,  v4,  "_getPlistInRunningBoardLibrary failed in NSPropertyList propertyListWithData with error %{public}@",  v5);
}

void restrictedEntitlementsFromPlist_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl( &dword_188634000,  log,  OS_LOG_TYPE_FAULT,  "RunningBoard did not find an entitlements configuration at runningboardEntitlementsConfiguration.plist",  v1,  2u);
}

void _addRBProperties_cold_1()
{
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return result;
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x189602BD0](theDict);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x189602D30](cf);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x189602E50]();
}

void CFNotificationCenterPostNotification( CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x189602F08]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x189602F10](number, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyValue( CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x189602F88](key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue( CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x189602F98](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
}

CFIndex CFSetGetCount(CFSetRef theSet)
{
  return MEMORY[0x189603270](theSet);
}

uint64_t IOGPUDeviceCreate()
{
  return MEMORY[0x18960FFD0]();
}

uint64_t IOGPUDeviceSetAppGPURole()
{
  return MEMORY[0x18960FFD8]();
}

uint64_t IOPMAssertionDeclareSystemActivityWithProperties()
{
  return MEMORY[0x1896083C0]();
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return MEMORY[0x1896083D0](*(void *)&AssertionID);
}

IOReturn IOPMAssertionSetProperty(IOPMAssertionID theAssertion, CFStringRef theProperty, CFTypeRef theValue)
{
  return MEMORY[0x1896083D8](*(void *)&theAssertion, theProperty, theValue);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x189608568](*(void *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x189608580](name);
}

uint64_t NSRequestConcreteImplementation()
{
  return MEMORY[0x1896076C8]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x189607700](aClass);
}

uint64_t NSStringFromRBSCPUMaximumUsageViolationPolicy()
{
  return MEMORY[0x1896120C8]();
}

uint64_t NSStringFromRBSDurationEndPolicy()
{
  return MEMORY[0x1896120D0]();
}

uint64_t NSStringFromRBSDurationStartPolicy()
{
  return MEMORY[0x1896120D8]();
}

uint64_t NSStringFromRBSGPURole()
{
  return MEMORY[0x1896120E0]();
}

uint64_t NSStringFromRBSLegacyReason()
{
  return MEMORY[0x1896120E8]();
}

uint64_t NSStringFromRBSMemoryLimitStrength()
{
  return MEMORY[0x1896120F0]();
}

uint64_t NSStringFromRBSRole()
{
  return MEMORY[0x1896120F8]();
}

uint64_t NSStringFromRBSTaskState()
{
  return MEMORY[0x189612100]();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x189607718](aSelector);
}

uint64_t PLLogRegisteredEvent()
{
  return MEMORY[0x189611CC8]();
}

uint64_t RBSAcquisitionCompletionPolicyIsValid()
{
  return MEMORY[0x1896123C8]();
}

uint64_t RBSArrayForKey()
{
  return MEMORY[0x1896123D0]();
}

uint64_t RBSAuditTokenRepresentsPlatformBinary()
{
  return MEMORY[0x1896123F8]();
}

uint64_t RBSBoolForKey()
{
  return MEMORY[0x189612400]();
}

uint64_t RBSBundleIDForPID()
{
  return MEMORY[0x189612408]();
}

uint64_t RBSContainedExtensionBundleIDs()
{
  return MEMORY[0x189612418]();
}

uint64_t RBSDarwinRoleFromRBSRole()
{
  return MEMORY[0x189612428]();
}

uint64_t RBSDictionaryForKey()
{
  return MEMORY[0x189612430]();
}

uint64_t RBSDispatchAsyncWithQoS()
{
  return MEMORY[0x189612438]();
}

uint64_t RBSEndowmentEncode()
{
  return MEMORY[0x189612440]();
}

uint64_t RBSExecutablePathForPID()
{
  return MEMORY[0x189612448]();
}

uint64_t RBSExtensionPointFromBundleDict()
{
  return MEMORY[0x189612450]();
}

uint64_t RBSInvalidRealAuditToken()
{
  return MEMORY[0x189612458]();
}

uint64_t RBSMachAbsoluteTime()
{
  return MEMORY[0x189612460]();
}

uint64_t RBSNumberForKey()
{
  return MEMORY[0x189612478]();
}

uint64_t RBSPIDExists()
{
  return MEMORY[0x189612480]();
}

uint64_t RBSPIDIsBeingDebugged()
{
  return MEMORY[0x189612488]();
}

uint64_t RBSPathForSystemDirectory()
{
  return MEMORY[0x189612490]();
}

uint64_t RBSRealAuditTokenValid()
{
  return MEMORY[0x1896124A8]();
}

uint64_t RBSStringForKey()
{
  return MEMORY[0x189612500]();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x18960B640](task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x18960B668](allocator, token);
}

uint32_t SecTaskGetCodeSignStatus(SecTaskRef task)
{
  return MEMORY[0x18960B670](task);
}

uint64_t WriteCrashReportWithStackshot()
{
  return MEMORY[0x189611BD8]();
}

uint64_t WriteCrashReportWithStackshotWithPayload()
{
  return MEMORY[0x189611BE0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x189604828]();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x189604838]();
}

uint64_t _EXConfigureLaunchContext()
{
  return MEMORY[0x189605F30]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1895F8898]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1895F8A08]();
}

uint64_t _launch_get_last_exit_reason_4SB()
{
  return MEMORY[0x18960CEA0]();
}

void _os_activity_initiate( void *dso, const char *description, os_activity_flag_t flags, os_block_t activity_block)
{
}

uint64_t _os_crash()
{
  return MEMORY[0x1895F8D78]();
}

uint64_t _os_crash_msg()
{
  return MEMORY[0x1895F8D80]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1895F8D88]();
}

void _os_log_debug_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x1895F8DE0]();
}

void _os_signpost_emit_with_name_impl( void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sqlite3_lockstate()
{
  return MEMORY[0x1896170B8]();
}

void abort(void)
{
}

int access(const char *a1, int a2)
{
  return MEMORY[0x1895F9328](a1, *(void *)&a2);
}

uint32_t arc4random(void)
{
  return MEMORY[0x1895F94C0]();
}

uid_t audit_token_to_auid(audit_token_t *atoken)
{
  return MEMORY[0x1896140E8](atoken);
}

uid_t audit_token_to_euid(audit_token_t *atoken)
{
  return MEMORY[0x1896140F8](atoken);
}

void *__cdecl bsearch( const void *__key, const void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  return (void *)MEMORY[0x1895F9650](__key, __base, __nel, __width, __compar);
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x1895F9710](__count, __size);
}

int close(int a1)
{
  return MEMORY[0x1895FA590](*(void *)&a1);
}

uint64_t container_copy_sandbox_token()
{
  return MEMORY[0x1895FA710]();
}

uint64_t container_error_copy_unlocalized_description()
{
  return MEMORY[0x1895FA788]();
}

uint64_t container_get_path()
{
  return MEMORY[0x1895FA810]();
}

uint64_t container_query_create()
{
  return MEMORY[0x1895FA8F8]();
}

uint64_t container_query_free()
{
  return MEMORY[0x1895FA908]();
}

uint64_t container_query_get_last_error()
{
  return MEMORY[0x1895FA910]();
}

uint64_t container_query_get_single_result()
{
  return MEMORY[0x1895FA918]();
}

uint64_t container_query_iterate_results_with_subquery_sync()
{
  return MEMORY[0x1895FA928]();
}

uint64_t container_query_operation_set_flags()
{
  return MEMORY[0x1895FA930]();
}

uint64_t container_query_operation_set_platform()
{
  return MEMORY[0x1895FA938]();
}

uint64_t container_query_set_class()
{
  return MEMORY[0x1895FA940]();
}

uint64_t container_query_set_identifiers()
{
  return MEMORY[0x1895FA950]();
}

uint64_t container_query_set_include_other_owners()
{
  return MEMORY[0x1895FA958]();
}

uint64_t container_query_set_persona_unique_string()
{
  return MEMORY[0x1895FA960]();
}

uint64_t container_query_set_uid()
{
  return MEMORY[0x1895FA970]();
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create_with_qos_class( dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1895FABB8](flags, *(void *)&qos_class, *(void *)&relative_priority, block);
}

dispatch_queue_global_t dispatch_get_global_queue(uint64_t identifier, unint64_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1895FAC40](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_initially_inactive(dispatch_queue_attr_t attr)
{
  return (dispatch_queue_attr_t)MEMORY[0x1895FAD60](attr);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency( dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1895FAD68](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1895FAD80](label, attr);
}

void dispatch_set_context(dispatch_object_t object, void *context)
{
}

uint64_t dispatch_set_qos_class_fallback()
{
  return MEMORY[0x1895FAE30]();
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create( dispatch_source_type_t type, uintptr_t handle, unint64_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1895FAE50](type, handle, mask, queue);
}

unint64_t dispatch_source_get_data(dispatch_source_t source)
{
  return MEMORY[0x1895FAE58](source);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer( dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1895FAEE8](when, delta);
}

dispatch_workloop_t dispatch_workloop_create_inactive(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x1895FAF08](label);
}

uint64_t dyld_get_active_platform()
{
  return MEMORY[0x1895FAFD8]();
}

void exit(int a1)
{
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1895FB210](*(void *)&a1, *(void *)&a2);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1895FB448](*(void *)&a1, a2);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x1895FB480](*(void *)&a1, a2);
}

pid_t getpid(void)
{
  return MEMORY[0x1895FB628]();
}

passwd *__cdecl getpwuid(uid_t a1)
{
  return (passwd *)MEMORY[0x1895FB670](*(void *)&a1);
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1895FB708](path, name, value, size, *(void *)&position, *(void *)&options);
}

int kill(pid_t a1, int a2)
{
  return MEMORY[0x1895FB8E8](*(void *)&a1, *(void *)&a2);
}

uint64_t kpersona_find()
{
  return MEMORY[0x1895FB8F0]();
}

uint64_t kpersona_info()
{
  return MEMORY[0x1895FB908]();
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1895FBC88](__size);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1895FBE18](__dst, __src, __n);
}

uint64_t memorystatus_control()
{
  return MEMORY[0x1895FBE40]();
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1895FBF70](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1895FBF98](a1, a2);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1895FC198](*(void *)&token, state64);
}

uint32_t notify_register_dispatch( const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1895FC1C0](name, out_token, queue, handler);
}

uint64_t notify_resume_pid()
{
  return MEMORY[0x1895FC1E0]();
}

uint64_t notify_suspend_pid()
{
  return MEMORY[0x1895FC1F0]();
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

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1896166C8](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1896166D8](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x189616700](location);
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

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x189616748]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x189616750]();
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x189616838](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x189616968](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x189616978](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x189616980](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x189616990](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1895FC248](a1, *(void *)&a2);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1895FC600](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1895FC608](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1895FC610](log, ptr);
}

uint64_t os_state_add_handler()
{
  return MEMORY[0x1895FC620]();
}

uint64_t os_state_remove_handler()
{
  return MEMORY[0x1895FC628]();
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1895FC640]();
}

void os_unfair_lock_assert_not_owner(os_unfair_lock_t lock)
{
}

void os_unfair_lock_assert_owner(os_unfair_lock_t lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x1895FC668]();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_unfair_recursive_lock_lock_with_options()
{
  return MEMORY[0x1895FC688]();
}

uint64_t os_unfair_recursive_lock_unlock()
{
  return MEMORY[0x1895FC6A0]();
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1895FC6C0]();
}

uint64_t os_variant_is_darwinos()
{
  return MEMORY[0x1895FC6D8]();
}

uint64_t pid_resume()
{
  return MEMORY[0x1895FC790]();
}

uint64_t pid_shutdown_sockets()
{
  return MEMORY[0x1895FC798]();
}

uint64_t pid_suspend()
{
  return MEMORY[0x1895FC7A0]();
}

uint64_t proc_disable_cpumon()
{
  return MEMORY[0x1895FC898]();
}

int proc_pidfdinfo(int pid, int fd, int flavor, void *buffer, int buffersize)
{
  return MEMORY[0x1895FC8D8](*(void *)&pid, *(void *)&fd, *(void *)&flavor, buffer, *(void *)&buffersize);
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return MEMORY[0x1895FC8E0](*(void *)&pid, *(void *)&flavor, arg, buffer, *(void *)&buffersize);
}

uint64_t proc_resume_cpumon()
{
  return MEMORY[0x1895FC908]();
}

uint64_t proc_set_cpumon_defaults()
{
  return MEMORY[0x1895FC910]();
}

uint64_t proc_set_cpumon_params()
{
  return MEMORY[0x1895FC918]();
}

uint64_t proc_set_cpumon_params_fatal()
{
  return MEMORY[0x1895FC920]();
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
}

uint64_t rbs_assertion_log()
{
  return MEMORY[0x189612518]();
}

uint64_t rbs_best_effort_networking_log()
{
  return MEMORY[0x189612520]();
}

uint64_t rbs_connection_log()
{
  return MEMORY[0x189612528]();
}

uint64_t rbs_general_log()
{
  return MEMORY[0x189612530]();
}

uint64_t rbs_jetsam_log()
{
  return MEMORY[0x189612538]();
}

uint64_t rbs_job_log()
{
  return MEMORY[0x189612540]();
}

uint64_t rbs_job_oversize_log()
{
  return MEMORY[0x189612548]();
}

uint64_t rbs_message_log()
{
  return MEMORY[0x189612550]();
}

uint64_t rbs_monitor_log()
{
  return MEMORY[0x189612558]();
}

uint64_t rbs_power_log()
{
  return MEMORY[0x189612560]();
}

uint64_t rbs_process_log()
{
  return MEMORY[0x189612568]();
}

uint64_t rbs_sp_assertion_log()
{
  return MEMORY[0x189612578]();
}

uint64_t rbs_sp_state_log()
{
  return MEMORY[0x189612580]();
}

uint64_t rbs_sp_telemetry_log()
{
  return MEMORY[0x189612588]();
}

uint64_t rbs_sp_therm_log()
{
  return MEMORY[0x189612590]();
}

uint64_t rbs_state_log()
{
  return MEMORY[0x189612598]();
}

uint64_t rbs_ttl_log()
{
  return MEMORY[0x1896125A0]();
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x1895FCC80](a1, a2);
}

uint64_t sandbox_check_by_audit_token()
{
  return MEMORY[0x1895FCD98]();
}

uint64_t sandbox_container_path_for_audit_token()
{
  return MEMORY[0x1895FCDA0]();
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1895FCDB0]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x1895FCDD0]();
}

int setiopolicy_np(int a1, int a2, int a3)
{
  return MEMORY[0x1895FCE80](*(void *)&a1, *(void *)&a2, *(void *)&a3);
}

int setpriority(int a1, id_t a2, int a3)
{
  return MEMORY[0x1895FCEA0](*(void *)&a1, *(void *)&a2, *(void *)&a3);
}

int shm_open(const char *a1, int a2, ...)
{
  return MEMORY[0x1895FCEE8](a1, *(void *)&a2);
}

int shm_unlink(const char *a1)
{
  return MEMORY[0x1895FCEF0](a1);
}

uint64_t spd_client_start_monitoring_all_sockets_for_pid()
{
  return MEMORY[0x189617098]();
}

uint64_t spd_client_stop_monitoring_all_sockets_for_pid()
{
  return MEMORY[0x1896170A0]();
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1895FD010](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1895FD050](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1895FD080](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1895FD0B8](__s);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1895FD2B8](a1, a2, a3, a4, a5);
}

uint64_t tailspin_config_create_with_default_config()
{
  return MEMORY[0x189617388]();
}

uint64_t tailspin_config_free()
{
  return MEMORY[0x189617390]();
}

uint64_t tailspin_dump_output_sync()
{
  return MEMORY[0x189617398]();
}

uint64_t tailspin_enabled_set()
{
  return MEMORY[0x1896173A0]();
}

uint64_t terminate_with_reason()
{
  return MEMORY[0x1895FD398]();
}

uint64_t voucher_adopt()
{
  return MEMORY[0x1895FD5B8]();
}

uint64_t wd_endpoint_activate()
{
  return MEMORY[0x189612BD8]();
}

uint64_t wd_endpoint_add_queue()
{
  return MEMORY[0x189612BE0]();
}

uint64_t wd_endpoint_register()
{
  return MEMORY[0x189612BE8]();
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1895FD7D8](objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1895FD808](xarray);
}

xpc_object_t xpc_array_get_dictionary(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x1895FD820](xarray, index);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x1895FD860](xarray, index);
}

void xpc_array_set_int64(xpc_object_t xarray, size_t index, int64_t value)
{
}

void xpc_array_set_string(xpc_object_t xarray, size_t index, const char *string)
{
}

void xpc_array_set_value(xpc_object_t xarray, size_t index, xpc_object_t value)
{
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x1895FD8C0](xBOOL);
}

uint64_t xpc_bundle_create()
{
  return MEMORY[0x1895FD8D0]();
}

uint64_t xpc_bundle_get_executable_path()
{
  return MEMORY[0x1895FD8E8]();
}

uint64_t xpc_bundle_get_info_dictionary()
{
  return MEMORY[0x1895FD8F0]();
}

uint64_t xpc_bundle_get_property()
{
  return MEMORY[0x1895FD8F8]();
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1895FD968](name, targetq, flags);
}

uint64_t xpc_connection_get_audit_token()
{
  return MEMORY[0x1895FD978]();
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return MEMORY[0x1895FD9A8](connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

void xpc_connection_suspend(xpc_connection_t connection)
{
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x1895FDA98](object);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x1895FDB78](xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1895FDB98](keys, values, count);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x1895FDBA0]();
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1895FDBB0](original);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1895FDBE8](xdict, key);
}

size_t xpc_dictionary_get_count(xpc_object_t xdict)
{
  return MEMORY[0x1895FDBF8](xdict);
}

xpc_object_t xpc_dictionary_get_dictionary(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1895FDC10](xdict, key);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return (xpc_connection_t)MEMORY[0x1895FDC38](xdict);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1895FDC48](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1895FDC50](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1895FDC68](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

uint64_t xpc_dictionary_set_mach_send()
{
  return MEMORY[0x1895FDCF8]();
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

uint64_t xpc_endpoint_get_bs_job_handle()
{
  return MEMORY[0x1895FDD80]();
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1895FDE70](object);
}

uint64_t xpc_strerror()
{
  return MEMORY[0x1895FE040]();
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x1895FE050](string);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x1895FE080](xstring);
}

uint64_t objc_msgSend__acquireAssertions_invalidateIdentifiers_forOriginatorProcess_completionPolicy_acquisitionErrorsByIndex_completeStage_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel__acquireAssertions_invalidateIdentifiers_forOriginatorProcess_completionPolicy_acquisitionErrorsByIndex_completeStage_);
}

uint64_t objc_msgSend__initThinWithInstance_auditToken_bundleProperties_jetsamProperties_hostProcess_properties_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel__initThinWithInstance_auditToken_bundleProperties_jetsamProperties_hostProcess_properties_);
}

uint64_t objc_msgSend__initWithInstance_auditToken_bundleProperties_jetsamProperties_initialState_hostProcess_properties_systemPreventsIdleSleep_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel__initWithInstance_auditToken_bundleProperties_jetsamProperties_initialState_hostProcess_properties_systemPreventsIdleSleep_);
}

uint64_t objc_msgSend__initWithNamespace_environment_encodedEndowment_originatingIdentifier_attributePath_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel__initWithNamespace_environment_encodedEndowment_originatingIdentifier_attributePath_);
}

uint64_t objc_msgSend__lock_assertionCreationAttributeContextForTargetIdentity_originator_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__lock_assertionCreationAttributeContextForTargetIdentity_originator_);
}

uint64_t objc_msgSend__lock_checkAssertionToInvalidateByCondition_condition_currentValue_assertionsToInvalidate_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel__lock_checkAssertionToInvalidateByCondition_condition_currentValue_assertionsToInvalidate_);
}

uint64_t objc_msgSend__lock_createAssertionForDescriptor_originatorState_acquisitionContext_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__lock_createAssertionForDescriptor_originatorState_acquisitionContext_error_);
}

uint64_t objc_msgSend__lock_createAssertionWithAcquisitionContext_attributeContext_concreteTarget_targetIdentity_originator_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel__lock_createAssertionWithAcquisitionContext_attributeContext_concreteTarget_targetIdentity_originator_error_);
}

uint64_t objc_msgSend__lock_createAssertionsForBatchContext_originatorState_errorsByIndex_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__lock_createAssertionsForBatchContext_originatorState_errorsByIndex_);
}

uint64_t objc_msgSend__lock_enforceAssertionLimitIfNecessaryForBatchContext_originatorProcess_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__lock_enforceAssertionLimitIfNecessaryForBatchContext_originatorProcess_error_);
}

uint64_t objc_msgSend__lock_resolvePreliminaryStatesForNonExistingProcessesWithAssertions_completionPolicy_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel__lock_resolvePreliminaryStatesForNonExistingProcessesWithAssertions_completionPolicy_);
}

uint64_t objc_msgSend__lock_validateDescriptor_originatorProcess_originatorState_concreteTarget_targetProcess_targetIdentity_targetIdentifier_targetState_acquisitionContext_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel__lock_validateDescriptor_originatorProcess_originatorState_concreteTarget_targetProcess_targetIdentity_targetIdentifier_targetState_acquisitionContext_error_);
}

uint64_t objc_msgSend__lock_willExceedAssertionLimitForOriginatorProcess_withIncomingCount_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__lock_willExceedAssertionLimitForOriginatorProcess_withIncomingCount_);
}

uint64_t objc_msgSend__lookupContainerPathForIdentity_context_persona_containerIdentifier_retry_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__lookupContainerPathForIdentity_context_persona_containerIdentifier_retry_error_);
}

uint64_t objc_msgSend__retryLookupAfterCacheMissForIdentity_context_persona_containerIdentifier_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__retryLookupAfterCacheMissForIdentity_context_persona_containerIdentifier_);
}

uint64_t objc_msgSend__sandboxContainerURLForExtensionContext_containerOverrideIdentifier_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__sandboxContainerURLForExtensionContext_containerOverrideIdentifier_);
}

uint64_t objc_msgSend_assertionManager_didRejectAcquisitionFromOriginatorWithExcessiveAssertions_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_assertionManager_didRejectAcquisitionFromOriginatorWithExcessiveAssertions_);
}

uint64_t objc_msgSend_assertionWithIdentifier_target_explanation_attributes_originator_context_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_assertionWithIdentifier_target_explanation_attributes_originator_context_);
}

uint64_t objc_msgSend_collectDiagnostic_description_domain_code_additionalPayload_completion_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_collectDiagnostic_description_domain_code_additionalPayload_completion_);
}

uint64_t objc_msgSend_contextForProcess_acquisitionCompletionPolicy_withDescriptorsToAcquire_identifiersToInvalidate_daemonContext_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_contextForProcess_acquisitionCompletionPolicy_withDescriptorsToAcquire_identifiersToInvalidate_daemonContext_);
}

uint64_t objc_msgSend_contextForProcess_withDescriptorsToAcquire_identifiersToInvalidate_daemonContext_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_contextForProcess_withDescriptorsToAcquire_identifiersToInvalidate_daemonContext_);
}

uint64_t objc_msgSend_eventQueue_handleAssertionsExpirationWarningEventForProcessIdentity_expirationTime_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_eventQueue_handleAssertionsExpirationWarningEventForProcessIdentity_expirationTime_);
}

uint64_t objc_msgSend_initWithBundlePropertiesManager_entitlementManager_jetsamPropertytManager_timeProvider_historialStatistics_delegate_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_initWithBundlePropertiesManager_entitlementManager_jetsamPropertytManager_timeProvider_historialStatistics_delegate_);
}

uint64_t objc_msgSend_initWithDelegate_bundlePropertiesManager_originatorPidStore_assertionDescriptorValidator_timeProvider_daemonContext_maxOperationsInFlight_maxAssertionsPerOriginator_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_initWithDelegate_bundlePropertiesManager_originatorPidStore_assertionDescriptorValidator_timeProvider_daemonContext_maxOperationsInFlight_maxAssertionsPerOriginator_);
}

uint64_t objc_msgSend_initWithInstance_auditToken_bundleData_manageFlags_beforeTranslocationBundlePath_executablePath_cache_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_initWithInstance_auditToken_bundleData_manageFlags_beforeTranslocationBundlePath_executablePath_cache_);
}

uint64_t objc_msgSend_initWithLaunchdInterface_personaManager_containerManager_bundlePropertiesManager_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_initWithLaunchdInterface_personaManager_containerManager_bundlePropertiesManager_);
}

uint64_t objc_msgSend_jetsamPropertiesForProcess_identity_bundleProperties_isPlatformBinary_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_jetsamPropertiesForProcess_identity_bundleProperties_isPlatformBinary_);
}