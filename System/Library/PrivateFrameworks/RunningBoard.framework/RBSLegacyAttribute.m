@interface RBSLegacyAttribute
- (BOOL)_isLegacyReasonFinishableTask:(BOOL)result;
- (double)_invalidationDurationExpiringTaskCompletionsQuickly:(void *)a1;
- (uint64_t)_definesRelativeStartTime;
- (uint64_t)_explicitJetsamBand:(void *)a1;
- (uint64_t)_invalidateOnThermalLevel;
- (uint64_t)_isOriginatorValidForContext:(const __CFString *)a3 errorReason:;
- (uint64_t)_isTargetValidForContext:(const __CFString *)a3 errorReason:;
- (uint64_t)_maxCPUDuration;
- (uint64_t)_role;
- (uint64_t)_startPolicy;
- (uint64_t)_terminationResistance;
- (void)_mutateReasonWithContext:(void *)a1;
@end

@implementation RBSLegacyAttribute

- (void)_mutateReasonWithContext:(void *)a1
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = [a1 reason];
    if (v4 == 4)
    {
      [v3 initialProcessState];
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v6 = [v5 legacyFinishTaskReason];
      if (v6 > 49999)
      {
        if (v6 == 50004) {
          uint64_t v7 = 50004LL;
        }
        else {
          uint64_t v7 = 4LL;
        }
        if (v6 == 50003) {
          uint64_t v8 = 50003LL;
        }
        else {
          uint64_t v8 = v7;
        }
        if (v6 == 50000) {
          uint64_t v4 = 50000LL;
        }
        else {
          uint64_t v4 = v8;
        }
      }

      else
      {
        switch(v6)
        {
          case 16LL:
            uint64_t v4 = 50004LL;
            break;
          case 10006LL:
            uint64_t v4 = 50000LL;
            break;
          case 10007LL:
            uint64_t v4 = 50003LL;
            break;
        }
      }
    }

    if (v4 != [a1 reason])
    {
      rbs_assertion_log();
      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = [a1 reason];
        [v3 assertion];
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        int v12 = 134349570;
        uint64_t v13 = v10;
        __int16 v14 = 2050;
        uint64_t v15 = v4;
        __int16 v16 = 2114;
        v17 = v11;
        _os_log_impl( &dword_188634000,  v9,  OS_LOG_TYPE_DEFAULT,  "Mutating assertion reason from %{public}lu to %{public}lu for assertion %{public}@",  (uint8_t *)&v12,  0x20u);
      }

      [a1 setReason:v4];
    }
  }
}

uint64_t __93__RBSLegacyAttribute_RBProcessState__applyToAssertionIntransientState_attributePath_context___block_invoke()
{
  Boolean keyExistsAndHasValidFormat = 0;
  uint64_t result = CFPreferencesGetAppBooleanValue( @"BKExpireTaskCompletionsQuickly",  @"com.apple.assertiond",  &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v1 = (_DWORD)result == 1;
  }
  else {
    BOOL v1 = 0;
  }
  char v2 = v1;
  applyToAssertionIntransientState_attributePath_context__expireTaskCompletionsQuickly = v2;
  return result;
}

- (double)_invalidationDurationExpiringTaskCompletionsQuickly:(void *)a1
{
  double result = 0.0;
  if (!a1) {
    return result;
  }
  uint64_t v4 = objc_msgSend(a1, "reason", 0.0);
  double result = 1.0;
  if (v4 <= 9999)
  {
    switch(v4)
    {
      case 1LL:
      case 2LL:
      case 3LL:
      case 5LL:
      case 7LL:
      case 8LL:
      case 9LL:
      case 12LL:
      case 13LL:
      case 18LL:
      case 19LL:
      case 20LL:
      case 21LL:
      case 23LL:
        return 0.0;
      case 4LL:
        double result = 30.0;
        if (a2) {
          double result = 10.0;
        }
        break;
      case 10LL:
        double result = 10.0;
        break;
      case 16LL:
        double result = 15.0;
        break;
      default:
        return result;
    }

    return result;
  }

  if (v4 > 49999)
  {
    if (v4 != 50000)
    {
      double v6 = 40.0;
      if (v4 == 50004) {
        double result = 25.0;
      }
      BOOL v7 = v4 == 50003;
      goto LABEL_18;
    }

    if (_backgroundContentFetchingProcessAssertionDuration_onceToken != -1) {
      dispatch_once(&_backgroundContentFetchingProcessAssertionDuration_onceToken, &__block_literal_global_62);
    }
    double v8 = *(double *)&_backgroundContentFetchingProcessAssertionDuration___backgroundContentFetchingProcessAssertionDuration;
    double v9 = 10.0;
    if ((a2 & 1) == 0)
    {
      if (_backgroundTaskCompletionDurationAllowedAfterContentFetchingAssertion_onceToken != -1)
      {
        uint64_t v10 = _backgroundContentFetchingProcessAssertionDuration___backgroundContentFetchingProcessAssertionDuration;
        dispatch_once( &_backgroundTaskCompletionDurationAllowedAfterContentFetchingAssertion_onceToken,  &__block_literal_global_65);
        double v8 = *(double *)&v10;
      }

      double v9 = *(double *)&_backgroundTaskCompletionDurationAllowedAfterContentFetchingAssertion___backgroundTaskCompletionDurationAllowedAfterContentFetchingAssertion;
    }

    return v8 + v9;
  }

  else
  {
    uint64_t v5 = v4 - 10000;
    if (((1LL << v5) & 0x135) != 0) {
      return 0.0;
    }
    if (v4 != 10006)
    {
      BOOL v7 = v5 == 7;
      double v6 = 30.0;
LABEL_18:
      if (v7) {
        return v6;
      }
      return result;
    }

    if (_backgroundContentFetchingProcessAssertionDuration_onceToken != -1) {
      dispatch_once(&_backgroundContentFetchingProcessAssertionDuration_onceToken, &__block_literal_global_62);
    }
    return *(double *)&_backgroundContentFetchingProcessAssertionDuration___backgroundContentFetchingProcessAssertionDuration;
  }

- (uint64_t)_startPolicy
{
  if (result)
  {
    unint64_t v1 = [(id)result reason];
    double result = 1LL;
    if (v1 <= 0x17)
    {
      if (((1LL << v1) & 0xBC33AE) != 0) {
        return result;
      }
      if (((1LL << v1) & 0x10011) != 0) {
        return 102LL;
      }
      if (v1 == 10) {
        return 103LL;
      }
    }

    char v2 = v1 - 16;
    if (v1 - 10000 > 8)
    {
LABEL_11:
      unint64_t v3 = v1 - 50000;
      if (v3 > 4 || ((1LL << v3) & 0x19) == 0) {
        return 101LL;
      }
      return 102LL;
    }

    if (((1LL << v2) & 0x135) == 0)
    {
      if (((1LL << v2) & 0xC0) != 0) {
        return 103LL;
      }
      goto LABEL_11;
    }
  }

  return result;
}

- (uint64_t)_definesRelativeStartTime
{
  if (result)
  {
    unint64_t v1 = [(id)result reason];
    double result = 1LL;
    if (v1 > 0x17 || ((1LL << v1) & 0xBC33AE) == 0)
    {
      unint64_t v2 = v1 - 10000;
      if (v2 > 8 || ((1LL << v2) & 0x135) == 0) {
        return 0LL;
      }
    }
  }

  return result;
}

- (uint64_t)_role
{
  if (a1)
  {
    if ([a1 requestedReason] == 9)
    {
      return 5;
    }

    else if (([a1 flags] & 2) != 0)
    {
      return 4;
    }

    else if ([a1 flags])
    {
      return 2;
    }

    else
    {
      return 1;
    }
  }

  else
  {
    return 0;
  }

- (uint64_t)_invalidateOnThermalLevel
{
  if (result)
  {
    uint64_t v1 = [(id)result reason];
    double result = 820LL;
    switch(v1)
    {
      case 1LL:
      case 2LL:
      case 3LL:
      case 12LL:
      case 16LL:
      case 19LL:
      case 23LL:
LABEL_5:
        double result = 840LL;
        break;
      case 4LL:
LABEL_10:
        double result = 860LL;
        break;
      case 5LL:
      case 9LL:
      case 13LL:
LABEL_6:
        double result = 850LL;
        break;
      case 6LL:
      case 10LL:
      case 11LL:
      case 14LL:
      case 15LL:
      case 17LL:
      case 22LL:
        return result;
      case 7LL:
      case 8LL:
      case 18LL:
      case 20LL:
      case 21LL:
LABEL_3:
        double result = 830LL;
        break;
      default:
        switch(v1)
        {
          case 10000LL:
          case 10007LL:
            goto LABEL_5;
          case 10001LL:
          case 10002LL:
          case 10003LL:
          case 10006LL:
            return result;
          case 10004LL:
            goto LABEL_10;
          case 10005LL:
            goto LABEL_3;
          case 10008LL:
            goto LABEL_6;
          default:
            unint64_t v2 = v1 - 50000;
            if (v2 <= 4 && ((1LL << v2) & 0x19) != 0) {
              goto LABEL_10;
            }
            break;
        }

        break;
    }
  }

  return result;
}

- (uint64_t)_explicitJetsamBand:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    char v4 = [a1 flags];
    uint64_t v5 = [a1 reason];
    if (v5 == 3 && (v4 & 8) != 0)
    {
      uint64_t v6 = 120LL;
    }

    else if ((v4 & 8) != 0)
    {
      if (v5 != 9) {
        goto LABEL_21;
      }
      uint64_t v9 = [v3 targetProcess];
      if (!v9) {
        goto LABEL_21;
      }
      uint64_t v10 = (void *)v9;
      [v3 assertion];
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 explanation];
      int v12 = (void *)objc_claimAutoreleasedReturnValue();
      int v13 = [v12 isEqualToString:@"com.apple.viewservice.session"];

      if (v13)
      {
        [v3 entitlementManager];
        __int16 v14 = (void *)objc_claimAutoreleasedReturnValue();
        [v3 targetProcess];
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
        [v14 entitlementsForProcess:v15];
        __int16 v16 = (void *)objc_claimAutoreleasedReturnValue();

        else {
          uint64_t v6 = 0LL;
        }
      }

      else
      {
LABEL_21:
        uint64_t v6 = 100LL;
      }
    }

    else
    {
      BOOL v7 = v5 == 10006 || v5 == 50000;
      uint64_t v8 = 20LL;
      if (!v7) {
        uint64_t v8 = 0LL;
      }
      if ((v4 & 1) != 0) {
        uint64_t v6 = 40LL;
      }
      else {
        uint64_t v6 = v8;
      }
    }
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  return v6;
}

- (uint64_t)_terminationResistance
{
  if (result)
  {
    unint64_t v1 = [(id)result reason];
    unint64_t v2 = v1;
    if (v1 <= 0x17 && ((1LL << v1) & 0xA9132E) != 0) {
      return 40LL;
    }
    double result = 20LL;
    unint64_t v3 = v2 - 10000;
    if (v3 <= 8 && ((1LL << v3) & 0x181) != 0) {
      return 40LL;
    }
  }

  return result;
}

- (uint64_t)_maxCPUDuration
{
  if (result)
  {
    uint64_t v1 = [(id)result reason];
    switch(v1)
    {
      case 19LL:
      case 21LL:
      case 22LL:
        goto LABEL_6;
      case 20LL:
      case 23LL:
        double result = 15LL;
        break;
      default:
        if (v1 == 4) {
          double result = 180LL;
        }
        else {
LABEL_6:
        }
          double result = 60LL;
        break;
    }
  }

  return result;
}

- (BOOL)_isLegacyReasonFinishableTask:(BOOL)result
{
  if (result)
  {
    double result = 1LL;
  }

  return result;
}

- (uint64_t)_isOriginatorValidForContext:(const __CFString *)a3 errorReason:
{
  uint64_t v44 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  if (!a1) {
    goto LABEL_40;
  }
  if (!a3)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    [v34 handleFailureInMethod:sel__isOriginatorValidForContext_errorReason_ object:a1 file:@"RBSLegacyAttribute+RBProcessState.m" lineNumber:383 description:@"outReason is required"];
  }

  unint64_t v6 = [a1 requestedReason];
  if (v6 > 0x17) {
    goto LABEL_25;
  }
  if (((1LL << v6) & 0xBD15AE) != 0)
  {
LABEL_27:
    [v5 originatorEntitlements];
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v7 = v25;
    goto LABEL_28;
  }

  if (((1LL << v6) & 0x2200) != 0)
  {
    [v5 originatorProcess];
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 targetProcess];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 != v8)
    {
      if ([a1 reason] == 9 && objc_msgSend(v7, "isLifecycleManaged"))
      {
        [v5 originatorState];
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
        [v9 inheritances];
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
        [v10 allNamespaces];
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        int v12 = [v11 containsObject:*MEMORY[0x189612510]];

        [v5 originatorEntitlements];
        int v13 = (void *)objc_claimAutoreleasedReturnValue();
        int v14 = [v13 hasEntitlement:@"com.apple.assertiond.background-view-services"];

        __int128 v37 = 0u;
        __int128 v38 = 0u;
        __int128 v35 = 0u;
        __int128 v36 = 0u;
        objc_msgSend(v9, "legacyAssertions", 0);
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v16 = [v15 countByEnumeratingWithState:&v35 objects:v43 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v36;
          while (2)
          {
            uint64_t v19 = 0LL;
            do
            {
              if (*(void *)v36 != v18) {
                objc_enumerationMutation(v15);
              }
              if ([*(id *)(*((void *)&v35 + 1) + 8 * v19) isLegacyAssertionReason:9])
              {

                goto LABEL_46;
              }

              ++v19;
            }

            while (v17 != v19);
            uint64_t v17 = [v15 countByEnumeratingWithState:&v35 objects:v43 count:16];
            if (v17) {
              continue;
            }
            break;
          }
        }

        if (((v12 | v14) & 1) == 0)
        {
          *a3 = @"Originator for view service request is not in a valid state";

LABEL_39:
LABEL_40:
          uint64_t v26 = 0LL;
          goto LABEL_41;
        }

- (uint64_t)_isTargetValidForContext:(const __CFString *)a3 errorReason:
{
  id v5 = a2;
  unint64_t v6 = v5;
  if (a1)
  {
    if ([v5 targetIsSystem])
    {
      a1 = 0LL;
      BOOL v7 = @"Attribute may not target the system";
LABEL_4:
      *a3 = v7;
      goto LABEL_20;
    }

    uint64_t v8 = [(id)a1 reason];
    if (v8 > 12)
    {
      if (v8 == 10006)
      {
        if (([v6 ignoreRestrictions] & 1) == 0)
        {
          [v6 targetProperties];
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
          char v17 = [v16 supportsBackgroundContentFetching];

          if ((v17 & 1) == 0)
          {
            a1 = 0LL;
            BOOL v7 = @"Target doesn't support background content fetching";
            goto LABEL_4;
          }
        }
      }

      else if (v8 == 13)
      {
        [v6 targetIdentity];
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        char v12 = [v11 isXPCService];

        if ((v12 & 1) == 0)
        {
          a1 = 0LL;
          BOOL v7 = @"Target is not an xpc service";
          goto LABEL_4;
        }
      }
    }

    else if (v8 == 9)
    {
      [v6 targetProcess];
      int v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 entitlementManager];
      int v14 = (void *)objc_claimAutoreleasedReturnValue();
      [v14 entitlementsForProcess:v13];
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (([v15 hasEntitlement:@"com.apple.UIKit.vends-view-services"] & 1) == 0)
      {
        *a3 = @"Target lacks view service entitlement";

        a1 = 0LL;
        goto LABEL_20;
      }
    }

    else if (v8 == 12 && ([v6 ignoreRestrictions] & 1) == 0)
    {
      [v6 targetProperties];
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      char v10 = [v9 usesSocketMonitoring];

      if ((v10 & 1) == 0)
      {
        a1 = 0LL;
        BOOL v7 = @"Target doesn't support socket monitoring";
        goto LABEL_4;
      }
    }

    *a3 = 0LL;
    a1 = 1LL;
  }

@end