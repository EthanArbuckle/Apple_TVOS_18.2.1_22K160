}

id sub_5078()
{
  if (qword_2CE38 != -1) {
    dispatch_once(&qword_2CE38, &stru_28A98);
  }
  return (id)qword_2CE40;
}

void sub_560C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id *location)
{
}

void sub_5640(uint64_t a1, void *a2, void *a3)
{
  id WeakRetained = a3;
  id v10 = (id)objc_claimAutoreleasedReturnValue([a2 objectForKey:@"Result"]);
  if ([*(id *)(a1 + 32) _shouldRetryEvaluationForError:WeakRetained options:*(void *)(a1 + 40)])
  {
    [*(id *)(a1 + 48) setRetryingForError:WeakRetained];

    uint64_t v6 = *(void *)(a1 + 80);
    v7 = *(void **)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 56);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    [v7 evaluatePolicy:v6 options:v8 uiDelegate:v9 originator:WeakRetained request:*(void *)(a1 + 48) reply:*(void *)(a1 + 64)];
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16LL))();
  }
}

void sub_5710(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  if (a5)
  {
    uint64_t v6 = *(void (**)(void))(*(void *)(a1 + 72) + 16LL);
LABEL_3:
    v6();
    return;
  }

  objc_msgSend(*(id *)(a1 + 32), "setImmediateSuccess:");
  id v10 = *(void **)(a1 + 40);
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"ACM verification of %s",  +[LAACMHelper acmPolicyForPolicy:]( &OBJC_CLASS___LAACMHelper,  "acmPolicyForPolicy:",  *(void *)(a1 + 80))));
  LOBYTE(v10) = [v10 _shouldFailOnAcmStatus:a2 action:v11 failureHandler:*(void *)(a1 + 72)];

  if ((v10 & 1) == 0)
  {
    if ((_DWORD)a2 == -2)
    {
      id v17 = (id)objc_claimAutoreleasedReturnValue( +[LAErrorHelper errorWithCode:message:]( &OBJC_CLASS___LAErrorHelper,  "errorWithCode:message:",  -10LL,  @"ACM context not found."));
      v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) callback]);
      [v12 invalidatedWithError:v17];

      (*(void (**)(void, void, id))(*(void *)(a1 + 72) + 16LL))(*(void *)(a1 + 72), 0LL, v17);
    }

    else
    {
      v13 = *(void **)(a1 + 40);
      if (a3)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue([v13 resultInfo]);
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"Result"]);

        uint64_t v16 = *(void *)(a1 + 72);
        if (!v15)
        {
          uint64_t v6 = *(void (**)(void))(v16 + 16);
          goto LABEL_3;
        }

        id v17 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) resultInfo]);
        (*(void (**)(uint64_t, id, void))(v16 + 16))(v16, v17, 0LL);
      }

      else
      {
        id v17 = (id)objc_claimAutoreleasedReturnValue( [v13 createInternalInfoWithPolicy:*(void *)(a1 + 80) policyOptions:*(void *)(a1 + 56) request:*(void *)(a1 + 32) originator:*(void *)(a1 + 48)]);
        [*(id *)(a1 + 40) _handleAcmRequirement:a4 policy:*(void *)(a1 + 80) constraintData:0 operation:0 internalInfo:v17 uiDelegate:*(void *)(a1 + 64) originator:*(void *)(a1 + 48) request:*(void *)(a1 + 32) reply:*(void *)(a1 + 72)];
      }
    }
  }

void sub_634C(_Unwind_Exception *a1)
{
}

void sub_6370(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if (v5)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 48);
    id v8 = a3;
    char isKindOfClass = objc_opt_isKindOfClass(v6, v7);
    id v10 = *(void **)(a1 + 32);
    if ((isKindOfClass & 1) != 0)
    {
      [v10 setPIN:v5];
    }

    else if ((objc_opt_isKindOfClass(v10, *(void *)(a1 + 56)) & 1) != 0)
    {
      [*(id *)(a1 + 32) setPassword:v5];
    }

    v18 = @"Result";
    v16[0] = &off_29F28;
    v16[1] = &off_29F40;
    uint64_t v14 = *(void *)(a1 + 32);
    v17[0] = &__kCFBooleanTrue;
    v17[1] = v14;
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v17,  v16,  2LL));
    v19 = v15;
    id v13 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v19,  &v18,  1LL));

    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }

  else
  {
    uint64_t v11 = *(void *)(a1 + 40);
    v12 = *(void (**)(uint64_t, void, id))(v11 + 16);
    id v13 = a3;
    v12(v11, 0LL, v13);
  }
}

void sub_64E4(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue([a2 objectForKeyedSubscript:@"PIN"]);
    uint64_t v4 = *(void *)(a1 + 32);
    id v6 = (id)v3;
    if (v3)
    {
      (*(void (**)(uint64_t, uint64_t, void))(v4 + 16))(v4, v3, 0LL);
    }

    else
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue( +[LAErrorHelper internalErrorWithMessage:]( &OBJC_CLASS___LAErrorHelper,  "internalErrorWithMessage:",  @"Missing CTK PIN"));
      (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0LL, v5);
    }
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }

void sub_6670(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = a5;
  uint64_t v8 = LACLogACM();
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(a1 + 40);
    uint64_t v11 = NSStringFromACMRequirement(a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    int v13 = 136315394;
    uint64_t v14 = v10;
    __int16 v15 = 2112;
    uint64_t v16 = v12;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Policy '%s' is requesting: %@", (uint8_t *)&v13, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_6A40(_Unwind_Exception *a1)
{
}

void sub_6A64(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (+[LAErrorHelper error:hasCode:](&OBJC_CLASS___LAErrorHelper, "error:hasCode:", v12, -1004LL))
  {
    uint64_t v18 = 0LL;
    v19 = &v18;
    uint64_t v20 = 0x3032000000LL;
    v21 = sub_6C54;
    v22 = sub_6C64;
    id v23 = (id)objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    void v17[2] = sub_6C6C;
    v17[3] = &unk_285A0;
    v17[4] = &v18;
    [v10 enumerateKeysAndObjectsUsingBlock:v17];
    int v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithObject:forKey:",  v19[5],  LAAvailableMechanisms));
    [v13 setObject:v11 forKeyedSubscript:LAMechanismTree];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v12 userInfo]);
    __int16 v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryByMerging:with:]( &OBJC_CLASS___NSDictionary,  "dictionaryByMerging:with:",  v14,  v13));

    uint64_t v16 = objc_claimAutoreleasedReturnValue( +[LAErrorHelper errorWithCode:userInfo:]( &OBJC_CLASS___LAErrorHelper,  "errorWithCode:userInfo:",  -1004LL,  v15));
    _Block_object_dispose(&v18, 8);

    id v12 = (id)v16;
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_6C34( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_6C54(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_6C64(uint64_t a1)
{
}

void sub_6C6C(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  if ([a3 BOOLValue])
  {
    uint64_t v5 = objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) arrayByAddingObject:v8]);
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8LL);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
}

void sub_6CD8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 availableMechanisms]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 mechanismTree]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 internalInfo]);
  id v10 = *(void **)(a1 + 32);
  if (v10) {
    [v10 event:0 params:v7 reply:&stru_28608];
  }
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v5 mechanism]);
  if (v11)
  {
    uint64_t v12 = *(void *)(a1 + 40);
    id v15 = v6;
    uint64_t v16 = *(void **)(v12 + 40);
    int v13 = *(void **)(a1 + 96);
    uint64_t v17 = *(void *)(a1 + 48);
    uint64_t v14 = *(void *)(a1 + 64);
    uint64_t v18 = *(void *)(a1 + 56);
    uint64_t v19 = *(void *)(a1 + 32);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_6F14;
    v20[3] = &unk_28658;
    v20[4] = v12;
    v29[1] = v13;
    id v21 = *(id *)(a1 + 72);
    id v22 = *(id *)(a1 + 48);
    id v23 = v9;
    id v24 = *(id *)(a1 + 32);
    objc_copyWeak(v29, (id *)(a1 + 88));
    id v25 = *(id *)(a1 + 64);
    id v26 = v7;
    id v28 = *(id *)(a1 + 80);
    id v27 = v8;
    [v16 authenticateForPolicy:v13 constraintData:v17 internalInfo:v23 uiDelegate:v19 originator:v18 request:v14 mechanism:v11 reply:v20];

    objc_destroyWeak(v29);
    id v6 = v15;
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 80) + 16LL))();
  }
}

void sub_6EFC(_Unwind_Exception *a1)
{
}

void sub_6F14(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *(void *)(a1 + 112);
  id v15 = *(void **)(a1 + 32);
  id v16 = a3;
  id v5 = a2;
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"ConstraintData"]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:*(void *)(a1 + 40)]);
  id v7 = v6;
  if (!v6) {
    id v7 = *(void **)(a1 + 48);
  }
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 56);
  uint64_t v10 = *(void *)(a1 + 64);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 104));
  uint64_t v12 = *(void *)(a1 + 72);
  uint64_t v13 = *(void *)(a1 + 80);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_7070;
  v18[3] = &unk_28630;
  id v21 = *(id *)(a1 + 96);
  id v19 = *(id *)(a1 + 80);
  id v20 = *(id *)(a1 + 88);
  [v15 finishedAuthenticationForPolicy:v14 constraintData:v7 operation:v8 internalInfo:v9 uiDelegate:v10 originator:WeakRetained request:v12 availabilityEven ts:v13 result:v5 error:v16 reply:v18];
}

uint64_t sub_7070(void *a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, uint64_t, void, void, uint64_t))(a1[6] + 16LL))( a1[6],  a2,  a1[4],  a1[5],  a3);
}

void sub_7194(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _unsatisfiedListForRequirement:a2]);
  if (v3)
  {
    uint64_t v4 = v3;
    [*(id *)(a1 + 40) addObject:v3];
    uint64_t v3 = v4;
  }
}

void sub_76B0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id *location)
{
}

void sub_76E0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (*(void *)(a1 + 32))
  {
    id v7 = *(void **)(a1 + 40);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_77F4;
    v9[3] = &unk_286F0;
    objc_copyWeak(&v12, (id *)(a1 + 64));
    id v10 = v5;
    id v11 = *(id *)(a1 + 32);
    [v7 enumerateKeysAndObjectsUsingBlock:v9];

    objc_destroyWeak(&v12);
  }

  if (v5) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = &__NSDictionary0__struct;
  }
  [*(id *)(a1 + 48) setResultInfo:v8];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
}

void sub_77E0(_Unwind_Exception *a1)
{
}

void sub_77F4(uint64_t a1, void *a2)
{
  uint64_t v3 = (id *)(a1 + 48);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v6 = [v4 integerValue];
  id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:@"Result"]);
  id v8 = [WeakRetained _isEvent:v6 contributingToResult:v7];

  uint64_t v13 = &off_2A018;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v8));
  uint64_t v14 = v9;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v14,  &v13,  1LL));

  id v11 = *(void **)(a1 + 40);
  id v12 = [v4 integerValue];

  [v11 event:v12 params:v10 reply:&stru_286C8];
}

void sub_792C(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, void *a6)
{
  id v11 = a6;
  if (v11)
  {
    id v12 = *(void (**)(void))(*(void *)(a1 + 96) + 16LL);
LABEL_3:
    v12();
    goto LABEL_10;
  }

  uint64_t v13 = *(void **)(a1 + 32);
  uint64_t v14 = *(void *)(a1 + 104);
  if (v14) {
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  +[LAACMHelper acmPolicyForPolicy:]( &OBJC_CLASS___LAACMHelper,  "acmPolicyForPolicy:",  *(void *)(a1 + 104))));
  }
  else {
    id v15 = *(void **)(a1 + 40);
  }
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Final ACM verification of %@",  v15));
  unsigned __int8 v17 = [v13 _shouldFailOnAcmStatus:a3 action:v16 failureHandler:*(void *)(a1 + 96)];

  if (v14) {
  if ((v17 & 1) == 0)
  }
  {
    if ((a4 & 1) != 0)
    {
LABEL_12:
      id v12 = *(void (**)(void))(*(void *)(a1 + 96) + 16LL);
      goto LABEL_3;
    }

    if (*(void *)(a1 + 48))
    {
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[LAACMHelper requirement:uint32Property:]( &OBJC_CLASS___LAACMHelper,  "requirement:uint32Property:",  a5,  700LL));
      if ([v18 unsignedIntValue] <= 1)
      {
      }

      else
      {
        unsigned int v19 = +[LAACMHelper requirement:hasState:andType:]( &OBJC_CLASS___LAACMHelper,  "requirement:hasState:andType:",  a5,  1LL,  8LL);

        if (v19) {
          goto LABEL_12;
        }
      }
    }

    if (+[LAACMHelper requirement:hasFlag:andType:]( &OBJC_CLASS___LAACMHelper,  "requirement:hasFlag:andType:",  a5,  16LL,  3LL))
    {
      uint64_t v20 = *(void *)(a1 + 96);
      id v21 = (void *)objc_claimAutoreleasedReturnValue( +[LAErrorHelper errorWithCode:message:]( &OBJC_CLASS___LAErrorHelper,  "errorWithCode:message:",  -1022LL,  @"Failed to match the bound identity."));
      (*(void (**)(uint64_t, void, void *))(v20 + 16))(v20, 0LL, v21);
    }

    else
    {
      id v22 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 56) objectForKeyedSubscript:@"SecondAcmRound"]);
      unsigned int v23 = [v22 BOOLValue];

      if (v23)
      {
        uint64_t v24 = *(void *)(a1 + 96);
        id v25 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _unsatisfiedListForRequirement:a5]);
        id v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"ACM %s succeeded, but ACM is still requesting %@ on ACMContext %u after a retry.",  a2,  v25,  [*(id *)(a1 + 32) instanceId]));
        id v27 = (void *)objc_claimAutoreleasedReturnValue( +[LAErrorHelper internalErrorWithMessage:]( &OBJC_CLASS___LAErrorHelper,  "internalErrorWithMessage:",  v26));
        (*(void (**)(uint64_t, void, void *))(v24 + 16))(v24, 0LL, v27);
      }

      else
      {
        id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) log]);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          unsigned int v30 = [*(id *)(a1 + 32) instanceId];
          v31 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _unsatisfiedListForRequirement:a5]);
          *(_DWORD *)buf = 136315650;
          uint64_t v33 = a2;
          __int16 v34 = 1024;
          unsigned int v35 = v30;
          __int16 v36 = 2114;
          v37 = v31;
          _os_log_error_impl( &dword_0,  v28,  OS_LOG_TYPE_ERROR,  "ACM verification not satisfied after %s on ACMContext %u '%{public}@', retrying second round",  buf,  0x1Cu);
        }

        [*(id *)(a1 + 32) _removeRequestedCredentials:a5];
        v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  *(void *)(a1 + 56)));
        [v29 setObject:&__kCFBooleanTrue forKey:@"SecondAcmRound"];
        [*(id *)(a1 + 32) _handleAcmRequirement:a5 policy:*(void *)(a1 + 104) constraintData:*(void *)(a1 + 72) operation:*(void *)(a1 + 40) internalInfo:v29 uiDelegate:*(void *)(a1 + 80) originator:*(void *)(a1 + 88) request:*(void *)(a1 + 64) reply:*(void *)(a1 + 96)];
      }
    }
  }

LABEL_10:
}

  id v15 = objc_opt_class(&OBJC_CLASS___NSNull);
  if ((objc_opt_isKindOfClass(v11, v15) & 1) != 0) {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[LAErrorHelper errorWithCode:message:]( &OBJC_CLASS___LAErrorHelper,  "errorWithCode:message:",  -1008LL,  @"Credential not set"));
  }
  else {
    uint64_t v16 = 0LL;
  }
LABEL_14:
  v9[2](v9, v16 == 0LL, v16);
}

  return v13;
}

  return v11;
}

uint64_t sub_7CCC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t sub_7CF0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

LABEL_13:
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ on ACMContext %u failed: %d",  v8,  -[ContextPluginACM instanceId](self, "instanceId"),  v6));
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[LAErrorHelper internalErrorWithMessage:]( &OBJC_CLASS___LAErrorHelper,  "internalErrorWithMessage:",  v6));
    v9[2](v9, 0LL, (uint64_t)v14);

    goto LABEL_14;
  }

  if ((_DWORD)v6 == -3)
  {
    if (+[LAUtils isDaytona](&OBJC_CLASS___LAUtils, "isDaytona"))
    {
      uint64_t v13 = objc_claimAutoreleasedReturnValue( +[LAErrorHelper errorDeviceDoesNotSupportAction:]( &OBJC_CLASS___LAErrorHelper,  "errorDeviceDoesNotSupportAction:",  v8));
      goto LABEL_10;
    }

    goto LABEL_13;
  }

  if ((_DWORD)v6) {
    goto LABEL_13;
  }
LABEL_15:

  return (char)v6;
}

id sub_80DC(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _removeRequestedCredentials:a2];
}

void sub_8500( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, id location)
{
}

void sub_851C(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"Result"]);
  id v9 = (id)v7;
  if (v7) {
    id v8 = (id)v7;
  }
  else {
    id v8 = v6;
  }
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v8, v5);
}

void sub_8594(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5
    && (v7 = *(void *)(a1 + 32), uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSNumber),
                                   (objc_opt_isKindOfClass(v7, v8) & 1) != 0)
    && ![*(id *)(a1 + 32) integerValue])
  {
    uint64_t v9 = *(void *)(a1 + 56);
    uint64_t v15 = *(void *)(a1 + 48);
    uint64_t v16 = *(void **)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 64);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 104));
    uint64_t v13 = *(void *)(a1 + 72);
    uint64_t v12 = *(void *)(a1 + 80);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    void v17[2] = sub_86E4;
    v17[3] = &unk_287E0;
    uint64_t v14 = *(void *)(a1 + 88);
    id v19 = *(id *)(a1 + 96);
    id v18 = v5;
    [v16 evaluateACL:v15 operation:@"oe" options:v9 uiDelegate:v10 originator:WeakRetained request:v13 callerName:v12 callerBundleId:v14 reply:v17];
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 96) + 16LL))();
  }
}

void sub_86E4(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (!v10)
  {
    uint64_t v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16LL);
LABEL_8:
    v9();
    goto LABEL_9;
  }

  if (![v10 count])
  {
    uint64_t v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16LL);
    goto LABEL_8;
  }

  id v6 = [*(id *)(a1 + 32) count];
  uint64_t v7 = *(void *)(a1 + 40);
  if (!v6)
  {
    uint64_t v9 = *(void (**)(void))(v7 + 16);
    goto LABEL_8;
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryByMerging:with:]( &OBJC_CLASS___NSDictionary,  "dictionaryByMerging:with:",  *(void *)(a1 + 32),  v10));
  (*(void (**)(uint64_t, void *, void))(v7 + 16))(v7, v8, 0LL);

LABEL_9:
}

void sub_8BC0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, char a27)
{
}

void sub_8BE0(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v10 = 0LL;
  unsigned __int8 v5 = [v2 evaluateAccessControl:v3 forOperation:v4 error:&v10];
  id v6 = v10;
  *(_BYTE *)(*(void *)(a1 + 56) + 64LL) = 0;
  if ((v5 & 1) != 0)
  {
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) log]);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "TKClientTokenSession evaluated ACL successfully.", v9, 2u);
    }

    uint64_t v8 = *(void (**)(void))(*(void *)(a1 + 72) + 16LL);
  }

  else
  {
    uint64_t v8 = *(void (**)(void))(*(void *)(a1 + 72) + 16LL);
  }

  v8();
}

void sub_91AC(_Unwind_Exception *a1)
{
}

void sub_91CC(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 64);
  uint64_t v6 = *(void *)(a1 + 72);
  uint64_t v7 = *(void *)(a1 + 80);
  uint64_t v8 = *(void *)(a1 + 88);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_9288;
  v10[3] = &unk_28550;
  uint64_t v9 = *(void *)(a1 + 96);
  id v11 = *(id *)(a1 + 104);
  [v1 _handleCTKACL:v2 tokenId:v3 operation:v4 options:v5 originator:v6 request:v7 callerName:v8 callerBundleId:v9 reply:v10];
}

void sub_9288(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(+[DaemonUtils queue](&OBJC_CLASS___DaemonUtils, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_9358;
  block[3] = &unk_28858;
  id v8 = *(id *)(a1 + 32);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t sub_9358(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16LL))(a1[6], a1[4], a1[5]);
}

void sub_9558(_Unwind_Exception *a1)
{
}

void sub_9574(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    id v13 = *(void (**)(void))(*(void *)(a1 + 88) + 16LL);
LABEL_8:
    v13();
    goto LABEL_9;
  }

  if (!SecAccessControlGetRequirePassword(*(void *)(a1 + 32)))
  {
    id v13 = *(void (**)(void))(*(void *)(a1 + 88) + 16LL);
    goto LABEL_8;
  }

  uint64_t v7 = *(void **)(a1 + 40);
  uint64_t v14 = *(void *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 96));
  uint64_t v10 = *(void *)(a1 + 64);
  uint64_t v11 = *(void *)(a1 + 72);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_96C8;
  v15[3] = &unk_288A8;
  uint64_t v12 = *(void *)(a1 + 80);
  id v17 = *(id *)(a1 + 88);
  id v16 = v5;
  LODWORD(v7) = [v7 _validatePassword:1 options:v14 uiDelegate:v8 originator:WeakRetained request:v10 callerName:v11 callerBundleId:v12 reply:v15];

  if ((_DWORD)v7) {
    (*(void (**)(void))(*(void *)(a1 + 88) + 16LL))();
  }

LABEL_9:
}

uint64_t sub_96C8(uint64_t a1, int a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  if (a2) {
    uint64_t v4 = *(void *)(a1 + 32);
  }
  else {
    uint64_t v4 = 0LL;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v3, v4);
}

uint64_t sub_9778(uint64_t a1, id a2)
{
  if (*(void *)(a1 + 32)) {
    **(void **)(a1 + 32) = a2;
  }
  return 0LL;
}

void sub_9E60(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  if (a5)
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 128) + 16LL);
LABEL_3:
    v6();
    return;
  }

  objc_msgSend(*(id *)(a1 + 32), "setImmediateSuccess:");
  if ((_DWORD)a2)
  {
    if ((_DWORD)a2 == -2)
    {
      id v29 = (id)objc_claimAutoreleasedReturnValue( +[LAErrorHelper errorWithCode:message:]( &OBJC_CLASS___LAErrorHelper,  "errorWithCode:message:",  -10LL,  @"ACM context not found."));
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) callback]);
      [v12 invalidatedWithError:v29];

      (*(void (**)(void))(*(void *)(a1 + 128) + 16LL))();
      goto LABEL_13;
    }

    if ((_DWORD)a2 == -3)
    {
      uint64_t v10 = *(void *)(a1 + 128);
      id v29 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid constraint: %@",  *(void *)(a1 + 40)));
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[LAErrorHelper parameterErrorWithMessage:]( &OBJC_CLASS___LAErrorHelper,  "parameterErrorWithMessage:",  v29));
      (*(void (**)(uint64_t, void, void *))(v10 + 16))(v10, 0LL, v11);

LABEL_13:
      return;
    }

    uint64_t v13 = *(void *)(a1 + 128);
    id v29 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", a2));
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"ACM constraint verification failed: %@",  v29));
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[LAErrorHelper internalErrorWithMessage:]( &OBJC_CLASS___LAErrorHelper,  "internalErrorWithMessage:",  v14));
    (*(void (**)(uint64_t, void, void *))(v13 + 16))(v13, 0LL, v15);

LABEL_12:
    goto LABEL_13;
  }

  if (*(_BYTE *)(a1 + 140))
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 128) + 16LL);
    goto LABEL_3;
  }

  if (a3)
  {
    uint64_t v16 = *(void *)(a1 + 128);
    id v29 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) resultInfo]);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v29 objectForKeyedSubscript:@"Result"]);
    if (v14)
    {
      id v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) resultInfo]);
      (*(void (**)(uint64_t, void *, void))(v16 + 16))(v16, v17, 0LL);
    }

    else
    {
      (*(void (**)(uint64_t, _UNKNOWN **, void))(v16 + 16))(v16, &off_2A208, 0LL);
    }

    goto LABEL_12;
  }

  id v18 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 64) createInternalInfo:*(void *)(a1 + 72) skipCallerIdentification:*(void *)(a1 + 80) != 0 callerBundleId:*(void *)(a1 + 88) request:*(void *)(a1 + 32) originator:*(void *)(a1 + 48)]);
  id v19 = v18;
  uint64_t v20 = *(void *)(a1 + 80);
  if (v20) {
    [v18 setObject:v20 forKey:@"CallerName"];
  }
  uint64_t v21 = *(void *)(a1 + 88);
  if (v21) {
    [v19 setObject:v21 forKey:@"CallerId"];
  }
  if (*(_DWORD *)(a1 + 136))
  {
    id v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:"));
    [v19 setObject:v22 forKey:@"GlobalCredential"];
  }

  [v19 setObject:*(void *)(a1 + 40) forKey:@"Constraint"];
  [v19 setObject:*(void *)(a1 + 96) forKey:@"ConstraintData"];
  [v19 setObject:*(void *)(a1 + 104) forKey:@"ConstraintOp"];
  uint64_t v23 = *(void *)(a1 + 96);
  uint64_t v24 = *(void *)(a1 + 104);
  uint64_t v25 = *(void *)(a1 + 112);
  uint64_t v26 = *(void *)(a1 + 48);
  uint64_t v27 = *(void *)(a1 + 32);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_A2D4;
  v30[3] = &unk_28918;
  id v28 = *(void **)(a1 + 72);
  id v31 = *(id *)(a1 + 64);
  id v32 = v28;
  id v33 = *(id *)(a1 + 32);
  id v34 = *(id *)(a1 + 104);
  id v35 = *(id *)(a1 + 120);
  id v36 = *(id *)(a1 + 112);
  id v37 = *(id *)(a1 + 48);
  char v41 = *(_BYTE *)(a1 + 140);
  id v38 = *(id *)(a1 + 80);
  id v39 = *(id *)(a1 + 88);
  id v40 = *(id *)(a1 + 128);
  [v31 _handleAcmRequirement:a4 policy:0 constraintData:v23 operation:v24 internalInfo:v19 uiDelegate:v25 originator:v26 request:v27 reply:v30];
}

void sub_A2D4(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if ([*(id *)(a1 + 32) _shouldRetryEvaluationForError:v5 options:*(void *)(a1 + 40)])
  {
    [*(id *)(a1 + 48) setRetryingForError:v5];
    LOBYTE(v6) = *(_BYTE *)(a1 + 112);
    [*(id *)(a1 + 32) _evaluateOperation:*(void *)(a1 + 56) aclRef:*(void *)(a1 + 64) options:*(void *)(a1 + 40) uiDelegate:*(void *)(a1 + 72) originator:*(void *)(a1 + 80) request:*(void *)(a1 + 48) validate:v6 callerName:*(void *)(a1 + 88) callerBundleId:*(void *)(a1 + 96) reply:*(void *)(a1 + 104)];
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 104) + 16LL))();
  }
}

void sub_A69C(_Unwind_Exception *a1)
{
}

void sub_A6C0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    uint64_t v13 = *(void (**)(void))(*(void *)(a1 + 80) + 16LL);
LABEL_8:
    v13();
    goto LABEL_9;
  }

  if (!SecAccessControlGetRequirePassword(*(void *)(a1 + 96)))
  {
    uint64_t v13 = *(void (**)(void))(*(void *)(a1 + 80) + 16LL);
    goto LABEL_8;
  }

  id v7 = *(void **)(a1 + 32);
  uint64_t v14 = *(void *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  uint64_t v10 = *(void *)(a1 + 56);
  uint64_t v11 = *(void *)(a1 + 64);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_A814;
  v15[3] = &unk_288A8;
  uint64_t v12 = *(void *)(a1 + 72);
  id v17 = *(id *)(a1 + 80);
  id v16 = v5;
  LODWORD(v7) = [v7 _validatePassword:0 options:v14 uiDelegate:v8 originator:WeakRetained request:v10 callerName:v11 callerBundleId:v12 reply:v15];

  if ((_DWORD)v7) {
    (*(void (**)(void))(*(void *)(a1 + 80) + 16LL))();
  }

LABEL_9:
}

uint64_t sub_A814(uint64_t a1, int a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  if (a2) {
    uint64_t v4 = *(void *)(a1 + 32);
  }
  else {
    uint64_t v4 = 0LL;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v3, v4);
}

void sub_AB10(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = *(id *)(a1 + 32);
    if ([v3 count])
    {
      uint64_t v7 = *(void *)(a1 + 40);
      id v8 = v3;
      id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v8,  &v7,  1LL));
      uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 dictionaryByMergingWith:v5]);

      id v4 = (id)v6;
    }

    [*(id *)(a1 + 48) _validateOperations:*(void *)(a1 + 56) aclRef:*(void *)(a1 + 64) evaluateOperation:*(void *)(a1 + 72) options:*(void *)(a1 + 80) uiDelegate:*(void *)(a1 + 88) originator:*(void *)(a1 + 96) request:*(void *)(a1 + 104) currentResult:v4 reply:*(void *)(a1 + 112)];
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 112) + 16LL))();
  }
}

void sub_B1B0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id *location)
{
}

void sub_B1D4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKey:&off_2A0A8]);
  id v5 = v4;
  if (v4)
  {
    [v4 doubleValue];
    dispatch_time_t v7 = dispatch_time(0LL, (uint64_t)(v6 * 1000000000.0));
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[DaemonUtils sharedInstance](&OBJC_CLASS___DaemonUtils, "sharedInstance"));
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v8 serverQueue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_B364;
    block[3] = &unk_289B8;
    id v18 = v3;
    dispatch_after(v7, v9, block);
  }

  uint64_t v10 = *(void *)(a1 + 48);
  uint64_t v11 = *(void **)(*(void *)(a1 + 40) + 40LL);
  uint64_t v12 = *(void *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_B3BC;
  v15[3] = &unk_289E0;
  void v15[4] = *(void *)(a1 + 40);
  uint64_t v14 = *(void *)(a1 + 64);
  id v16 = *(id *)(a1 + 72);
  [v11 authenticateForPolicy:0 constraintData:0 internalInfo:v10 uiDelegate:v12 originator:WeakRetained request:v14 mechanism:v3 reply:v15];
}

void sub_B364(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = (id)objc_claimAutoreleasedReturnValue( +[LAErrorHelper errorWithCode:message:]( &OBJC_CLASS___LAErrorHelper,  "errorWithCode:message:",  -1003LL,  @"Timeout expired."));
  [v1 finishRunWithResult:0 error:v2];
}

uint64_t sub_B3BC(uint64_t a1, uint64_t a2)
{
  if (a2) {
    ++*(void *)(*(void *)(a1 + 32) + 16LL);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_BA7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", a2, a3));
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }

  else
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v6 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"ACMContextGetExternalForm failed."));
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[LAErrorHelper internalErrorWithMessage:](&OBJC_CLASS___LAErrorHelper, "internalErrorWithMessage:"));
    (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0LL, v5);
  }
}

void sub_BDB4(uint64_t a1, uint64_t a2)
{
  if ((_DWORD)a2 == -7)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v5 = (id)objc_claimAutoreleasedReturnValue( +[LAErrorHelper errorWithCode:message:]( &OBJC_CLASS___LAErrorHelper,  "errorWithCode:message:",  -1008LL,  @"Blob not found."));
    (*(void (**)(uint64_t, void, id))(v3 + 16))(v3, 0LL, v5);
  }

  else
  {
    uint64_t v2 = *(void *)(a1 + 32);
    if ((_DWORD)a2)
    {
      id v5 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"ACM failed to get ACL auth method: %d",  a2));
      uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[LAErrorHelper internalErrorWithMessage:]( &OBJC_CLASS___LAErrorHelper,  "internalErrorWithMessage:"));
      (*(void (**)(uint64_t, void, void *))(v2 + 16))(v2, 0LL, v4);
    }

    else
    {
      id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:"));
      (*(void (**)(uint64_t, id, void))(v2 + 16))(v2, v5, 0LL);
    }
  }
}

void sub_BF94(id a1)
{
  uint64_t v1 = LALogForCategory(0x4000LL);
  uint64_t v2 = objc_claimAutoreleasedReturnValue(v1);
  uint64_t v3 = (void *)qword_2CE40;
  qword_2CE40 = v2;
}

Class sub_BFBC(uint64_t a1)
{
  Class result = objc_getClass("TKTokenSmartCardPINAuthOperation");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    qword_2CE48 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  }

  else
  {
    sub_1FD18();
    return (Class)sub_C010();
  }

  return result;
}

uint64_t sub_C010()
{
  uint64_t v3 = 0LL;
  if (!qword_2CE50)
  {
    __int128 v4 = off_28AE0;
    uint64_t v5 = 0LL;
    qword_2CE50 = _sl_dlopen(&v4, &v3);
  }

  uint64_t v0 = qword_2CE50;
  uint64_t v1 = v3;
  if (!qword_2CE50)
  {
    uint64_t v1 = (char *)abort_report_np("%s", v3);
    goto LABEL_7;
  }

  if (v3) {
LABEL_7:
  }
    free(v1);
  return v0;
}

Class sub_C0C0(uint64_t a1)
{
  Class result = objc_getClass("TKTokenPasswordAuthOperation");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    qword_2CE58 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  }

  else
  {
    uint64_t v3 = sub_1FD3C();
    return (Class)sub_C114(v3);
  }

  return result;
}

ModuleACM *sub_C114(uint64_t a1)
{
  Class result = (ModuleACM *)objc_getClass("TKClientToken");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    qword_2CE60 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  }

  else
  {
    uint64_t v3 = (ModuleACM *)sub_1FD60();
    return -[ModuleACM init](v3, v4);
  }

  return result;
}

LABEL_9:
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( -[ModuleACM _pluginForACMContext:contextOwner:]( self,  "_pluginForACMContext:contextOwner:",  v10,  v6 == 0LL));
  ((void (**)(id, void *, void *))v7)[2](v7, v15, 0LL);

LABEL_11:
}

  uint64_t v17 = v24;
  if (v24 == 2)
  {
LABEL_19:
    --**(void **)(a1 + 120);
    goto LABEL_20;
  }

void sub_CE7C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, char a33)
{
}

uint64_t sub_CEC8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_CED8(uint64_t a1)
{
}

void sub_CEE0(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v5 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
  id v12 = v4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 creationTime]);
  dispatch_time_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 laterDate:v6]);
  id v8 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);

  if (v7 == v8)
  {
    uint64_t v9 = objc_claimAutoreleasedReturnValue([v12 creationTime]);
    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8LL);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a2);
  }
}

void sub_D30C(id a1)
{
  uint64_t v1 = objc_opt_new(&OBJC_CLASS___MechanismManagerACM);
  uint64_t v2 = (void *)qword_2CE70;
  qword_2CE70 = (uint64_t)v1;
}

LABEL_50:
          v50 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unexpected ACM requirement: %d",  v21));
          v43 = (__CFString *)objc_claimAutoreleasedReturnValue( +[LAErrorHelper silentInternalErrorWithMessage:]( &OBJC_CLASS___LAErrorHelper,  "silentInternalErrorWithMessage:",  v50));

          uint64_t v23 = 0LL;
          uint64_t v26 = @"skipping this requirement";
          goto LABEL_56;
        }

        switch((_DWORD)v21)
        {
          case 1:
            v71 = 0LL;
            uint64_t v23 = (__CFString *)objc_claimAutoreleasedReturnValue( -[MechanismManagerACM loadMechanism:initParams:request:error:]( self,  "loadMechanism:initParams:request:error:",  1LL,  v64,  v16,  &v71));
            v44 = v71;
            break;
          case 2:
            objc_msgSend( v14,  "setPassphrasePurpose:",  -[MechanismManagerACM _acmPurposeForPolicy:](self, "_acmPurposeForPolicy:", a5));
            v70 = 0LL;
            uint64_t v23 = (__CFString *)objc_claimAutoreleasedReturnValue( -[MechanismManagerACM loadMechanism:initParams:request:className:error:]( self,  "loadMechanism:initParams:request:className:error:",  1LL,  v64,  v16,  @"MechanismPassphrase",  &v70));
            v44 = v70;
            break;
          case 7:
            uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[LAACMHelper requirement:uint32Property:]( &OBJC_CLASS___LAACMHelper,  "requirement:uint32Property:",  a3,  700LL));
            uint64_t v25 = v24;
            if (!v24)
            {
              uint64_t v26 = (__CFString *)objc_claimAutoreleasedReturnValue( +[LAErrorHelper internalErrorWithMessage:]( &OBJC_CLASS___LAErrorHelper,  "internalErrorWithMessage:",  @"Missing k in KofN."));
              uint64_t v23 = 0LL;
LABEL_77:

              goto LABEL_45;
            }

            *(void *)&buf = [v24 unsignedIntegerValue];
            v67 = 0LL;
            v62 = (void *)objc_claimAutoreleasedReturnValue( -[MechanismManagerACM _nonUiSubmechanismsForACMRequirement:acmContextRecord:policy:internalInfo:request:requiredCount:error:]( self,  "_nonUiSubmechanismsForACMRequirement:acmContextRecord:policy:internalInfo:request:requiredCount:error:",  a3,  v14,  a5,  v15,  v16,  &buf,  &v67));
            uint64_t v26 = (__CFString *)v67;
            if ([v62 count])
            {
              uint64_t v27 = (id)buf;
              id v28 = v27 == [v62 count];
              uint64_t v23 = (__CFString *)objc_claimAutoreleasedReturnValue( +[MechanismKofN mechanismWithK:ofSubmechanisms:serial:request:]( &OBJC_CLASS___MechanismKofN,  "mechanismWithK:ofSubmechanisms:serial:request:",  (void)buf,  v62,  v28,  v16));
              if (!v23)
              {
                id v37 = (__CFString *)objc_claimAutoreleasedReturnValue( +[LAErrorHelper internalErrorWithMessage:]( &OBJC_CLASS___LAErrorHelper,  "internalErrorWithMessage:",  @"Failed to create kofn mechanism."));
                uint64_t v23 = 0LL;
LABEL_75:

                uint64_t v26 = v37;
                goto LABEL_76;
              }

              if ([v62 count] == (char *)&dword_0 + 2)
              {
                v61 = (__CFString *)objc_claimAutoreleasedReturnValue([v62 objectAtIndex:0]);
                v60 = (__CFString *)objc_claimAutoreleasedReturnValue([v62 objectAtIndex:1]);
                id v29 = objc_opt_class(&OBJC_CLASS___MechanismACM);
                if (((objc_opt_isKindOfClass(v61, v29) & 1) != 0
                   && (unsigned int v30 = -[__CFString acmFlags](v61, "acmFlags"), v31 = v60, (v30 & 1) != 0)
                   || (id v32 = objc_opt_class(&OBJC_CLASS___MechanismACM), (objc_opt_isKindOfClass(v60, v32) & 1) != 0)
                   && (id v33 = -[__CFString acmFlags](v60, "acmFlags"), v31 = v61, (v33 & 1) != 0))
                  && (id v34 = v31) != 0LL)
                {
                  v59 = v34;
                  id v35 = buf;
                  if (v35 >= (unint64_t)[v62 count])
                  {
                    id v37 = v26;
                  }

                  else
                  {
                    v58 = (void *)objc_claimAutoreleasedReturnValue(+[LAPasscodeHelper sharedInstance](&OBJC_CLASS___LAPasscodeHelper, "sharedInstance"));
                    v57 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"UserId"]);
                    v66 = v26;
                    id v36 = objc_msgSend( v58,  "isPasscodeSetForUser:error:",  objc_msgSend(v57, "unsignedIntValue"),  &v66);
                    id v37 = v66;

                    id v38 = v59;
                    if (!v36) {
                      id v38 = 0LL;
                    }
                    id v39 = v38;

                    uint64_t v23 = v39;
                  }

                  v56 = v59;
                }

                else
                {
                  v56 = 0LL;
                  id v37 = v26;
                }

                uint64_t v26 = v61;
                goto LABEL_75;
              }
            }

            else
            {
              uint64_t v23 = 0LL;
            }

LABEL_76:
            goto LABEL_77;
          default:
            goto LABEL_50;
        }

LABEL_44:
        uint64_t v26 = v44;
LABEL_45:
        if (v23 && v22 == 3)
        {

          v43 = (__CFString *)objc_claimAutoreleasedReturnValue( +[LAErrorHelper errorWithCode:subcode:message:]( &OBJC_CLASS___LAErrorHelper,  "errorWithCode:subcode:message:",  -1LL,  6LL,  @"Unsatisfiable constraint."));
          v47 = (os_log_s *)objc_claimAutoreleasedReturnValue([v16 log]);
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
          {
            v48 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"UserId"]);
            v49 = (void *)objc_claimAutoreleasedReturnValue(+[LAACMHelper catacombUUID:](&OBJC_CLASS___LAACMHelper, "catacombUUID:", v48));
            LODWORD(buf) = 138543362;
            *(void *)((char *)&buf + 4) = v49;
            _os_log_impl(&dword_0, v47, OS_LOG_TYPE_DEFAULT, "ACM catacombUUID: %{public}@", (uint8_t *)&buf, 0xCu);
          }

          uint64_t v23 = 0LL;
          uint64_t v26 = v43;
          goto LABEL_56;
        }

        goto LABEL_55;
      }
    }
  }

  uint64_t v23 = 0LL;
  if (a9) {
    *a9 = (id)objc_claimAutoreleasedReturnValue( +[LAErrorHelper silentInternalErrorWithMessage:]( &OBJC_CLASS___LAErrorHelper,  "silentInternalErrorWithMessage:",  @"Bad parameters"));
  }
LABEL_69:

  return v23;
}

void sub_E39C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, char a33)
{
}

uint64_t sub_E3BC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_E3CC(uint64_t a1)
{
}

void sub_E3D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", a2, a3));
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8LL);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void sub_E8D4(_Unwind_Exception *a1)
{
}

void sub_E904(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  ACMRequirementGetType(a2, a2));
  id v4 = (id)objc_claimAutoreleasedReturnValue(v3);
  [v2 addObject:v4];
}

void sub_E95C(uint64_t a1, uint64_t a2)
{
  int v24 = 0;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 104);
  uint64_t v8 = *(void *)(a1 + 56);
  id v23 = 0LL;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( [v4 _nonUiMechanismForACMRequirement:a2 acmContextRecord:v5 policy:v7 internalInfo:v6 request:v8 state:&v24 error:&v23]);
  id v10 = v23;
  id v12 = v10;
  if (!v9)
  {
    id v15 = v10;
    goto LABEL_15;
  }

  uint64_t v13 = *(void *)(a1 + 56);
  id v22 = v10;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v9 bestEffortAvailableMechanismForRequest:v13 error:&v22]);
  id v15 = v22;

  if (!v14)
  {
    if ([v9 canRecoverFromError:v15 request:*(void *)(a1 + 56)])
    {

      id v15 = 0LL;
      goto LABEL_5;
    }

LABEL_15:
    int Type = ACMRequirementGetType(a2, v11);
    if (ACMRequirementGetState(a2, v19) == 2 || Type == 8)
    {
      uint64_t v9 = 0LL;
      goto LABEL_19;
    }

    uint64_t v9 = 0LL;
LABEL_20:
    int v17 = v24;
    goto LABEL_21;
  }

LABEL_5:
  unsigned int v16 = v24 == 1;
  if (v24 == 2)
  {
    unsigned int v16 = +[LAACMHelper requirement:hasState:andType:]( &OBJC_CLASS___LAACMHelper,  "requirement:hasState:andType:",  a2,  2LL,  11LL);
    if (*(void *)(a1 + 112) == 2LL)
    {
      if ([*(id *)(a1 + 64) containsObject:&off_2A120])
      {
        goto LABEL_12;
      }
    }
  }

  if (v16)
  {
LABEL_12:
    [*(id *)(a1 + 72) addObject:v9];
    goto LABEL_20;
  }

LABEL_21:
  if (v17 == 3) {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 96) + 8LL) + 24LL) = 1;
  }
  if (v15)
  {
    uint64_t v20 = *(void **)(a1 + 80);
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v15 code]));
    [v20 setObject:v15 forKey:v21];
  }
}

BOOL sub_EF60(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = objc_autoreleasePoolPush();
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  uint64_t v22 = 0LL;
  if (v5)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:&off_2A198]);
    uint64_t v8 = v7;
    if (v7 && [v7 count])
    {
      uint64_t Constraints = SecAccessControlGetConstraints(a1);
      id v10 = (void *)objc_claimAutoreleasedReturnValue(Constraints);
      if (v10)
      {
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v10));
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472LL;
        v15[2] = sub_F118;
        v15[3] = &unk_28BC0;
        id v16 = v10;
        id v18 = &v19;
        id v12 = v11;
        id v17 = v12;
        [v8 enumerateKeysAndObjectsUsingBlock:v15];
        if (!v20[3]) {
          SecAccessControlSetConstraints(a1, v12);
        }
      }
    }
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  uint64_t v13 = v20[3];
  if (a3)
  {
    *a3 = v13;
  }

  else if (v13)
  {
    CFRelease((CFTypeRef)v20[3]);
  }

  _Block_object_dispose(&v19, 8);
  objc_autoreleasePoolPop(v6);

  return v13 == 0;
}

void sub_F0F4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_F118(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v15 = a2;
  id v7 = a3;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:v15]);
  if (!*(void *)(a1 + 32))
  {
    id v12 = (uint64_t *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL);
    uint64_t v13 = @"Invalid update request.";
LABEL_9:
    sub_F2BC(v13, -1000LL, v12);
    *a4 = 1;
    goto LABEL_10;
  }

  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) == 0)
  {
    uint64_t v14 = objc_opt_class(v8);
    if (v14 == objc_opt_class(v7))
    {
      [*(id *)(a1 + 40) setObject:v7 forKeyedSubscript:v15];
      goto LABEL_10;
    }

    id v12 = (uint64_t *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL);
    uint64_t v13 = @"Invalid update value type.";
    goto LABEL_9;
  }

  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v7, v10) & 1) == 0)
  {
    id v12 = (uint64_t *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL);
    uint64_t v13 = @"Invalid update value type, expecting dictionary.";
    goto LABEL_9;
  }

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  void v16[2] = sub_F394;
  v16[3] = &unk_28B98;
  id v17 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v8));
  id v11 = v17;
  [v7 enumerateKeysAndObjectsUsingBlock:v16];
  [*(id *)(a1 + 40) setObject:v11 forKeyedSubscript:v15];

LABEL_10:
}

void sub_F2BC(void *a1, uint64_t a2, uint64_t *a3)
{
  if (a3)
  {
    NSErrorUserInfoKey v8 = NSDebugDescriptionErrorKey;
    uint64_t v9 = a1;
    id v5 = a1;
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v9,  &v8,  1LL));
    uint64_t v7 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"Error.LocalAuthentication.coreauthd_client",  a2,  v6));

    *a3 = v7;
  }

id sub_F394(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a3 forKeyedSubscript:a2];
}

BOOL sub_F3A0(void *a1, uint64_t a2, const void *a3, uint64_t a4, void *a5, uint64_t *a6)
{
  id v12 = objc_autoreleasePoolPush();
  id v13 = sub_F604();
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id v28 = 138412802;
    *(void *)&v28[4] = a1;
    *(_WORD *)&v28[12] = 2112;
    *(void *)&v28[14] = a3;
    __int16 v29 = 2112;
    uint64_t v30 = a4;
    _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "LAEvaluateAndUpdateACL(%@, %@, %@)", v28, 0x20u);
  }

  id v15 = sub_F988(a1, a6);
  id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  if (!a1) {
    goto LABEL_13;
  }
  CFTypeID v17 = CFGetTypeID(a3);
  if (v17 != CFStringGetTypeID())
  {
    id v23 = @"Invalid operation type.";
LABEL_12:
    sub_F2BC(v23, -1006LL, a6);
LABEL_13:
    BOOL v22 = 0LL;
    goto LABEL_14;
  }

  if (!a2)
  {
    id v23 = @"Invalid 'ACL' argument.";
    goto LABEL_12;
  }

  id v18 = (void *)SecAccessControlCreateFromData(kCFAllocatorDefault, a2, a6);
  if (v18)
  {
    *(void *)id v28 = 0LL;
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v16 evaluateAccessControl:v18 aksOperation:a3 options:a4 error:v28]);
    id v20 = *(id *)v28;
    uint64_t v21 = v20;
    BOOL v22 = v19 != 0LL;
    if (v19)
    {
      if (a5) {
        *a5 = SecAccessControlCopyData(v18);
      }
    }

    else if (a6)
    {
      *a6 = (uint64_t)v20;
    }
  }

  else
  {
    sub_F2BC(@"Invalid 'ACL' argument.", -1006LL, a6);
    BOOL v22 = 0LL;
  }

LABEL_14:
  id v24 = sub_F604();
  uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    if (a6) {
      uint64_t v26 = *a6;
    }
    else {
      uint64_t v26 = 0LL;
    }
    *(_DWORD *)id v28 = 67109378;
    *(_DWORD *)&v28[4] = v22;
    *(_WORD *)&v28[8] = 2112;
    *(void *)&v28[10] = v26;
    _os_log_impl(&dword_0, v25, OS_LOG_TYPE_DEFAULT, "LAEvaluateAndUpdateACL -> %d, %@", v28, 0x12u);
  }

  objc_autoreleasePoolPop(v12);
  return v22;
}

id sub_F604()
{
  if (qword_2CE80 != -1) {
    dispatch_once(&qword_2CE80, &stru_28C08);
  }
  return (id)qword_2CE88;
}

uint64_t sub_F644(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  NSErrorUserInfoKey v8 = objc_autoreleasePoolPush();
  uint64_t v13 = 0LL;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000LL;
  char v16 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_F708;
  block[3] = &unk_28BE8;
  int v12 = a2;
  block[6] = a3;
  block[7] = a4;
  void block[4] = &v13;
  block[5] = a1;
  dispatch_block_perform(DISPATCH_BLOCK_DETACHED, block);
  uint64_t v9 = *((unsigned __int8 *)v14 + 24);
  _Block_object_dispose(&v13, 8);
  objc_autoreleasePoolPop(v8);
  return v9;
}

void sub_F708(uint64_t a1)
{
  uint64_t v2 = (const void *)sub_F758(*(void **)(a1 + 40), *(_DWORD *)(a1 + 64), *(void *)(a1 + 48), *(uint64_t **)(a1 + 56));
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v2 != 0LL;
  if (v2) {
    CFRelease(v2);
  }
}

uint64_t sub_F758(void *a1, int a2, uint64_t a3, uint64_t *a4)
{
  NSErrorUserInfoKey v8 = objc_autoreleasePoolPush();
  id v9 = sub_F604();
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t v21 = 138412802;
    *(void *)&v21[4] = a1;
    __int16 v22 = 1024;
    LODWORD(v23[0]) = a2;
    WORD2(v23[0]) = 2112;
    *(void *)((char *)v23 + 6) = a3;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "LACopyResultOfPolicyEvaluation(%@, %d, %@)", v21, 0x1Cu);
  }

  id v11 = sub_F988(a1, a4);
  int v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  uint64_t v13 = v12;
  if (v12)
  {
    *(void *)uint64_t v21 = 0LL;
    uint64_t v14 = objc_claimAutoreleasedReturnValue([v12 evaluatePolicy:a2 options:a3 error:v21]);
    id v15 = *(id *)v21;
    char v16 = v15;
    if (a4 && !v14) {
      *a4 = (uint64_t)v15;
    }
  }

  else
  {
    uint64_t v14 = 0LL;
  }

  id v17 = sub_F604();
  id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    if (a4) {
      uint64_t v19 = *a4;
    }
    else {
      uint64_t v19 = 0LL;
    }
    *(_DWORD *)uint64_t v21 = 138412546;
    *(void *)&v21[4] = v14;
    __int16 v22 = 2112;
    v23[0] = v19;
    _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "LACopyResultOfPolicyEvaluation -> %@, %@", v21, 0x16u);
  }

  objc_autoreleasePoolPop(v8);
  return v14;
}

id sub_F910(void *a1, uint64_t a2, int a3, uint64_t *a4)
{
  NSErrorUserInfoKey v8 = objc_autoreleasePoolPush();
  id v9 = sub_F988(a1, a4);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  id v11 = [v10 setCredential:a2 type:a3];

  objc_autoreleasePoolPop(v8);
  return v11;
}

id sub_F988(void *a1, uint64_t *a2)
{
  id v3 = a1;
  if (v3 && (id v4 = sub_FBC0(), (objc_opt_isKindOfClass(v3, v4) & 1) != 0))
  {
    id v5 = v3;
  }

  else
  {
    sub_F2BC(@"Invalid 'context' argument.", -1006LL, a2);
    id v5 = 0LL;
  }

  return v5;
}

id sub_F9F0(void *a1, int a2, uint64_t *a3)
{
  uint64_t v6 = objc_autoreleasePoolPush();
  id v7 = sub_F988(a1, a3);
  NSErrorUserInfoKey v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = [v8 isCredentialSet:a2];

  objc_autoreleasePoolPop(v6);
  return v9;
}

id sub_FA58(void *a1, uint64_t *a2)
{
  id v4 = objc_autoreleasePoolPush();
  id v5 = a1;
  if (v5 && (uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSData), (objc_opt_isKindOfClass(v5, v6) & 1) == 0))
  {
    id v10 = sub_F604();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1001C(v11);
    }

    sub_F2BC(@"Invalid acmContext.", -1006LL, a2);
    id v8 = 0LL;
  }

  else
  {
    id v7 = [objc_alloc((Class)sub_FBC0()) initWithExternalizedContext:v5];
    id v8 = v7;
    if (a2 && !v7)
    {
      NSErrorUserInfoKey v13 = NSDebugDescriptionErrorKey;
      uint64_t v14 = @"Failed to create LAContext";
      id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v14,  &v13,  1LL));
      *a2 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"Error.LocalAuthentication.coreauthd_client",  -1000LL,  v9));
    }
  }

  objc_autoreleasePoolPop(v4);
  return v8;
}

id sub_FBC0()
{
  uint64_t v4 = 0LL;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000LL;
  uint64_t v0 = (void *)qword_2CE90;
  uint64_t v7 = qword_2CE90;
  if (!qword_2CE90)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_FF28;
    v3[3] = &unk_28AC0;
    v3[4] = &v4;
    sub_FF28((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }

  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_FC5C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_FC74(void *a1, uint64_t *a2)
{
  uint64_t v4 = objc_autoreleasePoolPush();
  id v5 = sub_F988(a1, a2);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = v6;
  if (!v6) {
    goto LABEL_5;
  }
  uint64_t v8 = objc_claimAutoreleasedReturnValue([v6 externalizedContext]);
  uint64_t v9 = v8;
  if (a2 && !v8)
  {
    NSErrorUserInfoKey v12 = NSDebugDescriptionErrorKey;
    NSErrorUserInfoKey v13 = @"Failed to get externalized context from LAContext";
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v13,  &v12,  1LL));
    *a2 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"Error.LocalAuthentication.coreauthd_client",  -1000LL,  v10));

LABEL_5:
    uint64_t v9 = 0LL;
  }

  objc_autoreleasePoolPop(v4);
  return v9;
}

BOOL sub_FD88(void *a1, uint64_t a2, const void *a3, uint64_t a4, uint64_t *a5)
{
  id v10 = objc_autoreleasePoolPush();
  BOOL v11 = sub_F3A0(a1, a2, a3, a4, 0LL, a5);
  objc_autoreleasePoolPop(v10);
  return v11;
}

id sub_FDF8(int a1, uint64_t a2, void *a3)
{
  int v10 = a1;
  id v5 = objc_autoreleasePoolPush();
  id v6 = [objc_alloc((Class)sub_FBC0()) initWithExternalizedContext:a2 userSession:&v10];
  id v7 = v6;
  if (a3 && !v6)
  {
    NSErrorUserInfoKey v11 = NSDebugDescriptionErrorKey;
    NSErrorUserInfoKey v12 = @"Failed to create LAContext";
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v12,  &v11,  1LL));
    *a3 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"Error.LocalAuthentication.coreauthd_client",  -1000LL,  v8));
  }

  objc_autoreleasePoolPop(v5);
  return v7;
}

void sub_FEF8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.LocalAuthentication", "coreauthd_client");
  uint64_t v2 = (void *)qword_2CE88;
  qword_2CE88 = (uint64_t)v1;
}

Class sub_FF28(uint64_t a1)
{
  uint64_t v4 = 0LL;
  if (!qword_2CE98)
  {
    __int128 v5 = off_28C28;
    uint64_t v6 = 0LL;
    qword_2CE98 = _sl_dlopen(&v5, &v4);
    uint64_t v2 = v4;
    if (!qword_2CE98)
    {
      abort_report_np("%s", v4);
      goto LABEL_7;
    }

    if (v4) {
      goto LABEL_8;
    }
  }

  while (1)
  {
    Class result = objc_getClass("LAContext");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (char *)sub_1005C();
LABEL_8:
    free(v2);
  }

  qword_2CE90 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  return result;
}

void sub_1001C(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Invalid acmContext", v1, 2u);
}

uint64_t sub_1005C()
{
  int v0 = abort_report_np("Unable to find class %s", "LAContext");
  return acm_explicit_bzero(v0, v1);
}

uint64_t acm_explicit_bzero(void *a1, rsize_t __n)
{
  return memset_s(a1, __n, 0, __n);
}

uint64_t acm_get_mem()
{
  return qword_2CEA0;
}

void *acm_mem_alloc_data(size_t __size)
{
  Class result = calloc(1uLL, __size);
  if (result) {
    qword_2CEA8 += __size;
  }
  return result;
}

void acm_mem_free_data(void *a1, rsize_t __n)
{
  if (a1)
  {
    memset_s(a1, __n, 0, __n);
    free(a1);
    uint64_t v4 = qword_2CEA8 - __n;
    if (qword_2CEA8 < __n) {
      uint64_t v4 = 0LL;
    }
    qword_2CEA8 = v4;
  }

void *acm_mem_alloc(size_t __size)
{
  Class result = calloc(1uLL, __size);
  if (result) {
    qword_2CEB0 += __size;
  }
  return result;
}

void acm_mem_free(void *a1, rsize_t __n)
{
  if (a1)
  {
    memset_s(a1, __n, 0, __n);
    free(a1);
    uint64_t v4 = qword_2CEB0 - __n;
    if (qword_2CEB0 < __n) {
      uint64_t v4 = 0LL;
    }
    qword_2CEB0 = v4;
  }

const char *acm_mem_alloc_info( const char *result, const void *a2, uint64_t a3, const char *a4, int a5, const char *a6)
{
  if (a2) {
    qword_2CEA0 += a3;
  }
  if (gACMLoggingLevel <= 0x1Eu)
  {
    uint64_t v6 = "NULL";
    if (result) {
      id v7 = result;
    }
    else {
      id v7 = "NULL";
    }
    if (a4) {
      uint64_t v8 = a4;
    }
    else {
      uint64_t v8 = "NULL";
    }
    if (a6) {
      uint64_t v6 = a6;
    }
    return (const char *)printf( "%s: %s: mem: type=%s ptr=%p size=%u (total=%u raw=%u data=%u types=%u) %s:%d (%s).\n",  "ACM",  "acm_mem_alloc_info",  v7,  a2,  a3,  qword_2CEA0,  0,  qword_2CEA8,  qword_2CEB0,  v8,  a5,  v6);
  }

  return result;
}

const char *acm_mem_free_info( const char *result, const void *a2, unint64_t a3, const char *a4, int a5, const char *a6)
{
  if (a2)
  {
    uint64_t v6 = qword_2CEA0 - a3;
    if (qword_2CEA0 < a3) {
      uint64_t v6 = 0LL;
    }
    qword_2CEA0 = v6;
  }

  if (gACMLoggingLevel <= 0x1Eu)
  {
    id v7 = "NULL";
    if (result) {
      uint64_t v8 = result;
    }
    else {
      uint64_t v8 = "NULL";
    }
    if (a4) {
      uint64_t v9 = a4;
    }
    else {
      uint64_t v9 = "NULL";
    }
    if (a6) {
      id v7 = a6;
    }
    return (const char *)printf( "%s: %s: mem: type=%s ptr=%p size=%u (total=%u raw=%u data=%u types=%u) %s:%d (%s).\n",  "ACM",  "acm_mem_free_info",  v8,  a2,  a3,  qword_2CEA0,  0,  qword_2CEA8,  qword_2CEB0,  v9,  a5,  v7);
  }

  return result;
}

uint64_t GetSerializedVerifyPolicySize( uint64_t a1, char *__s1, uint64_t a3, uint64_t a4, _DWORD *a5, unsigned int a6, void *a7)
{
  unsigned int v14 = 0;
  uint64_t result = 4294967293LL;
  if (a1 && __s1 && a7)
  {
    size_t v12 = strnlen(__s1, 0x81uLL);
    if (v12 > 0x80)
    {
      return 4294967293LL;
    }

    else
    {
      size_t v13 = v12;
      uint64_t result = sub_1038C(a5, a6, &v14);
      if (!(_DWORD)result) {
        *a7 = v13 + v14 + 26;
      }
    }
  }

  return result;
}

uint64_t sub_1038C(_DWORD *a1, unsigned int a2, _DWORD *a3)
{
  if (a3)
  {
    *a3 = 0;
    int v6 = 0;
    if (a2)
    {
      uint64_t v7 = a2;
      while (1)
      {
        uint64_t v8 = sub_131D8(a1);
        if ((_DWORD)v8) {
          break;
        }
        int v9 = v6 + 8;
        int v10 = a1[4];
        v6 += v10 + 8;
        if (__CFADD__(v10, v9)) {
          goto LABEL_10;
        }
        a1 += 6;
        if (!--v7) {
          goto LABEL_9;
        }
      }

      uint64_t v11 = v8;
      unsigned int v12 = 70;
    }

    else
    {
LABEL_9:
      uint64_t v11 = 0LL;
      *a3 = v6;
      unsigned int v12 = 10;
    }
  }

  else
  {
LABEL_10:
    unsigned int v12 = 70;
    uint64_t v11 = 4294967293LL;
  }

  return v11;
}

uint64_t SerializeVerifyPolicy( _OWORD *a1, char *__s1, char a3, uint64_t a4, _DWORD *a5, unsigned int a6, _OWORD *a7, size_t *a8)
{
  unint64_t v21 = 0LL;
  uint64_t result = 4294967293LL;
  if (a1)
  {
    if (__s1)
    {
      if (a8)
      {
        if (a7)
        {
          if (a6 <= 0xA && (a5 != 0LL) == (a6 != 0))
          {
            int v15 = a4;
            uint64_t result = GetSerializedVerifyPolicySize((uint64_t)a1, __s1, 0LL, a4, a5, a6, &v21);
            if (!(_DWORD)result)
            {
              if (*a8 < v21) {
                return 4294967293LL;
              }
              *a7 = *a1;
              size_t v17 = strnlen(__s1, 0x81uLL);
              if (v17 > 0x80)
              {
                return 4294967293LL;
              }

              else
              {
                size_t v18 = v17;
                memcpy(a7 + 1, __s1, v17 + 1);
                uint64_t v19 = (char *)a7 + v18;
                v19[17] = a3;
                *(_DWORD *)(v19 + 1_Block_object_dispose(va, 8) = v15;
                size_t v20 = v18 + 22;
                uint64_t result = sub_105B4((uint64_t)a5, a6, (uint64_t)a7, (uint64_t *)&v20);
                if (!(_DWORD)result) {
                  *a8 = v20;
                }
              }
            }
          }
        }
      }
    }
  }

  return result;
}

uint64_t sub_105B4(uint64_t a1, int a2, uint64_t a3, uint64_t *a4)
{
  LODWORD(v6) = a2;
  unsigned int v8 = 70;
  uint64_t v9 = 4294967293LL;
  if (a3 && a4)
  {
    uint64_t v10 = *a4;
    *(_DWORD *)(a3 + v10) = v6;
    uint64_t v11 = v10 + 4;
    if ((_DWORD)v6)
    {
      uint64_t v6 = v6;
      while (1)
      {
        *(_OWORD *)__src = *(_OWORD *)a1;
        size_t __n = *(void *)(a1 + 16);
        uint64_t v12 = sub_131D8(__src);
        if ((_DWORD)v12) {
          break;
        }
        size_t v13 = (_DWORD *)(a3 + v11);
        size_t v14 = __n;
        _DWORD *v13 = __src[0];
        v13[1] = v14;
        v11 += 8LL;
        if ((_DWORD)v14)
        {
          memcpy((void *)(a3 + v11), __src[1], v14);
          v11 += v14;
        }

        a1 += 24LL;
        if (!--v6) {
          goto LABEL_11;
        }
      }

      uint64_t v9 = v12;
      unsigned int v8 = 70;
    }

    else
    {
LABEL_11:
      uint64_t v9 = 0LL;
      *a4 = v11;
      unsigned int v8 = 10;
    }
  }

  return v9;
}

uint64_t DeserializeVerifyPolicy( uint64_t a1, unint64_t a2, _OWORD *a3, void *a4, BOOL *a5, _DWORD *a6, void *a7, _DWORD *a8)
{
  id v28 = 0LL;
  unsigned int v27 = 0;
  uint64_t v8 = 4294967293LL;
  unint64_t v9 = a2 - 16;
  if (a2 >= 0x10 && a1 && a3 && a4 && a5 && a6 && a7 && a8)
  {
    *a3 = *(_OWORD *)a1;
    unint64_t v17 = strnlen((const char *)(a1 + 16), a2 - 16);
    if (v17 > 0x80 || v9 <= v17) {
      return 4294967293LL;
    }
    uint64_t v26 = a4;
    unint64_t v18 = v17 + 1;
    uint64_t v19 = acm_mem_alloc_data(v17 + 1);
    acm_mem_alloc_info( "<data>",  v19,  v17 + 1,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c",  349,  "DeserializeVerifyPolicy");
    if (!v19) {
      return 4294967292LL;
    }
    memcpy(v19, (const void *)(a1 + 16), v17 + 1);
    unint64_t v29 = v17 + 17;
    if (v17 + 17 == a2 || (size_t v20 = a5, v21 = *(_BYTE *)(a1 + v17 + 17) != 0, v29 = v17 + 18, a2 - (v17 + 18) < 4))
    {
      uint64_t v8 = 4294967293LL;
    }

    else
    {
      unint64_t v25 = v17 + 1;
      __int16 v22 = a8;
      int v23 = *(_DWORD *)(a1 + v17 + 18);
      unint64_t v29 = v17 + 22;
      uint64_t v8 = sub_108EC(a1, a2, &v29, &v28, &v27);
      if (!(_DWORD)v8)
      {
        *uint64_t v26 = v19;
        *size_t v20 = v21;
        *a6 = v23;
        *a7 = v28;
        *__int16 v22 = v27;
        return v8;
      }

      unint64_t v18 = v25;
    }

    acm_mem_free_info( "<data>",  v19,  v18,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c",  378,  "DeserializeVerifyPolicy");
    acm_mem_free_data(v19, v18);
    if (v28) {
      Util_SafeDeallocParameters(v28, v27);
    }
  }

  return v8;
}

uint64_t sub_108EC(uint64_t a1, unint64_t a2, unint64_t *a3, void *a4, _DWORD *a5)
{
  uint64_t v10 = &ContextPluginACM__metaData;
  unsigned int v11 = 70;
  uint64_t v12 = 4294967293LL;
  if (!a1 || !a3 || !a4 || !a5) {
    goto LABEL_25;
  }
  unint64_t v13 = *a3;
  if (a2 <= *a3)
  {
    LODWORD(v14) = 0;
LABEL_23:
    char v16 = 0LL;
LABEL_24:
    uint64_t v12 = 0LL;
    *a4 = v16;
    *a5 = v14;
    unsigned int v11 = 10;
    *a3 = v13;
    goto LABEL_25;
  }

  if (a2 - *a3 < 4 || (uint64_t v14 = *(unsigned int *)(a1 + v13), v14 > 0xA))
  {
    unsigned int v11 = 70;
    uint64_t v12 = 4294967293LL;
    goto LABEL_25;
  }

  v13 += 4LL;
  if (!(_DWORD)v14) {
    goto LABEL_23;
  }
  int v27 = v14;
  uint64_t v15 = 24 * v14;
  char v16 = (char *)acm_mem_alloc(24 * v14);
  acm_mem_alloc_info( "array of ACMParameter",  v16,  v15,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c",  194,  "deserializeParameters");
  if (!v16)
  {
    unsigned int v11 = 70;
    uint64_t v12 = 4294967292LL;
    goto LABEL_25;
  }

  id v24 = a4;
  unint64_t v25 = a5;
  uint64_t v26 = a3;
  uint64_t v17 = 0LL;
  while (1)
  {
    unint64_t v18 = &v16[v17];
    *(void *)&v16[v17 + 8] = 0LL;
    if (a2 - v13 < 8
      || (*(_DWORD *)unint64_t v18 = *(_DWORD *)(a1 + v13), a2 - (v13 + 4) < 4)
      || (uint64_t v19 = &v16[v17],
          size_t v20 = *(unsigned int *)(a1 + v13 + 4),
          *(_DWORD *)&v16[v17 + 16] = v20,
          v13 += 8LL,
          a2 - v13 < v20))
    {
      unsigned int v11 = 70;
      uint64_t v12 = 4294967293LL;
      goto LABEL_31;
    }

    uint64_t v21 = sub_131D8(&v16[v17]);
    if ((_DWORD)v21)
    {
      uint64_t v12 = v21;
      unsigned int v11 = 70;
      goto LABEL_31;
    }

    if ((_DWORD)v20) {
      break;
    }
LABEL_20:
    v17 += 24LL;
    if (v15 == v17)
    {
      uint64_t v10 = &ContextPluginACM__metaData;
      a5 = v25;
      a3 = v26;
      a4 = v24;
      LODWORD(v14) = v27;
      goto LABEL_24;
    }
  }

  __int16 v22 = acm_mem_alloc_data(v20);
  acm_mem_alloc_info( "<data>",  v22,  v20,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c",  212,  "deserializeParameters");
  *((void *)v18 + 1) = v22;
  if (v22)
  {
    memcpy(v22, (const void *)(a1 + v13), *((unsigned int *)v19 + 4));
    v13 += *((unsigned int *)v19 + 4);
    goto LABEL_20;
  }

  unsigned int v11 = 70;
  uint64_t v12 = 4294967292LL;
LABEL_31:
  uint64_t v10 = &ContextPluginACM__metaData;
LABEL_25:
  if (v11 >= LOBYTE(v10[50].base_meths)) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "deserializeParameters", (int)v12);
  }
  return v12;
}

uint64_t GetSerializedVerifyAclConstraintSize( int a1, uint64_t a2, uint64_t a3, unsigned int a4, uint64_t a5, unsigned int a6, uint64_t a7, uint64_t a8, _DWORD *a9, unsigned int a10, void *a11)
{
  unsigned int v18 = 0;
  uint64_t result = 4294967293LL;
  if (a3)
  {
    if (a11)
    {
      if (a10 <= 0xA && (a9 != 0LL) == (a10 != 0))
      {
        uint64_t result = sub_1038C(a9, a10, &v18);
        if (!(_DWORD)result)
        {
          uint64_t v15 = 29LL;
          if (a1 == 32) {
            uint64_t v15 = 33LL;
          }
          uint64_t v16 = v15 + a4;
          if (a1 == 32) {
            uint64_t v17 = a6;
          }
          else {
            uint64_t v17 = 0LL;
          }
          *a11 = v16 + v17 + v18;
        }
      }
    }
  }

  return result;
}

uint64_t SerializeVerifyAclConstraint( int a1, _OWORD *a2, const void *a3, unsigned int a4, const void *a5, unsigned int a6, char a7, int a8, _DWORD *a9, unsigned int a10, uint64_t a11, void *a12)
{
  if (!a3) {
    return 4294967293LL;
  }
  uint64_t result = 4294967293LL;
  if (a12) {
    BOOL v14 = a11 == 0;
  }
  else {
    BOOL v14 = 1;
  }
  if (!v14 && a10 <= 0xA && (a9 != 0LL) == (a10 != 0))
  {
    unsigned int v31 = 0;
    uint64_t result = sub_1038C(a9, a10, &v31);
    if (!(_DWORD)result)
    {
      uint64_t v21 = 29LL;
      if (a1 == 32) {
        uint64_t v21 = 33LL;
      }
      uint64_t v22 = v21 + a4;
      if (a1 == 32) {
        uint64_t v23 = a6;
      }
      else {
        uint64_t v23 = 0LL;
      }
      if (*a12 < v22 + v23 + (unint64_t)v31)
      {
        return 4294967293LL;
      }

      else
      {
        int v28 = a8;
        if (a2)
        {
          *(_OWORD *)a11 = *a2;
        }

        else
        {
          *(void *)a11 = 0LL;
          *(void *)(a11 + _Block_object_dispose(va, 8) = 0LL;
        }

        *(_DWORD *)(a11 + 16) = a4;
        memcpy((void *)(a11 + 20), a3, a4);
        uint64_t v24 = a4 + 20LL;
        if (a1 == 32)
        {
          *(_DWORD *)(a11 + v24) = a6;
          uint64_t v25 = a4 + 24LL;
          memcpy((void *)(a11 + v25), a5, a6);
          uint64_t v24 = v25 + a6;
        }

        uint64_t v26 = a11 + v24;
        *(_BYTE *)uint64_t v26 = a7;
        *(_DWORD *)(v26 + 1) = v28;
        uint64_t v30 = v24 + 5;
        uint64_t result = sub_105B4((uint64_t)a9, a10, a11, &v30);
        if (!(_DWORD)result) {
          *a12 = v30;
        }
      }
    }
  }

  return result;
}

uint64_t DeserializeVerifyAclConstraint( int a1, uint64_t a2, unsigned int a3, _OWORD *a4, void *a5, _DWORD *a6, size_t *a7, _DWORD *a8, BOOL *a9, _DWORD *a10, void *a11, _DWORD *a12)
{
  id v33 = 0LL;
  unint64_t v34 = 0LL;
  unsigned int v32 = 0;
  uint64_t v12 = 4294967293LL;
  if (a2 && a4 && a5 && a6 && a9 && a10 && a11 && a12 && a3 >= 0x10)
  {
    unint64_t v16 = a3;
    *a4 = *(_OWORD *)a2;
    unint64_t v34 = 16LL;
    if ((a3 & 0xFFFFFFFC) == 0x10LL)
    {
      uint64_t v12 = 4294967293LL;
    }

    else
    {
      unint64_t v20 = *(unsigned int *)(a2 + 16);
      unint64_t v34 = 20LL;
      uint64_t v21 = acm_mem_alloc_data(v20);
      acm_mem_alloc_info( "<data>",  v21,  v20,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c",  532,  "DeserializeVerifyAclConstraint");
      if (v21)
      {
        if (v16 - 20 < v20) {
          goto LABEL_24;
        }
        memcpy(v21, (const void *)(a2 + 20), v20);
        unint64_t v22 = v20 + 20;
        unint64_t v34 = v20 + 20;
        unsigned int v31 = a5;
        if (a1 != 32)
        {
          uint64_t v25 = 0LL;
          LODWORD(v23) = 0;
          goto LABEL_19;
        }

        if (v16 - v22 < 4)
        {
LABEL_24:
          uint64_t v25 = 0LL;
          LODWORD(v23) = 0;
        }

        else
        {
          size_t v23 = *(unsigned int *)(a2 + v22);
          unint64_t v24 = v20 + 24;
          unint64_t v34 = v20 + 24;
          uint64_t v25 = acm_mem_alloc_data(v23);
          acm_mem_alloc_info( "<data>",  v25,  v23,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c",  544,  "DeserializeVerifyAclConstraint");
          if (!v25)
          {
            uint64_t v12 = 4294967292LL;
LABEL_26:
            acm_mem_free_info( "<data>",  v21,  v20,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c",  580,  "DeserializeVerifyAclConstraint");
            acm_mem_free_data(v21, v20);
            if (v25)
            {
              acm_mem_free_info( "<data>",  v25,  v23,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c",  583,  "DeserializeVerifyAclConstraint");
              acm_mem_free_data(v25, v23);
            }

            goto LABEL_30;
          }

          if (v16 - v24 >= v23)
          {
            memcpy(v25, (const void *)(a2 + v24), v23);
            unint64_t v22 = v24 + v23;
            unint64_t v34 = v24 + v23;
LABEL_19:
            if (v22 != v16)
            {
              BOOL v26 = *(_BYTE *)(a2 + v22) != 0;
              unint64_t v34 = v22 + 1;
              if (v16 - (v22 + 1) >= 4)
              {
                unint64_t v30 = v20;
                int v27 = v23;
                size_t v23 = (size_t)v25;
                int v28 = *(_DWORD *)(a2 + v22 + 1);
                unint64_t v34 = v22 + 5;
                uint64_t v12 = sub_108EC(a2, v16, &v34, &v33, &v32);
                if (!(_DWORD)v12)
                {
                  void *v31 = v21;
                  *a7 = v23;
                  *a8 = v27;
                  *a6 = v30;
                  *a9 = v26;
                  *a10 = v28;
                  *a11 = v33;
                  *a12 = v32;
                  return v12;
                }

                uint64_t v25 = (void *)v23;
                LODWORD(v23) = v27;
                unint64_t v20 = v30;
                goto LABEL_26;
              }
            }
          }
        }

        uint64_t v12 = 4294967293LL;
        goto LABEL_26;
      }

      uint64_t v12 = 4294967292LL;
    }
  }

LABEL_30:
  if (v33) {
    Util_SafeDeallocParameters(v33, v32);
  }
  return v12;
}

uint64_t GetSerializedProcessAclSize( uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4, unsigned int a5, uint64_t a6, _DWORD *a7, unsigned int a8, void *a9)
{
  unsigned int v12 = 0;
  uint64_t result = 4294967293LL;
  if (a2 && a3 && a9 && a8 <= 0xA && (a7 != 0LL) == (a8 != 0))
  {
    uint64_t result = sub_1038C(a7, a8, &v12);
    if (!(_DWORD)result) {
      *a9 = a3 + (unint64_t)a5 + v12 + 36;
    }
  }

  return result;
}

uint64_t SerializeProcessAcl( _OWORD *a1, const void *a2, unsigned int a3, const void *a4, unsigned int a5, uint64_t a6, _DWORD *a7, unsigned int a8, uint64_t a9, unint64_t *a10)
{
  unint64_t v23 = 0LL;
  uint64_t result = 4294967293LL;
  if (a2 && a3)
  {
    BOOL v15 = !a10 || a9 == 0;
    if (!v15 && a8 <= 0xA && (a7 != 0LL) == (a8 != 0))
    {
      int v17 = a6;
      uint64_t result = GetSerializedProcessAclSize(4294967293LL, (uint64_t)a2, a3, (uint64_t)a4, a5, a6, a7, a8, &v23);
      if (!(_DWORD)result)
      {
        if (*a10 < v23)
        {
          return 4294967293LL;
        }

        else
        {
          if (a1)
          {
            *(_OWORD *)a9 = *a1;
          }

          else
          {
            *(void *)a9 = 0LL;
            *(void *)(a9 + _Block_object_dispose(va, 8) = 0LL;
          }

          *(_DWORD *)(a9 + 16) = a3;
          memcpy((void *)(a9 + 20), a2, a3);
          *(_DWORD *)(a9 + a3 + 20) = a5;
          uint64_t v21 = a3 + 24LL;
          if (a5)
          {
            memcpy((void *)(a9 + v21), a4, a5);
            v21 += a5;
          }

          *(_DWORD *)(a9 + v21) = v17;
          unint64_t v22 = v21 + 4;
          uint64_t result = sub_105B4((uint64_t)a7, a8, a9, (uint64_t *)&v22);
          if (!(_DWORD)result) {
            *a10 = v22;
          }
        }
      }
    }
  }

  return result;
}

uint64_t DeserializeProcessAcl( uint64_t a1, unsigned int a2, _OWORD *a3, void *a4, _DWORD *a5, void *a6, unsigned int *a7, _DWORD *a8, void *a9, _DWORD *a10)
{
  id v39 = 0LL;
  unint64_t v40 = 0LL;
  unsigned int v38 = 0;
  uint64_t v10 = 4294967293LL;
  if (a1)
  {
    if (a3)
    {
      unsigned int v11 = a4;
      if (a4)
      {
        unsigned int v12 = a5;
        if (a5)
        {
          unint64_t v13 = a6;
          if (a6)
          {
            BOOL v14 = a7;
            if (a7)
            {
              BOOL v15 = a8;
              if (a8)
              {
                if (a9 && a10 && a2 >= 0x10)
                {
                  unint64_t v17 = a2;
                  *a3 = *(_OWORD *)a1;
                  unint64_t v40 = 16LL;
                  if ((a2 & 0xFFFFFFFC) == 0x10LL)
                  {
                    uint64_t v10 = 4294967293LL;
                  }

                  else
                  {
                    unint64_t v18 = *(unsigned int *)(a1 + 16);
                    unint64_t v40 = 20LL;
                    uint64_t v19 = acm_mem_alloc_data(v18);
                    acm_mem_alloc_info( "<data>",  v19,  v18,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c",  722,  "DeserializeProcessAcl");
                    if (v19)
                    {
                      if (v17 - 20 < v18
                        || (memcpy(v19, (const void *)(a1 + 20), v18), unint64_t v40 = v18 + 20, v17 - (v18 + 20) < 4))
                      {
                        unsigned int v32 = 0LL;
                        unsigned int v37 = 0;
                        uint64_t v10 = 4294967293LL;
                      }

                      else
                      {
                        size_t v20 = *(unsigned int *)(a1 + v18 + 20);
                        unint64_t v21 = v18 + 24;
                        unint64_t v40 = v18 + 24;
                        unsigned int v37 = v20;
                        if (!(_DWORD)v20)
                        {
                          id v36 = 0LL;
                          goto LABEL_20;
                        }

                        id v33 = v12;
                        unint64_t v34 = v11;
                        unint64_t v22 = v13;
                        unint64_t v23 = v14;
                        unint64_t v24 = v15;
                        size_t v25 = v20;
                        BOOL v26 = acm_mem_alloc_data(v20);
                        acm_mem_alloc_info( "<data>",  v26,  v25,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c",  734,  "DeserializeProcessAcl");
                        if (v26)
                        {
                          int v27 = v26;
                          unsigned int v11 = v34;
                          if (v17 - v21 >= v25)
                          {
                            id v36 = v27;
                            memcpy(v27, (const void *)(a1 + v21), v25);
                            v21 += v25;
                            unint64_t v40 = v21;
                            BOOL v15 = v24;
                            BOOL v14 = v23;
                            unint64_t v13 = v22;
                            unsigned int v12 = v33;
LABEL_20:
                            if (v17 - v21 < 4)
                            {
                              uint64_t v10 = 4294967293LL;
                            }

                            else
                            {
                              unint64_t v35 = v18;
                              int v28 = v19;
                              unint64_t v29 = v15;
                              int v30 = *(_DWORD *)(a1 + v21);
                              unint64_t v40 = v21 + 4;
                              uint64_t v10 = sub_108EC(a1, v17, &v40, &v39, &v38);
                              if (!(_DWORD)v10)
                              {
                                void *v11 = v28;
                                _DWORD *v12 = v35;
                                void *v13 = v36;
                                unsigned int *v14 = v37;
                                _DWORD *v29 = v30;
                                *a9 = v39;
                                *a10 = v38;
                                return v10;
                              }

                              uint64_t v19 = v28;
                              unint64_t v18 = v35;
                            }

                            unsigned int v32 = v36;
                            goto LABEL_32;
                          }

                          uint64_t v10 = 4294967293LL;
                          unsigned int v32 = v27;
                        }

                        else
                        {
                          unsigned int v32 = 0LL;
                          uint64_t v10 = 4294967292LL;
                        }
                      }

LABEL_32:
                      acm_mem_free_info( "<data>",  v19,  v18,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c",  763,  "DeserializeProcessAcl");
                      acm_mem_free_data(v19, v18);
                      if (v32)
                      {
                        acm_mem_free_info( "<data>",  v32,  v37,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c",  766,  "DeserializeProcessAcl");
                        acm_mem_free_data(v32, v37);
                      }

                      goto LABEL_34;
                    }

                    uint64_t v10 = 4294967292LL;
                  }
                }
              }
            }
          }
        }
      }
    }
  }

LABEL_34:
  if (v39) {
    Util_SafeDeallocParameters(v39, v38);
  }
  return v10;
}

uint64_t GetSerializedRequirementSize(_DWORD *a1, uint64_t *a2)
{
  uint64_t v12 = 0LL;
  uint64_t result = 4294967293LL;
  if (!a1) {
    return result;
  }
  if (!a2) {
    return result;
  }
  int v5 = *a1;
  if (*a1 > 0x1Cu) {
    return result;
  }
  if (((1 << v5) & 0x1FFCFF4E) != 0)
  {
    uint64_t result = 0LL;
    *a2 = a1[3] + 16LL;
    return result;
  }

  if (((1 << v5) & 0x30) == 0)
  {
    if (v5 != 7) {
      return result;
    }
    *a2 = 24LL;
    uint64_t v9 = a1[5];
    if ((_DWORD)v9)
    {
      uint64_t v10 = a1 + 6;
      uint64_t v11 = 24LL;
      do
      {
        uint64_t result = GetSerializedRequirementSize(*v10, &v12);
        if ((_DWORD)result) {
          break;
        }
        v11 += v12;
        *a2 = v11;
        ++v10;
        --v9;
      }

      while (v9);
      return result;
    }

    return 0LL;
  }

  *a2 = 20LL;
  uint64_t v6 = a1[4];
  if (!(_DWORD)v6) {
    return 0LL;
  }
  uint64_t v7 = a1 + 5;
  uint64_t v8 = 20LL;
  while (1)
  {
    uint64_t result = GetSerializedRequirementSize(*v7, &v12);
    if ((_DWORD)result) {
      break;
    }
    v8 += v12;
    *a2 = v8;
    ++v7;
    if (!--v6) {
      return 0LL;
    }
  }

  return result;
}

uint64_t SerializeRequirement(_DWORD *a1, _OWORD *a2, uint64_t *a3)
{
  unint64_t v12 = 0LL;
  uint64_t result = 4294967293LL;
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        uint64_t result = GetSerializedRequirementSize(a1, (uint64_t *)&v12);
        if (!(_DWORD)result)
        {
          if (v12 > *a3) {
            return 4294967293LL;
          }
          *a2 = *(_OWORD *)a1;
          int v7 = *a1;
          uint64_t result = 4294967293LL;
          if (*a1 <= 0x1Cu)
          {
            if (((1 << v7) & 0x1FFCFF4E) != 0)
            {
              memcpy(a2 + 1, a1 + 4, a1[3]);
              uint64_t v8 = a1[3] + 16LL;
LABEL_9:
              uint64_t result = 0LL;
              *a3 = v8;
              return result;
            }

            if (((1 << v7) & 0x30) != 0)
            {
              *((_DWORD *)a2 + 4) = a1[4];
              if (!a1[4])
              {
                uint64_t v8 = 20LL;
                goto LABEL_9;
              }

              uint64_t v9 = 0LL;
              uint64_t v8 = 20LL;
              while (1)
              {
                uint64_t v11 = *a3 - v8;
                uint64_t result = SerializeRequirement(*(void *)&a1[2 * v9 + 5], (char *)a2 + v8, &v11);
                if ((_DWORD)result) {
                  break;
                }
                v8 += v11;
              }
            }

            else if (v7 == 7)
            {
              *((void *)a2 + 2) = *((void *)a1 + 2);
              if (!a1[5])
              {
                uint64_t v8 = 24LL;
                goto LABEL_9;
              }

              uint64_t v10 = 0LL;
              uint64_t v8 = 24LL;
              while (1)
              {
                uint64_t v11 = *a3 - v8;
                uint64_t result = SerializeRequirement(*(void *)&a1[2 * v10 + 6], (char *)a2 + v8, &v11);
                if ((_DWORD)result) {
                  break;
                }
                v8 += v11;
              }
            }
          }
        }
      }
    }
  }

  return result;
}

uint64_t DeserializeRequirement(unsigned int *a1, unint64_t a2, void **a3, size_t *a4)
{
  __dst = 0LL;
  uint64_t v4 = 4294967293LL;
  if (a1)
  {
    if (a2 >= 0x10)
    {
      if (a3)
      {
        if (a4)
        {
          unsigned int v9 = *a1;
          if (v9 <= 0x1C)
          {
            if (((1 << v9) & 0x1FFCFF4E) != 0)
            {
              size_t v10 = a1[3] + 16LL;
              if (v10 > a2) {
                goto LABEL_36;
              }
              uint64_t v11 = Util_AllocRequirement(v9, 0LL, &__dst);
              if (!(_DWORD)v11)
              {
                if (__dst)
                {
                  memcpy(__dst, a1, v10);
LABEL_11:
                  uint64_t v4 = 0LL;
                  *a4 = v10;
                  *a3 = __dst;
                  return v4;
                }

                return 4294967292LL;
              }

              goto LABEL_35;
            }

            if (((1 << v9) & 0x30) != 0)
            {
              uint64_t v13 = a1[4];
              if (8 * v13 + 20 > a2) {
                goto LABEL_36;
              }
              uint64_t v11 = Util_AllocRequirement(v9, v13, &__dst);
              if ((_DWORD)v11) {
                goto LABEL_35;
              }
              BOOL v14 = __dst;
              if (!__dst) {
                return 4294967292LL;
              }
              if (*((_DWORD *)__dst + 3) == 84)
              {
                __int128 v15 = *(_OWORD *)a1;
                *((_DWORD *)__dst + 4) = a1[4];
                _OWORD *v14 = v15;
                *((_DWORD *)__dst + 3) = 84;
                if (!a1[4])
                {
                  size_t v10 = 20LL;
                  goto LABEL_11;
                }

                uint64_t v16 = 0LL;
                size_t v10 = 20LL;
                while (1)
                {
                  uint64_t v21 = 0LL;
                  uint64_t v22 = 0LL;
                  uint64_t v11 = DeserializeRequirement((char *)a1 + v10, a2 - v10, &v22, &v21);
                  if ((_DWORD)v11) {
                    goto LABEL_35;
                  }
                  *(void *)((char *)__dst + 8 * v16 + 20) = v22;
                  v10 += v21;
                }
              }

              goto LABEL_39;
            }

            if (v9 == 7)
            {
              uint64_t v17 = a1[5];
              if (8 * v17 + 24 <= a2)
              {
                uint64_t v11 = Util_AllocRequirement(7, v17, &__dst);
                if (!(_DWORD)v11)
                {
                  unint64_t v18 = __dst;
                  if (!__dst) {
                    return 4294967292LL;
                  }
                  if (*((_DWORD *)__dst + 3) != 88)
                  {
LABEL_39:
                    uint64_t v4 = 4294967291LL;
                    goto LABEL_36;
                  }

                  __int128 v19 = *(_OWORD *)a1;
                  *((void *)__dst + 2) = *((void *)a1 + 2);
                  _OWORD *v18 = v19;
                  *((_DWORD *)__dst + 3) = 88;
                  if (!a1[5])
                  {
                    size_t v10 = 24LL;
                    goto LABEL_11;
                  }

                  uint64_t v20 = 0LL;
                  size_t v10 = 24LL;
                  while (1)
                  {
                    uint64_t v21 = 0LL;
                    uint64_t v22 = 0LL;
                    uint64_t v11 = DeserializeRequirement((char *)a1 + v10, a2 - v10, &v22, &v21);
                    if ((_DWORD)v11) {
                      break;
                    }
                    *((void *)__dst + v20 + 3) = v22;
                    v10 += v21;
                  }
                }

LABEL_35:
                uint64_t v4 = v11;
              }
            }
          }
        }
      }
    }
  }

LABEL_36:
  if (__dst) {
    Util_DeallocRequirement((int *)__dst);
  }
  return v4;
}

uint64_t GetSerializedCredentialSize(_DWORD *a1, void *a2)
{
  uint64_t result = 4294967293LL;
  if (a1 && a2 && *a1 <= 0x17u && ((1 << *a1) & 0xFFF7FE) != 0)
  {
    uint64_t result = 0LL;
    *a2 = a1[7] + 32LL;
  }

  return result;
}

uint64_t SerializeCredential(unsigned int *__src, void *__dst, size_t *a3)
{
  uint64_t result = 4294967293LL;
  if (__src && __dst && a3)
  {
    unsigned int v6 = *__src;
    if (*__src <= 0x17 && ((1 << *__src) & 0xFFF7FE) != 0)
    {
      size_t v8 = __src[7] + 32LL;
      if (v8 <= *a3 && v6 <= 0x17 && ((1 << v6) & 0xFFF7FE) != 0)
      {
        memcpy(__dst, __src, v8);
        uint64_t result = 0LL;
        *a3 = __src[7] + 32LL;
      }
    }
  }

  return result;
}

uint64_t DeserializeCredential(unsigned int *a1, unint64_t a2, void **a3, void *a4)
{
  __dst = 0LL;
  uint64_t v4 = 4294967293LL;
  if (a2 >= 0x20 && a1 && a3 && a4)
  {
    unsigned int v8 = *a1;
    uint64_t v10 = a1[7];
    switch(*a1)
    {
      case 1u:
        if ((_DWORD)v10 == 28) {
          goto LABEL_7;
        }
        return v4;
      case 2u:
        if ((_DWORD)v10 == 136) {
          goto LABEL_7;
        }
        return v4;
      case 3u:
        if ((_DWORD)v10 == 305) {
          goto LABEL_7;
        }
        return v4;
      case 4u:
      case 5u:
      case 6u:
      case 8u:
      case 0xEu:
      case 0x10u:
      case 0x13u:
      case 0x16u:
      case 0x17u:
        if (!(_DWORD)v10) {
          goto LABEL_7;
        }
        return v4;
      case 7u:
        if ((_DWORD)v10 == 56) {
          goto LABEL_7;
        }
        return v4;
      case 9u:
        if ((_DWORD)v10 == 24) {
          goto LABEL_7;
        }
        return v4;
      case 0xAu:
        if ((_DWORD)v10 == 52) {
          goto LABEL_7;
        }
        return v4;
      case 0xCu:
      case 0xFu:
        if ((_DWORD)v10 == 8) {
          goto LABEL_7;
        }
        return v4;
      case 0xDu:
      case 0x15u:
        if ((_DWORD)v10 == 132) {
          goto LABEL_7;
        }
        return v4;
      case 0x11u:
        if ((_DWORD)v10 == 81) {
          goto LABEL_7;
        }
        return v4;
      case 0x12u:
        if ((_DWORD)v10 == 20) {
          goto LABEL_7;
        }
        return v4;
      case 0x14u:
        if ((_DWORD)v10 != 32) {
          return v4;
        }
LABEL_7:
        uint64_t v4 = Util_AllocCredential(*a1, &__dst);
        if ((_DWORD)v4)
        {
          if (__dst)
          {
LABEL_16:
            Util_DeallocCredential(__dst);
            return v4;
          }
        }

        else
        {
          if (__dst)
          {
            if (*((_DWORD *)__dst + 1) > 3u || *((_DWORD *)__dst + 2) > 0x50u)
            {
              uint64_t v4 = 4294967293LL;
            }

            else
            {
              uint64_t v4 = 4294967293LL;
              if (v8 <= 0x17 && ((1 << v8) & 0xFFF7FE) != 0 && v10 + 32 <= a2)
              {
                memcpy(__dst, a1, v10 + 32);
                uint64_t v4 = 0LL;
                *a3 = __dst;
                *a4 = v10 + 32;
                return v4;
              }
            }

            goto LABEL_16;
          }

          uint64_t v4 = 4294967292LL;
        }

        break;
      default:
        return v4;
    }
  }

  return v4;
}

uint64_t CopyCredential(uint64_t a1, void **a2)
{
  __dst = 0LL;
  uint64_t v2 = 4294967293LL;
  if (a1 && a2)
  {
    uint64_t v2 = Util_AllocCredential(*(_DWORD *)a1, &__dst);
    if ((_DWORD)v2)
    {
      if (__dst) {
        Util_DeallocCredential(__dst);
      }
    }

    else if (__dst)
    {
      memcpy(__dst, (const void *)a1, *(unsigned int *)(a1 + 28) + 32LL);
      uint64_t v2 = 0LL;
      *a2 = __dst;
    }

    else
    {
      return 4294967292LL;
    }
  }

  return v2;
}

uint64_t CompareCredentials(void *__s1, void *__s2, _BYTE *a3)
{
  uint64_t v3 = 4294967293LL;
  if (__s1)
  {
    uint64_t v4 = __s2;
    if (__s2)
    {
      if (a3)
      {
        unsigned int v6 = __s1;
        if (*(_DWORD *)__s1 == *(_DWORD *)__s2)
        {
          uint64_t v7 = *((unsigned int *)__s1 + 7);
          if ((_DWORD)v7 == *((_DWORD *)__s2 + 7))
          {
            uint64_t v3 = 4294967293LL;
            switch(*(_DWORD *)__s1)
            {
              case 1:
                if (*__s1 != *__s2 || __s1[1] != __s2[1] || __s1[2] != __s2[2] || __s1[3] != __s2[3]) {
                  break;
                }
                uint64_t v13 = (char *)__s1 + 44;
                BOOL v14 = (char *)__s2 + 44;
                goto LABEL_74;
              case 2:
                if (*((_DWORD *)__s1 + 8) != *((_DWORD *)__s2 + 8)) {
                  break;
                }
                size_t v8 = *((unsigned int *)__s1 + 9);
                if ((_DWORD)v8 != *((_DWORD *)__s2 + 9)) {
                  break;
                }
                __s2 += 5;
                __s1 += 5;
                goto LABEL_8;
              case 3:
                if (*__s1 != *__s2 || __s1[1] != __s2[1] || __s1[2] != __s2[2] || __s1[3] != __s2[3]) {
                  break;
                }
                uint64_t v13 = (char *)(__s1 + 13);
                BOOL v14 = (char *)(__s2 + 13);
                goto LABEL_74;
              case 4:
              case 5:
              case 6:
              case 8:
              case 0xC:
              case 0xE:
              case 0xF:
              case 0x10:
              case 0x11:
              case 0x12:
              case 0x13:
              case 0x16:
              case 0x17:
                size_t v8 = v7 + 32;
                goto LABEL_8;
              case 7:
                if (*__s1 != *__s2 || __s1[1] != __s2[1] || __s1[2] != __s2[2] || __s1[3] != __s2[3]) {
                  break;
                }
                BOOL v9 = sub_1207C((unint64_t)(__s1 + 4), 0x20uLL, (unint64_t)(__s2 + 4), 32LL);
                if (!v9) {
                  goto LABEL_100;
                }
                uint64_t v13 = (char *)(v6 + 8);
                BOOL v14 = (char *)(v4 + 8);
                size_t v21 = 24LL;
                uint64_t v22 = 24LL;
                goto LABEL_103;
              case 9:
                if (*__s1 != *__s2 || __s1[1] != __s2[1] || __s1[2] != __s2[2] || __s1[3] != __s2[3]) {
                  break;
                }
                uint64_t v13 = (char *)(__s1 + 5);
                BOOL v14 = (char *)(__s2 + 5);
                goto LABEL_74;
              case 0xA:
                if (*__s1 != *__s2 || __s1[1] != __s2[1] || __s1[2] != __s2[2] || __s1[3] != __s2[3]) {
                  break;
                }
                BOOL v9 = sub_1207C((unint64_t)__s1 + 36, 0x10uLL, (unint64_t)__s2 + 36, 16LL);
                if (!v9) {
                  goto LABEL_100;
                }
                uint64_t v13 = (char *)v6 + 52;
                BOOL v14 = (char *)v4 + 52;
LABEL_74:
                size_t v21 = 16LL;
                uint64_t v22 = 16LL;
                goto LABEL_103;
              case 0xD:
                size_t v8 = *((unsigned int *)__s1 + 8);
                if ((_DWORD)v8 != *((_DWORD *)__s2 + 8)) {
                  break;
                }
                __s2 = (void *)((char *)__s2 + 36);
                __s1 = (void *)((char *)__s1 + 36);
LABEL_8:
                LOBYTE(v9) = memcmp(__s1, __s2, v8) == 0;
                goto LABEL_100;
              case 0x14:
                if (*__s1 != *__s2 || __s1[1] != __s2[1] || __s1[2] != __s2[2] || __s1[3] != __s2[3]) {
                  break;
                }
                BOOL v14 = (char *)(__s2 + 4);
                uint64_t v13 = (char *)(__s1 + 4);
                size_t v21 = 32LL;
                uint64_t v22 = 32LL;
                goto LABEL_103;
              case 0x15:
                if (*__s1 != *__s2 || __s1[1] != __s2[1] || __s1[2] != __s2[2] || __s1[3] != __s2[3]) {
                  break;
                }
                uint64_t v13 = (char *)__s1 + 36;
                BOOL v14 = (char *)__s2 + 36;
                size_t v21 = 128LL;
                uint64_t v22 = 128LL;
LABEL_103:
                LOBYTE(v9) = sub_1207C((unint64_t)v13, v21, (unint64_t)v14, v22);
                goto LABEL_100;
              default:
                return v3;
            }
          }
        }

        LOBYTE(v9) = 0;
LABEL_100:
        uint64_t v3 = 0LL;
        *a3 = v9;
      }
    }
  }

  return v3;
}

BOOL sub_1207C(unint64_t __s1, size_t __n, unint64_t __s2, uint64_t a4)
{
  if (__n != a4) {
    return 0LL;
  }
  if (!(__s1 | __s2)) {
    return 1LL;
  }
  BOOL result = 0LL;
  BOOL v6 = __s1 == 0;
  if (__s2)
  {
    BOOL v7 = 1;
  }

  else
  {
    BOOL v6 = 0;
    BOOL v7 = __s1 == 0;
  }

  if (v7 && !v6) {
    return memcmp((const void *)__s1, (const void *)__s2, __n) == 0;
  }
  return result;
}

uint64_t GetSerializedAddCredentialSize(uint64_t a1, _DWORD *a2, int a3, void *a4)
{
  if (a1) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = a3 == 2;
  }
  char v5 = !v4;
  uint64_t result = 4294967293LL;
  if (a4 && a2 && (v5 & 1) == 0 && *a2 <= 0x17u && ((1 << *a2) & 0xFFF7FE) != 0)
  {
    uint64_t result = 0LL;
    *a4 = a2[7] + 52LL;
  }

  return result;
}

uint64_t SerializeAddCredential(_OWORD *a1, unsigned int *__src, int a3, uint64_t a4, void *a5)
{
  if (a1) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = a3 == 2;
  }
  char v7 = !v6;
  uint64_t result = 4294967293LL;
  if (a5)
  {
    if (a4)
    {
      if (__src)
      {
        if ((v7 & 1) == 0)
        {
          uint64_t result = 4294967293LL;
          if (*__src <= 0x17 && ((1 << *__src) & 0xFFF7FE) != 0 && *a5 >= (unint64_t)__src[7] + 52)
          {
            if (a1)
            {
              *(_OWORD *)a4 = *a1;
            }

            else
            {
              *(void *)a4 = 0LL;
              *(void *)(a4 + _Block_object_dispose(va, 8) = 0LL;
            }

            uint64_t v13 = *a5 - 16LL;
            uint64_t result = SerializeCredential(__src, (void *)(a4 + 16), (size_t *)&v13);
            if (!(_DWORD)result)
            {
              size_t v12 = v13;
              *(_DWORD *)(v13 + a4 + 16) = a3;
              *a5 = v12 + 20;
            }
          }
        }
      }
    }
  }

  return result;
}

uint64_t DeserializeAddCredential(uint64_t a1, unint64_t a2, _OWORD *a3, void *a4, _DWORD *a5)
{
  size_t v12 = 0LL;
  uint64_t v13 = 0LL;
  uint64_t v5 = 4294967293LL;
  if (a1 && a2 >= 0x34 && a3 && a4 && a5)
  {
    *a3 = *(_OWORD *)a1;
    uint64_t v10 = DeserializeCredential((unsigned int *)(a1 + 16), a2 - 16, (void **)&v12, &v13);
    if ((_DWORD)v10)
    {
      uint64_t v5 = v10;
    }

    else if (a2 - (v13 + 16) >= 4)
    {
      uint64_t v5 = 0LL;
      *a5 = *(_DWORD *)(a1 + v13 + 16);
      *a4 = v12;
      return v5;
    }
  }

  if (v12) {
    Util_DeallocCredential(v12);
  }
  return v5;
}

uint64_t DeserializeAddCredentialType(uint64_t a1, unint64_t a2, _DWORD *a3)
{
  uint64_t result = 4294967293LL;
  if (a2 >= 0x34 && a1)
  {
    if (a3)
    {
      uint64_t result = 0LL;
      *a3 = *(_DWORD *)(a1 + 16);
    }
  }

  return result;
}

uint64_t GetSerializedRemoveCredentialSize(uint64_t a1, _DWORD *a2, int a3, void *a4)
{
  if (a1) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = a3 == 2;
  }
  char v5 = !v4;
  uint64_t result = 4294967293LL;
  if (a4 && a2 && (v5 & 1) == 0 && *a2 <= 0x17u && ((1 << *a2) & 0xFFF7FE) != 0)
  {
    uint64_t result = 0LL;
    *a4 = a2[7] + 52LL;
  }

  return result;
}

uint64_t GetSerializedReplacePassphraseCredentialSize(uint64_t a1, _DWORD *a2, int a3, void *a4)
{
  if (a1) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = a3 == 2;
  }
  char v5 = !v4;
  uint64_t result = 4294967293LL;
  if (a4 && a2 && (v5 & 1) == 0 && *a2 <= 0x17u && ((1 << *a2) & 0xFFF7FE) != 0)
  {
    uint64_t result = 0LL;
    *a4 = a2[7] + 52LL;
  }

  return result;
}

uint64_t SerializeCredentialList(unsigned int **a1, unsigned int a2, unsigned int *a3, void *a4)
{
  if (a2) {
    BOOL v6 = a1 == 0LL;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6 || a3 == 0LL || a4 == 0LL) {
    return 4294967293LL;
  }
  v16[7] = v4;
  v16[8] = v5;
  *a3 = a2;
  if (a2)
  {
    uint64_t v11 = a1;
    uint64_t v12 = a2;
    uint64_t v13 = 4LL;
    while (1)
    {
      BOOL v14 = *v11;
      if (!*v11) {
        return 4294967293LL;
      }
      v16[0] = *a4 - v13;
      uint64_t result = SerializeCredential(v14, (char *)a3 + v13, v16);
      if ((_DWORD)result) {
        return result;
      }
      v13 += v16[0];
      ++v11;
      if (!--v12) {
        goto LABEL_18;
      }
    }
  }

  else
  {
    uint64_t v13 = 4LL;
LABEL_18:
    uint64_t result = 0LL;
    *a4 = v13;
  }

  return result;
}

uint64_t DeserializeCredentialList(unsigned int *a1, uint64_t a2, void *a3, _DWORD *a4)
{
  uint64_t v15 = 0LL;
  uint64_t v4 = 4294967293LL;
  if (a1)
  {
    if (a3)
    {
      if (a4)
      {
        uint64_t v8 = *a1;
        if (v8 <= 0x3E8)
        {
          if ((_DWORD)v8)
          {
            uint64_t v10 = (char *)acm_mem_alloc(8 * v8);
            acm_mem_alloc_info( "array of ACMCredentialRef",  v10,  8 * v8,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c",  1778,  "DeserializeCredentialList");
            if (v10)
            {
              uint64_t v11 = 0LL;
              uint64_t v12 = 4LL;
              while (1)
              {
                uint64_t v13 = DeserializeCredential((unsigned int *)((char *)a1 + v12), a2 - v12, (void **)&v10[v11], &v15);
                if ((_DWORD)v13) {
                  break;
                }
                v12 += v15;
                v11 += 8LL;
                if (8 * v8 == v11) {
                  goto LABEL_12;
                }
              }

              uint64_t v4 = v13;
              DeallocCredentialList((_DWORD **)v10, v8);
            }

            else
            {
              return 4294967292LL;
            }
          }

          else
          {
            uint64_t v10 = 0LL;
LABEL_12:
            uint64_t v4 = 0LL;
            *a4 = v8;
            *a3 = v10;
          }
        }
      }
    }
  }

  return v4;
}

void DeallocCredentialList(_DWORD **a1, unsigned int a2)
{
  if (a1)
  {
    uint64_t v3 = a2;
    if (a2)
    {
      uint64_t v4 = a1;
      uint64_t v5 = a2;
      do
      {
        if (*v4)
        {
          Util_DeallocCredential(*v4);
          *uint64_t v4 = 0LL;
        }

        ++v4;
        --v5;
      }

      while (v5);
    }

    unint64_t v6 = 8 * v3;
    acm_mem_free_info( "array of ACMCredentialRef",  a1,  v6,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c",  1816,  "DeallocCredentialList");
    acm_mem_free(a1, v6);
  }

uint64_t GetSerializedGetContextPropertySize(uint64_t a1, uint64_t a2, void *a3)
{
  if (!a3) {
    return 4294967293LL;
  }
  uint64_t result = 0LL;
  *a3 = 20LL;
  return result;
}

__n128 SerializeGetContextProperty(__n128 *a1, unsigned __int32 a2, __n128 *a3, void *a4)
{
  if (a1 && a3 && a4 && *a4 >= 0x14uLL)
  {
    __n128 result = *a1;
    *a3 = *a1;
    a3[1].n128_u32[0] = a2;
    *a4 = 20LL;
  }

  return result;
}

uint64_t DeserializeGetContextProperty(uint64_t a1, unint64_t a2, _OWORD *a3, _DWORD *a4)
{
  uint64_t result = 4294967293LL;
  if (a2 >= 0x10 && a1 && a3 && a4)
  {
    *a3 = *(_OWORD *)a1;
    if ((a2 & 0xFFFFFFFFFFFFFFFCLL) != 0x10)
    {
      uint64_t result = 0LL;
      *a4 = *(_DWORD *)(a1 + 16);
    }
  }

  return result;
}

uint64_t LibSer_GetAclAuthMethod_GetSize(uint64_t a1, void *a2)
{
  if (!a2) {
    return 4294967293LL;
  }
  uint64_t result = 0LL;
  *a2 = 16LL;
  return result;
}

__n128 LibSer_GetAclAuthMethod_Serialize(__n128 *a1, __n128 *a2, void *a3)
{
  if (a1 && a2 && a3 && *a3 >= 0x10uLL)
  {
    __n128 result = *a1;
    *a2 = *a1;
    *a3 = 16LL;
  }

  return result;
}

__n128 LibSer_GetAclAuthMethod_Deserialize(__n128 *a1, unint64_t a2, __n128 *a3)
{
  if (a2 >= 0x10 && a1)
  {
    if (a3)
    {
      __n128 result = *a1;
      *a3 = *a1;
    }
  }

  return result;
}

uint64_t LibSer_ContextCredentialGetProperty_GetSize(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (!a4) {
    return 4294967293LL;
  }
  uint64_t result = 0LL;
  *a4 = 24LL;
  return result;
}

__n128 LibSer_ContextCredentialGetProperty_Serialize( __n128 *a1, unsigned __int32 a2, unsigned __int32 a3, __n128 *a4, void *a5)
{
  if (a1 && a4 && a5 && *a5 >= 0x18uLL)
  {
    __n128 result = *a1;
    *a4 = *a1;
    a4[1].n128_u32[0] = a2;
    a4[1].n128_u32[1] = a3;
    *a5 = 24LL;
  }

  return result;
}

__n128 LibSer_ContextCredentialGetProperty_Deserialize( __n128 *a1, unint64_t a2, __n128 *a3, _DWORD *a4, _DWORD *a5)
{
  if (a2 >= 0x18 && a1 && a3 && a4)
  {
    if (a5)
    {
      __n128 result = *a1;
      *a3 = *a1;
      *a4 = a1[1].n128_u32[0];
      *a5 = a1[1].n128_u32[1];
    }
  }

  return result;
}

uint64_t LibSer_GlobalContextCredentialGetProperty_GetSize(void *a1)
{
  if (!a1) {
    return 4294967293LL;
  }
  uint64_t result = 0LL;
  *a1 = 8LL;
  return result;
}

uint64_t LibSer_GlobalContextCredentialGetProperty_Serialize(int a1, int a2, _DWORD *a3, void *a4)
{
  uint64_t result = 4294967293LL;
  if (a3 && a4 && *a4 >= 8uLL)
  {
    uint64_t result = 0LL;
    *a3 = a1;
    a3[1] = a2;
    *a4 = 8LL;
  }

  return result;
}

uint64_t LibSer_GlobalContextCredentialGetProperty_Deserialize( _DWORD *a1, unint64_t a2, _DWORD *a3, _DWORD *a4)
{
  uint64_t result = 4294967293LL;
  if (a2 >= 8 && a1 && a3)
  {
    if (a4)
    {
      uint64_t result = 0LL;
      *a3 = *a1;
      *a4 = a1[1];
    }
  }

  return result;
}

uint64_t LibSer_RemoveCredentialByType_GetSize(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (!a4) {
    return 4294967293LL;
  }
  uint64_t result = 0LL;
  *a4 = 24LL;
  return result;
}

__n128 LibSer_RemoveCredentialByType_Serialize( __n128 *a1, unsigned __int32 a2, unsigned __int32 a3, __n128 *a4, void *a5)
{
  if (a1 && a4 && a5 && *a5 >= 0x18uLL)
  {
    __n128 result = *a1;
    *a4 = *a1;
    a4[1].n128_u32[0] = a2;
    a4[1].n128_u32[1] = a3;
    *a5 = 24LL;
  }

  return result;
}

__n128 LibSer_RemoveCredentialByType_Deserialize( __n128 *a1, unint64_t a2, __n128 *a3, _DWORD *a4, _DWORD *a5)
{
  if (a2 >= 0x18 && a1 && a3 && a4)
  {
    if (a5)
    {
      __n128 result = *a1;
      *a3 = *a1;
      *a4 = a1[1].n128_u32[0];
      *a5 = a1[1].n128_u32[1];
    }
  }

  return result;
}

uint64_t LibSer_DeleteContext_GetSize(uint64_t a1, void *a2)
{
  if (!a2) {
    return 4294967293LL;
  }
  uint64_t result = 0LL;
  *a2 = 16LL;
  return result;
}

__n128 LibSer_DeleteContext_Serialize(__n128 *a1, __n128 *a2, void *a3)
{
  if (a1 && a2 && a3 && *a3 >= 0x10uLL)
  {
    __n128 result = *a1;
    *a2 = *a1;
    *a3 = 16LL;
  }

  return result;
}

__n128 LibSer_DeleteContext_Deserialize(__n128 *a1, unint64_t a2, __n128 *a3)
{
  if (a2 >= 0x10 && a1)
  {
    if (a3)
    {
      __n128 result = *a1;
      *a3 = *a1;
    }
  }

  return result;
}

uint64_t LibSer_StorageAnyCmd_DeserializeCommonFields( uint64_t a1, unint64_t a2, _OWORD *a3, _DWORD *a4)
{
  uint64_t result = 4294967293LL;
  if (a1 && a2 >= 0x14)
  {
    if (a3) {
      *a3 = *(_OWORD *)a1;
    }
    uint64_t result = 0LL;
    if (a4) {
      *a4 = *(_DWORD *)(a1 + 16);
    }
  }

  return result;
}

uint64_t LibSer_StorageSetData_GetSize(uint64_t a1, _DWORD *a2, unsigned int a3, void *a4)
{
  unsigned int v7 = 0;
  if (!a4) {
    return 4294967291LL;
  }
  uint64_t result = sub_1038C(a2, a3, &v7);
  if (!(_DWORD)result) {
    *a4 = a1 + v7 + 28;
  }
  return result;
}

uint64_t LibSer_StorageSetData_Serialize( _OWORD *a1, int a2, const void *a3, size_t a4, _DWORD *a5, unsigned int a6, uint64_t a7, size_t *a8)
{
  uint64_t result = 4294967293LL;
  if (a1)
  {
    if (a2)
    {
      if (a7)
      {
        if (a8)
        {
          unsigned int v18 = 0;
          uint64_t result = sub_1038C(a5, a6, &v18);
          if (!(_DWORD)result)
          {
            if (*a8 < a4 + v18 + 28)
            {
              return 4294967293LL;
            }

            else
            {
              *(_OWORD *)a7 = *a1;
              *(_DWORD *)(a7 + 16) = a2;
              *(_DWORD *)(a7 + 20) = a4;
              memcpy((void *)(a7 + 24), a3, a4);
              size_t v17 = a4 + 24;
              uint64_t result = sub_105B4((uint64_t)a5, a6, a7, (uint64_t *)&v17);
              if (!(_DWORD)result) {
                *a8 = v17;
              }
            }
          }
        }
      }
    }
  }

  return result;
}

uint64_t LibSer_StorageSetData_Deserialize( uint64_t a1, unint64_t a2, _OWORD *a3, _DWORD *a4, void *a5, void *a6, void *a7, _DWORD *a8)
{
  uint64_t v10 = 4294967293LL;
  if (a1 && a2 >= 0x18 && a6 && a3 && a4 && a5 && a7 && a8)
  {
    v14[1] = v8;
    v14[2] = v9;
    *a3 = *(_OWORD *)a1;
    *a4 = *(_DWORD *)(a1 + 16);
    uint64_t v11 = *(unsigned int *)(a1 + 20);
    v14[0] = 24LL;
    *a6 = v11;
    if ((_DWORD)v11)
    {
      unint64_t v12 = v11 + 24;
      if (v12 > a2) {
        return 4294967293LL;
      }
      *a5 = a1 + 24;
      v14[0] = v12;
    }

    else
    {
      *a5 = 0LL;
    }

    return sub_108EC(a1, a2, v14, a7, a8);
  }

  return v10;
}

uint64_t LibSer_StorageGetData_GetSize(_DWORD *a1, unsigned int a2, void *a3)
{
  unsigned int v5 = 0;
  if (!a3) {
    return 4294967291LL;
  }
  uint64_t result = sub_1038C(a1, a2, &v5);
  if (!(_DWORD)result) {
    *a3 = v5 + 25LL;
  }
  return result;
}

uint64_t LibSer_StorageGetData_Serialize( _OWORD *a1, int a2, char a3, _DWORD *a4, unsigned int a5, uint64_t a6, void *a7)
{
  uint64_t result = 4294967293LL;
  if (a1)
  {
    if (a2)
    {
      if (a6)
      {
        if (a7)
        {
          unsigned int v16 = 0;
          uint64_t result = sub_1038C(a4, a5, &v16);
          if (!(_DWORD)result)
          {
            if (*a7 < (unint64_t)v16 + 25)
            {
              return 4294967293LL;
            }

            else
            {
              *(_OWORD *)a6 = *a1;
              *(_DWORD *)(a6 + 16) = a2;
              *(_BYTE *)(a6 + 20) = a3;
              uint64_t v15 = 21LL;
              uint64_t result = sub_105B4((uint64_t)a4, a5, a6, &v15);
              if (!(_DWORD)result) {
                *a7 = v15;
              }
            }
          }
        }
      }
    }
  }

  return result;
}

uint64_t LibSer_StorageGetData_Deserialize( uint64_t a1, unint64_t a2, _OWORD *a3, _DWORD *a4, BOOL *a5, void *a6, _DWORD *a7)
{
  uint64_t v9 = 4294967293LL;
  if (a1 && a2 >= 0x15 && a3 && a4 && a5)
  {
    v11[1] = v7;
    v11[2] = v8;
    *a3 = *(_OWORD *)a1;
    *a4 = *(_DWORD *)(a1 + 16);
    *a5 = *(_BYTE *)(a1 + 20) != 0;
    v11[0] = 21LL;
    return sub_108EC(a1, a2, v11, a6, a7);
  }

  return v9;
}

uint64_t LibSer_GetUnlockSecret_GetSize(_DWORD *a1, unsigned int a2, void *a3)
{
  unsigned int v5 = 0;
  if (!a3) {
    return 4294967291LL;
  }
  uint64_t result = sub_1038C(a1, a2, &v5);
  if (!(_DWORD)result) {
    *a3 = v5 + 20LL;
  }
  return result;
}

uint64_t LibSer_GetUnlockSecret_Serialize(_OWORD *a1, _DWORD *a2, unsigned int a3, _OWORD *a4, void *a5)
{
  uint64_t result = 4294967293LL;
  if (a1)
  {
    if (a4)
    {
      if (a5)
      {
        unsigned int v12 = 0;
        uint64_t result = sub_1038C(a2, a3, &v12);
        if (!(_DWORD)result)
        {
          if (*a5 < (unint64_t)v12 + 20)
          {
            return 4294967293LL;
          }

          else
          {
            *a4 = *a1;
            uint64_t v11 = 16LL;
            uint64_t result = sub_105B4((uint64_t)a2, a3, (uint64_t)a4, &v11);
            if (!(_DWORD)result) {
              *a5 = v11;
            }
          }
        }
      }
    }
  }

  return result;
}

uint64_t LibSer_GetUnlockSecret_Deserialize( _OWORD *a1, unint64_t a2, _OWORD *a3, void *a4, _DWORD *a5)
{
  if (!a1) {
    return 4294967293LL;
  }
  uint64_t result = 4294967293LL;
  if (a2 >= 0x10 && a3 && a4)
  {
    if (a5)
    {
      v9[1] = v5;
      v9[2] = v6;
      *a3 = *a1;
      v9[0] = 16LL;
      return sub_108EC((uint64_t)a1, a2, v9, a4, a5);
    }
  }

  return result;
}

uint64_t LibSer_GetUnlockSecretResponse_GetSize(uint64_t a1, void *a2)
{
  if (!a2) {
    return 4294967291LL;
  }
  uint64_t result = 0LL;
  *a2 = a1 + 1;
  return result;
}

uint64_t LibSer_GetUnlockSecretResponse_Serialize(void *__src, size_t __n, char a3, _BYTE *a4, void *a5)
{
  uint64_t result = 4294967293LL;
  if (__src && __n && a4 && a5)
  {
    size_t v9 = __n + 1;
    if (*a5 < __n + 1)
    {
      return 4294967293LL;
    }

    else
    {
      *a4 = a3;
      memcpy(a4 + 1, __src, __n);
      uint64_t result = 0LL;
      *a5 = v9;
    }
  }

  return result;
}

uint64_t LibSer_GetUnlockSecretResponse_Deserialize(_BYTE *a1, uint64_t a2, void *a3, void *a4, _BYTE *a5)
{
  uint64_t result = 4294967293LL;
  if (a2 && a5 && a1 && a3)
  {
    if (a4)
    {
      uint64_t result = 0LL;
      *a5 = *a1;
      *a3 = a1 + 1;
      *a4 = a2 - 1;
    }
  }

  return result;
}

uint64_t LibSer_SEPControl_GetSize(uint64_t a1, _DWORD *a2, unsigned int a3, void *a4)
{
  unsigned int v7 = 0;
  if (!a4) {
    return 4294967291LL;
  }
  uint64_t result = sub_1038C(a2, a3, &v7);
  if (!(_DWORD)result) {
    *a4 = a1 + v7 + 24;
  }
  return result;
}

uint64_t LibSer_SEPControl_Serialize( _OWORD *a1, _DWORD *a2, unsigned int a3, const void *a4, size_t a5, uint64_t a6, void *a7)
{
  uint64_t result = 4294967293LL;
  if (a6)
  {
    if (a7)
    {
      unsigned int v18 = 0;
      uint64_t result = sub_1038C(a2, a3, &v18);
      if (!(_DWORD)result)
      {
        if (*a7 < a5 + v18 + 24)
        {
          return 4294967293LL;
        }

        else
        {
          if (a1)
          {
            *(_OWORD *)a6 = *a1;
          }

          else
          {
            *(void *)a6 = 0LL;
            *(void *)(a6 + _Block_object_dispose(va, 8) = 0LL;
          }

          uint64_t v17 = 16LL;
          uint64_t result = sub_105B4((uint64_t)a2, a3, a6, &v17);
          if (!(_DWORD)result)
          {
            uint64_t v15 = v17;
            *(_DWORD *)(a6 + v17) = a5;
            uint64_t v16 = v15 + 4;
            memcpy((void *)(a6 + v15 + 4), a4, a5);
            uint64_t result = 0LL;
            *a7 = v16 + a5;
          }
        }
      }
    }
  }

  return result;
}

uint64_t LibSer_SEPControl_Deserialize( _OWORD *a1, unint64_t a2, _OWORD *a3, void *a4, _DWORD *a5, unint64_t *a6, void *a7)
{
  if (!a1) {
    return 4294967293LL;
  }
  uint64_t result = 4294967293LL;
  if (a2 >= 0x18 && a7 && a3 && a4 && a5 && a6)
  {
    *a3 = *a1;
    unint64_t v12 = 16LL;
    uint64_t result = sub_108EC((uint64_t)a1, a2, &v12, a4, a5);
    if (!(_DWORD)result)
    {
      unint64_t v11 = (unint64_t)a1 + v12 + 4;
      *a7 = *(unsigned int *)((char *)a1 + v12);
      *a6 = v11;
    }
  }

  return result;
}

uint64_t LibSer_SEPControlResponse_GetSize(uint64_t a1, void *a2)
{
  if (!a2) {
    return 4294967291LL;
  }
  uint64_t result = 0LL;
  *a2 = a1 + 4;
  return result;
}

uint64_t LibSer_SEPControlResponse_Serialize(void *__src, size_t __n, _DWORD *a3, uint64_t *a4)
{
  uint64_t result = 4294967293LL;
  if (a3 && a4)
  {
    uint64_t v8 = __n + 4;
    if (*a4 < __n + 4)
    {
      return 4294967293LL;
    }

    else
    {
      *a3 = __n;
      if (__src) {
        memcpy(a3 + 1, __src, __n);
      }
      else {
        uint64_t v8 = 4LL;
      }
      uint64_t result = 0LL;
      *a4 = v8;
    }
  }

  return result;
}

uint64_t LibSer_SEPControlResponse_Deserialize(unsigned int *a1, unint64_t a2, void *a3, void *a4)
{
  if (!a1) {
    return 4294967293LL;
  }
  uint64_t result = 4294967293LL;
  if (a2 >= 4 && a3 && a4)
  {
    uint64_t result = 0LL;
    unsigned int v7 = *a1;
    unint64_t v6 = a1 + 1;
    *a4 = v7;
    if (!v7) {
      unint64_t v6 = 0LL;
    }
    *a3 = v6;
  }

  return result;
}

uint64_t sub_131D8(_DWORD *a1)
{
  if (!a1) {
    return 4294967293LL;
  }
  switch(*a1)
  {
    case 0:
    case 0xC:
      if (a1[4]) {
        return 4294967293LL;
      }
      break;
    case 1:
    case 4:
    case 5:
    case 0xA:
      if (a1[4] != 4) {
        return 4294967293LL;
      }
      break;
    case 2:
    case 6:
    case 7:
      if (a1[4] != 16) {
        return 4294967293LL;
      }
      break;
    case 3:
      break;
    case 8:
    case 9:
      if (a1[4] != 1) {
        return 4294967293LL;
      }
      break;
    case 0xB:
      if (a1[4] > 0x400u) {
        return 4294967293LL;
      }
      break;
    default:
      return 4294967293LL;
  }

  return 0LL;
}

uint64_t LibCall_ACMKernelControl_Block( uint64_t (*a1)(uint64_t, uint64_t, void, char *, size_t, uint64_t, uint64_t), uint64_t a2, int a3, const void *a4, size_t a5, uint64_t a6)
{
  uint64_t v16 = 0x2000LL;
  uint64_t v12 = LibCall_ACMKernelControl(a1, a2, a3, a4, a5, (uint64_t)v17, (uint64_t)&v16);
  if (a6)
  {
    if (v16) {
      uint64_t v13 = v17;
    }
    else {
      uint64_t v13 = 0LL;
    }
    (*(void (**)(uint64_t, _BYTE *))(a6 + 16))(a6, v13);
  }

  if ((_DWORD)v12) {
    unsigned int v14 = 70;
  }
  else {
    unsigned int v14 = 10;
  }
  return v12;
}

uint64_t LibCall_ACMSEPControl_Block( uint64_t (*a1)(uint64_t, uint64_t, void, char *, uint64_t, unsigned int *, unint64_t *), uint64_t a2, const void *a3, size_t a4, uint64_t a5, _DWORD *a6, unsigned int a7, uint64_t a8)
{
  size_t v20 = 1024LL;
  uint64_t v16 = LibCall_ACMSEPControl(a1, a2, a3, a4, a5, a6, a7, v21, &v20);
  if (a8)
  {
    if (v20) {
      uint64_t v17 = v21;
    }
    else {
      uint64_t v17 = 0LL;
    }
    (*(void (**)(uint64_t, _BYTE *))(a8 + 16))(a8, v17);
  }

  if ((_DWORD)v16) {
    unsigned int v18 = 70;
  }
  else {
    unsigned int v18 = 10;
  }
  return v16;
}

uint64_t LibCall_ACMGlobalContextCredentialGetProperty_Block( uint64_t result, uint64_t a2, int a3, int a4, uint64_t a5)
{
  size_t v9 = (uint64_t (*)(uint64_t, uint64_t, void, int *, uint64_t, _BYTE *, uint64_t *))result;
  uint64_t v14 = 256LL;
  if (v9)
  {
    uint64_t v13 = 8LL;
    uint64_t result = LibSer_GlobalContextCredentialGetProperty_Serialize(a3, a4, &v15, &v13);
    if ((_DWORD)result)
    {
LABEL_7:
      uint64_t v10 = result;
      goto LABEL_8;
    }

    if (v13 == 8)
    {
      uint64_t result = v9(a2, 27LL, 0LL, &v15, 8LL, v16, &v14);
      goto LABEL_7;
    }

    uint64_t v10 = 4294967291LL;
  }

  else
  {
    uint64_t v10 = 4294967293LL;
  }

LABEL_8:
  if (a5)
  {
    if (v14) {
      unint64_t v11 = v16;
    }
    else {
      unint64_t v11 = 0LL;
    }
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, _BYTE *))(a5 + 16))(a5, v10, v11);
  }

  if ((_DWORD)v10) {
    unsigned int v12 = 70;
  }
  else {
    unsigned int v12 = 10;
  }
  if (v12 >= gACMLoggingLevel) {
    return printf( "%s: %s: returning, err = %ld.\n",  "ACM",  "LibCall_ACMGlobalContextCredentialGetProperty_Block",  (int)v10);
  }
  return result;
}

uint64_t LibCall_ACMContextVerifyPolicy_Block( uint64_t (*a1)(uint64_t, uint64_t, void, _OWORD *, size_t, unsigned int *, unint64_t *), uint64_t a2, _OWORD *a3, char *a4, uint64_t a5)
{
  return LibCall_ACMContextVerifyPolicyWithPreflight_Block(a1, a2, a3, a4, 0LL, a5);
}

uint64_t LibCall_ACMContextVerifyPolicyWithPreflight_Block( uint64_t (*a1)(uint64_t, uint64_t, void, _OWORD *, size_t, unsigned int *, unint64_t *), uint64_t a2, _OWORD *a3, char *__s1, uint64_t a5, uint64_t a6)
{
  uint64_t v17 = 0LL;
  BOOL v16 = 0;
  unsigned int v12 = 70;
  uint64_t v13 = 4294967293LL;
  if (a3 && __s1 && a6)
  {
    uint64_t v13 = LibCall_ACMContextVerifyPolicyEx(a1, a2, a3, __s1, a5, 0LL, 0, 0LL, &v16, &v17);
    uint64_t v14 = v17;
    if (!(_DWORD)v13)
    {
      (*(void (**)(uint64_t, BOOL, int *))(a6 + 16))(a6, v16, v17);
      uint64_t v14 = v17;
    }

    if (v14) {
      Util_DeallocRequirement(v14);
    }
    if ((_DWORD)v13) {
      unsigned int v12 = 70;
    }
    else {
      unsigned int v12 = 10;
    }
  }

  return v13;
}

int *LibCall_ACMContextVerifyPolicyEx_Block( uint64_t (*a1)(uint64_t, uint64_t, void, _OWORD *, size_t, unsigned int *, unint64_t *), uint64_t a2, _OWORD *a3, char *__s1, uint64_t a5, _DWORD *a6, unsigned int a7, uint64_t a8, uint64_t a9)
{
  BOOL v17 = 0LL;
  unsigned int v18 = 0LL;
  uint64_t v22 = 0LL;
  BOOL v21 = 0;
  uint64_t v19 = 4294967293LL;
  if (a3 && __s1 && a9)
  {
    uint64_t v19 = LibCall_ACMContextVerifyPolicyEx(a1, a2, a3, __s1, a5, a6, a7, a8, &v21, &v22);
    unsigned int v18 = v22;
    BOOL v17 = v21;
  }

  (*(void (**)(uint64_t, uint64_t, BOOL, int *))(a9 + 16))(a9, v19, v17, v18);
  uint64_t result = v22;
  if (v22) {
    uint64_t result = (int *)Util_DeallocRequirement(v22);
  }
  return result;
}

uint64_t LibCall_ACMGlobalContextVerifyPolicy_Block( uint64_t (*a1)(uint64_t, uint64_t, void, _OWORD *, size_t, unsigned int *, unint64_t *), uint64_t a2, char *a3, uint64_t a4, _DWORD *a5, unsigned int a6, uint64_t a7)
{
  *(void *)int v15 = 0LL;
  uint64_t result = LibCall_ACMContextCreate( (uint64_t (*)(uint64_t, uint64_t, void, void, void, _BYTE *, uint64_t *))a1,  a2,  v15,  0LL,  1);
  if ((_DWORD)result)
  {
    if (a7) {
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void, void))(a7 + 16))(a7, result, 0LL, 0LL);
    }
  }

  else
  {
    uint64_t result = (uint64_t)LibCall_ACMContextVerifyPolicyEx_Block(a1, a2, *(_OWORD **)v15, a3, a4, a5, a6, 0xFFFFFFFFLL, a7);
  }

  if (*(void *)v15) {
    uint64_t result = LibCall_ACMContextDelete( (void (*)(uint64_t, uint64_t, void, void *, uint64_t, void, void))a1,  a2,  *(void **)v15,  1);
  }
  return result;
}

uint64_t LibCall_ACMGetEnvironmentVariable_Block( uint64_t (*a1)(uint64_t, uint64_t, void, int *, uint64_t, uint64_t, uint64_t), uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v14 = 128LL;
  if (!a4)
  {
    unsigned int v12 = 70;
    uint64_t v9 = 4294967293LL;
    goto LABEL_17;
  }

  if (a3 == 36)
  {
    uint64_t v8 = acm_mem_alloc_data(0x800uLL);
    acm_mem_alloc_info( "<data>",  v8,  2048LL,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCallBlock.c",  162,  "LibCall_ACMGetEnvironmentVariable_Block");
    if (!v8)
    {
      unsigned int v12 = 70;
      uint64_t v9 = 4294967292LL;
      goto LABEL_17;
    }

    uint64_t v14 = 2048LL;
    uint64_t v9 = LibCall_ACMGetEnvironmentVariable(a1, a2, 36, (uint64_t)v8, (uint64_t)&v14);
    if (!(_DWORD)v9)
    {
      if (v14) {
        uint64_t v10 = v8;
      }
      else {
        uint64_t v10 = 0LL;
      }
      (*(void (**)(uint64_t, void *))(a4 + 16))(a4, v10);
      acm_mem_free_info( "<data>",  v8,  0x800uLL,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCallBlock.c",  176,  "LibCall_ACMGetEnvironmentVariable_Block");
      acm_mem_free_data(v8, 0x800uLL);
LABEL_16:
      unsigned int v12 = 10;
      goto LABEL_17;
    }

    acm_mem_free_info( "<data>",  v8,  0x800uLL,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCallBlock.c",  176,  "LibCall_ACMGetEnvironmentVariable_Block");
    acm_mem_free_data(v8, 0x800uLL);
  }

  else
  {
    uint64_t v9 = LibCall_ACMGetEnvironmentVariable(a1, a2, a3, (uint64_t)v15, (uint64_t)&v14);
    if (!(_DWORD)v9)
    {
      if (v14) {
        unint64_t v11 = v15;
      }
      else {
        unint64_t v11 = 0LL;
      }
      (*(void (**)(uint64_t, _BYTE *))(a4 + 16))(a4, v11);
      goto LABEL_16;
    }
  }

  unsigned int v12 = 70;
LABEL_17:
  return v9;
}

uint64_t LibCall_ACMTRMLoadState_Block( uint64_t (*a1)(uint64_t, uint64_t, void, void, void, uint64_t, uint64_t), uint64_t a2, uint64_t a3)
{
  uint64_t v10 = 0x2000LL;
  if (a3)
  {
    uint64_t v6 = LibCall_ACMTRMLoadState(a1, a2, (uint64_t)v11, (uint64_t)&v10);
    if ((_DWORD)v6)
    {
      unsigned int v8 = 70;
    }

    else
    {
      if (v10) {
        unsigned int v7 = v11;
      }
      else {
        unsigned int v7 = 0LL;
      }
      (*(void (**)(uint64_t, _BYTE *))(a3 + 16))(a3, v7);
      unsigned int v8 = 10;
    }
  }

  else
  {
    unsigned int v8 = 70;
    uint64_t v6 = 4294967293LL;
  }

  return v6;
}

uint64_t LibCall_ACMContextUnloadToImage_Block( uint64_t (*a1)(uint64_t, uint64_t, void, int *, uint64_t, _BYTE *, int *), uint64_t a2, __int128 *a3, uint64_t a4)
{
  uint64_t v12 = 4096LL;
  if (a4)
  {
    uint64_t v8 = LibCall_ACMContextUnloadToImage(a1, a2, a3, v13, &v12);
    if ((_DWORD)v8)
    {
      unsigned int v10 = 70;
    }

    else
    {
      if (v12) {
        uint64_t v9 = v13;
      }
      else {
        uint64_t v9 = 0LL;
      }
      (*(void (**)(uint64_t, _BYTE *))(a4 + 16))(a4, v9);
      unsigned int v10 = 10;
    }
  }

  else
  {
    unsigned int v10 = 70;
    uint64_t v8 = 4294967293LL;
  }

  return v8;
}

uint64_t LibCall_ACMGetAclAuthMethod_Block(uint64_t result, uint64_t a2, __n128 *a3, uint64_t a4)
{
  unsigned int v7 = (void (*)(uint64_t, uint64_t, void, __n128 *, uint64_t, _BYTE *, uint64_t *, __n128))result;
  uint64_t v11 = 256LL;
  if (v7 && a3 && a4)
  {
    uint64_t v10 = 16LL;
    __n128 AclAuthMethod_Serialize = LibSer_GetAclAuthMethod_Serialize(a3, &v12, &v10);
    if (!v9 && v10 == 16) {
      v7(a2, 31LL, 0LL, &v12, 16LL, v13, &v11, AclAuthMethod_Serialize);
    }
    goto LABEL_9;
  }

  if (a4) {
LABEL_9:
  }
    uint64_t result = (*(uint64_t (**)(uint64_t))(a4 + 16))(a4);
  return result;
}

uint64_t LibCall_ACMContextVerifyAclConstraint( uint64_t a1, uint64_t a2, _OWORD *a3, const void *a4, uint64_t a5, unsigned __int8 a6, _DWORD *a7, unsigned int a8, unsigned int a9, uint64_t a10)
{
  return sub_140D4(a1, a2, 0xBu, a3, a4, a5, 0LL, 0, a6, a7, a8, a9, a10);
}

uint64_t sub_140D4( uint64_t result, uint64_t a2, unsigned __int8 a3, _OWORD *a4, const void *a5, uint64_t a6, const void *a7, unsigned int a8, unsigned __int8 a9, _DWORD *a10, unsigned int a11, unsigned int a12, uint64_t a13)
{
  size_t v20 = (uint64_t (*)(uint64_t, uint64_t, void, void *, size_t, unsigned int *, unint64_t *))result;
  size_t v25 = 0LL;
  BOOL v24 = 0;
  if (a4 && a5 && a6 && a13)
  {
    uint64_t v21 = verifyAclConstraintInternal(v20, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, &v24, &v25);
    uint64_t v22 = v25;
    BOOL v23 = v24;
  }

  else
  {
    if (!a13) {
      goto LABEL_10;
    }
    uint64_t v22 = 0LL;
    BOOL v23 = 0LL;
    uint64_t v21 = 4294967293LL;
  }

  (*(void (**)(uint64_t, uint64_t, BOOL, int *))(a13 + 16))(a13, v21, v23, v22);
  uint64_t result = (uint64_t)v25;
  if (v25) {
    uint64_t result = Util_DeallocRequirement(v25);
  }
LABEL_10:
  return result;
}

uint64_t LibCall_ACMContextVerifyAclConstraintForOperation( uint64_t a1, uint64_t a2, _OWORD *a3, const void *a4, uint64_t a5, const void *a6, unsigned int a7, unsigned __int8 a8, _DWORD *a9, unsigned int a10, unsigned int a11, uint64_t a12)
{
  return sub_140D4(a1, a2, 0x20u, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12);
}

uint64_t Util_GetBitCount(uint64_t a1)
{
  uint8x8_t v1 = (uint8x8_t)vcnt_s8((int8x8_t)a1);
  v1.i16[0] = vaddlv_u8(v1);
  return v1.u32[0];
}

char *Util_isNullOrZeroMemory(_BYTE *a1, uint64_t a2)
{
  if (!a1) {
    return (char *)&dword_0 + 1;
  }
  if (*a1) {
    return 0LL;
  }
  return (char *)(memcmp(a1, a1 + 1, a2 - 1) == 0);
}

BOOL Util_isNonNullEqualMemory(void *__s1, size_t __n, void *__s2, uint64_t a4)
{
  if (__n != a4) {
    return 0LL;
  }
  BOOL result = 0LL;
  if (__s1)
  {
    if (__s2) {
      return memcmp(__s1, __s2, __n) == 0;
    }
  }

  return result;
}

char *Util_hexDumpToStrHelper(char *result, unint64_t a2, uint64_t a3, unint64_t a4)
{
  if (!result && a2) {
    sub_15934();
  }
  if (!a3 && a4) {
    sub_1595C();
  }
  if (a2 >= a4) {
    unint64_t v4 = a4;
  }
  else {
    unint64_t v4 = a2;
  }
  if (v4)
  {
    unint64_t v5 = (_BYTE *)(a3 + 1);
    do
    {
      *(v5 - 1) = a0123456789abcd[(unint64_t)*result >> 4];
      char v6 = *result++;
      *unint64_t v5 = a0123456789abcd[v6 & 0xF];
      v5 += 2;
      --v4;
    }

    while (v4);
  }

  return result;
}

uint64_t Util_WriteToBuffer(uint64_t a1, size_t a2, void *a3, void *__src, size_t __n)
{
  if (a3)
  {
    uint64_t v10 = *a3;
    size_t v11 = *a3 + __n;
    if (!__CFADD__(*a3, __n))
    {
      if (a1 && v11 > a2)
      {
        uint64_t v12 = 4294967276LL;
        goto LABEL_19;
      }

      if (!a1 || !__src || !__n) {
        goto LABEL_12;
      }
      if (!__CFADD__(a1, v10))
      {
        memcpy((void *)(a1 + v10), __src, __n);
LABEL_12:
        uint64_t v12 = 0LL;
        *a3 = v11;
        unsigned int v13 = 10;
        goto LABEL_13;
      }
    }

    uint64_t v12 = 4294967291LL;
  }

  else
  {
    uint64_t v12 = 4294967293LL;
  }

LABEL_19:
  unsigned int v13 = 70;
LABEL_13:
  return v12;
}

  if ((_DWORD)v6) {
    BOOL v17 = 70;
  }
  else {
    BOOL v17 = 10;
  }
  if (v17 >= byte_2CE31 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v22 = "ACMLib";
    BOOL v23 = 2080;
    BOOL v24 = "ACMParseAclAndCopyConstraintCharacteristics";
    size_t v25 = 2048;
    BOOL v26 = (int)v6;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }

  return v6;
}

uint64_t Util_ReadFromBuffer(uint64_t a1, size_t a2, void *a3, void *__dst, size_t __n)
{
  uint64_t v10 = 4294967293LL;
  unsigned int v11 = 70;
  if (a1 && a3)
  {
    uint64_t v12 = *a3;
    size_t v13 = *a3 + __n;
    if (!__CFADD__(*a3, __n))
    {
      if (v13 > a2)
      {
        uint64_t v10 = 4294967276LL;
        goto LABEL_17;
      }

      if (!__dst || !__n) {
        goto LABEL_11;
      }
      if (!__CFADD__(a1, v12))
      {
        memcpy(__dst, (const void *)(a1 + v12), __n);
LABEL_11:
        uint64_t v10 = 0LL;
        *a3 = v13;
        unsigned int v11 = 10;
        goto LABEL_12;
      }
    }

    uint64_t v10 = 4294967291LL;
LABEL_17:
    unsigned int v11 = 70;
  }

LABEL_12:
  return v10;
}

unint64_t Util_KeybagLockStateToEnvVar(unsigned int a1)
{
  unint64_t v1 = 0x2010103020201uLL >> (8 * a1);
  if (a1 >= 7) {
    LOBYTE(v1) = 1;
  }
  return v1 & 3;
}

void Util_SafeDeallocParameters(unsigned int *a1, unsigned int a2)
{
  if (a1)
  {
    uint64_t v3 = a2;
    if (a2)
    {
      unint64_t v4 = a1 + 4;
      uint64_t v5 = a2;
      do
      {
        char v6 = (void *)*((void *)v4 - 1);
        if (v6)
        {
          unint64_t v7 = *v4;
          acm_mem_free_info( "<data>",  *((const void **)v4 - 1),  v7,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c",  118,  "Util_SafeDeallocParameters");
          acm_mem_free_data(v6, v7);
        }

        v4 += 6;
        --v5;
      }

      while (v5);
    }

    acm_mem_free_info( "array of ACMParameter",  a1,  24 * v3,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c",  121,  "Util_SafeDeallocParameters");
    acm_mem_free(a1, 24 * v3);
  }

uint64_t Util_DeallocCredential(_DWORD *a1)
{
  if (a1)
  {
    uint64_t v2 = 4294967293LL;
    unsigned int v3 = 70;
    switch(*a1)
    {
      case 1:
        unint64_t v4 = "ACMCredential - ACMCredentialDataPasscodeValidated";
        rsize_t v5 = 60LL;
        char v6 = a1;
        unint64_t v7 = 60LL;
        int v8 = 144;
        goto LABEL_6;
      case 2:
        unint64_t v4 = "ACMCredential - ACMCredentialDataPassphraseEntered";
        rsize_t v5 = 168LL;
        char v6 = a1;
        unint64_t v7 = 168LL;
        int v8 = 136;
        goto LABEL_6;
      case 3:
        unint64_t v4 = "ACMCredential - ACMCredentialDataBiometryMatched";
        rsize_t v5 = 337LL;
        char v6 = a1;
        unint64_t v7 = 337LL;
        int v8 = 140;
        goto LABEL_6;
      case 4:
      case 5:
      case 6:
      case 8:
      case 0xE:
      case 0x10:
      case 0x13:
      case 0x16:
      case 0x17:
        unint64_t v4 = "ACMCredential";
        rsize_t v5 = 32LL;
        char v6 = a1;
        unint64_t v7 = 32LL;
        int v8 = 189;
        goto LABEL_6;
      case 7:
        unint64_t v4 = "ACMCredential - ACMCredentialDataUserOutputDisplayed";
        rsize_t v5 = 88LL;
        char v6 = a1;
        unint64_t v7 = 88LL;
        int v8 = 152;
        goto LABEL_6;
      case 9:
        unint64_t v4 = "ACMCredential - ACMCredentialDataContinuityUnlock";
        rsize_t v5 = 56LL;
        char v6 = a1;
        unint64_t v7 = 56LL;
        int v8 = 156;
        goto LABEL_6;
      case 0xA:
        unint64_t v4 = "ACMCredential - ACMCredentialDataPasscodeValidated2";
        rsize_t v5 = 84LL;
        char v6 = a1;
        unint64_t v7 = 84LL;
        int v8 = 148;
        goto LABEL_6;
      case 0xC:
      case 0xF:
        unint64_t v4 = "ACMCredential - ACMCredentialDataKextDenyList";
        rsize_t v5 = 40LL;
        char v6 = a1;
        unint64_t v7 = 40LL;
        int v8 = 161;
        goto LABEL_6;
      case 0xD:
        unint64_t v4 = "ACMCredential - ACMCredentialDataPassphraseExtractable";
        rsize_t v5 = 164LL;
        char v6 = a1;
        unint64_t v7 = 164LL;
        int v8 = 132;
        goto LABEL_6;
      case 0x11:
        unint64_t v4 = "ACMCredential - ACMCredentialDataSecureIntent";
        rsize_t v5 = 113LL;
        char v6 = a1;
        unint64_t v7 = 113LL;
        int v8 = 165;
        goto LABEL_6;
      case 0x12:
        unint64_t v4 = "ACMCredential - ACMCredentialDataBiometryMatchAttempted";
        rsize_t v5 = 52LL;
        char v6 = a1;
        unint64_t v7 = 52LL;
        int v8 = 169;
        goto LABEL_6;
      case 0x14:
        unint64_t v4 = "ACMCredential - ACMCredentialDataAP";
        rsize_t v5 = 64LL;
        char v6 = a1;
        unint64_t v7 = 64LL;
        int v8 = 173;
        goto LABEL_6;
      case 0x15:
        unint64_t v4 = "ACMCredential - ACMCredentialDataSignature";
        rsize_t v5 = 164LL;
        char v6 = a1;
        unint64_t v7 = 164LL;
        int v8 = 177;
LABEL_6:
        acm_mem_free_info( v4,  v6,  v7,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c",  v8,  "Util_DeallocCredential");
        acm_mem_free(a1, v5);
        uint64_t v2 = 0LL;
        unsigned int v3 = 10;
        break;
      default:
        break;
    }
  }

  else
  {
    uint64_t v2 = 4294967293LL;
    unsigned int v3 = 70;
  }

  return v2;
}

uint64_t Util_AllocCredential(int a1, void *a2)
{
  if (!a2) {
    return 4294967293LL;
  }
  uint64_t result = 4294967293LL;
  switch(a1)
  {
    case 1:
      rsize_t v5 = acm_mem_alloc(0x3CuLL);
      acm_mem_alloc_info( "ACMCredential - ACMCredentialDataPasscodeValidated",  v5,  60LL,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c",  226,  "Util_AllocCredential");
      int v6 = 28;
      goto LABEL_4;
    case 2:
      rsize_t v5 = acm_mem_alloc(0xA8uLL);
      acm_mem_alloc_info( "ACMCredential - ACMCredentialDataPassphraseEntered",  v5,  168LL,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c",  216,  "Util_AllocCredential");
      int v6 = 136;
      goto LABEL_4;
    case 3:
      rsize_t v5 = acm_mem_alloc(0x151uLL);
      acm_mem_alloc_info( "ACMCredential - ACMCredentialDataBiometryMatched",  v5,  337LL,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c",  221,  "Util_AllocCredential");
      int v6 = 305;
      goto LABEL_4;
    case 4:
    case 5:
    case 6:
    case 8:
    case 14:
    case 16:
    case 19:
    case 22:
    case 23:
      rsize_t v5 = acm_mem_alloc(0x20uLL);
      acm_mem_alloc_info( "ACMCredential",  v5,  32LL,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c",  280,  "Util_AllocCredential");
      int v6 = 0;
      goto LABEL_4;
    case 7:
      rsize_t v5 = acm_mem_alloc(0x58uLL);
      acm_mem_alloc_info( "ACMCredential - ACMCredentialDataUserOutputDisplayed",  v5,  88LL,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c",  236,  "Util_AllocCredential");
      int v6 = 56;
      goto LABEL_4;
    case 9:
      rsize_t v5 = acm_mem_alloc(0x38uLL);
      acm_mem_alloc_info( "ACMCredential - ACMCredentialDataContinuityUnlock",  v5,  56LL,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c",  241,  "Util_AllocCredential");
      int v6 = 24;
      goto LABEL_4;
    case 10:
      rsize_t v5 = acm_mem_alloc(0x54uLL);
      acm_mem_alloc_info( "ACMCredential - ACMCredentialDataPasscodeValidated2",  v5,  84LL,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c",  231,  "Util_AllocCredential");
      int v6 = 52;
      goto LABEL_4;
    case 12:
    case 15:
      rsize_t v5 = acm_mem_alloc(0x28uLL);
      acm_mem_alloc_info( "ACMCredential - ACMCredentialDataKextDenyList",  v5,  40LL,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c",  247,  "Util_AllocCredential");
      int v6 = 8;
      goto LABEL_4;
    case 13:
      rsize_t v5 = acm_mem_alloc(0xA4uLL);
      unint64_t v7 = "ACMCredential - ACMCredentialDataPassphraseExtractable";
      int v8 = v5;
      int v9 = 211;
      goto LABEL_18;
    case 17:
      rsize_t v5 = acm_mem_alloc(0x71uLL);
      acm_mem_alloc_info( "ACMCredential - ACMCredentialDataSecureIntent",  v5,  113LL,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c",  252,  "Util_AllocCredential");
      int v6 = 81;
      goto LABEL_4;
    case 18:
      rsize_t v5 = acm_mem_alloc(0x34uLL);
      acm_mem_alloc_info( "ACMCredential - ACMCredentialDataBiometryMatchAttempted",  v5,  52LL,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c",  257,  "Util_AllocCredential");
      int v6 = 20;
      goto LABEL_4;
    case 20:
      rsize_t v5 = acm_mem_alloc(0x40uLL);
      acm_mem_alloc_info( "ACMCredential - ACMCredentialDataAP",  v5,  64LL,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c",  262,  "Util_AllocCredential");
      int v6 = 32;
      goto LABEL_4;
    case 21:
      rsize_t v5 = acm_mem_alloc(0xA4uLL);
      unint64_t v7 = "ACMCredential - ACMCredentialDataSignature";
      int v8 = v5;
      int v9 = 267;
LABEL_18:
      acm_mem_alloc_info( v7,  v8,  164LL,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c",  v9,  "Util_AllocCredential");
      int v6 = 132;
LABEL_4:
      if (v5)
      {
        uint64_t result = 0LL;
        *rsize_t v5 = a1;
        v5[1] = 1;
        v5[7] = v6;
        v5[3] = -1;
        *a2 = v5;
      }

      else
      {
        uint64_t result = 4294967292LL;
      }

      break;
    default:
      return result;
  }

  return result;
}

uint64_t Util_AllocRequirement(int a1, uint64_t a2, void *a3)
{
  if (a3)
  {
    uint64_t v6 = 4294967293LL;
    unsigned int v7 = 70;
    switch(a1)
    {
      case 1:
        int v8 = acm_mem_alloc(0x14uLL);
        unsigned int v11 = "ACMRequirement - ACMRequirementDataPasscodeValidated";
        uint64_t v12 = v8;
        int v13 = 338;
        goto LABEL_49;
      case 2:
        int v8 = acm_mem_alloc(0x14uLL);
        unsigned int v11 = "ACMRequirement - ACMRequirementDataPassphraseEntered";
        uint64_t v12 = v8;
        int v13 = 343;
        goto LABEL_49;
      case 3:
        int v8 = acm_mem_alloc(0xACuLL);
        acm_mem_alloc_info( "ACMRequirement - ACMRequirementDataBiometryMatched",  v8,  172LL,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c",  348,  "Util_AllocRequirement");
        int v9 = 156;
        if (!v8) {
          goto LABEL_50;
        }
        goto LABEL_6;
      case 4:
        int v8 = acm_mem_alloc(0x64uLL);
        uint64_t v14 = "ACMRequirement - ACMRequirementDataOr";
        int v15 = v8;
        int v16 = 406;
        goto LABEL_28;
      case 5:
        int v8 = acm_mem_alloc(0x64uLL);
        uint64_t v14 = "ACMRequirement - ACMRequirementDataAnd";
        int v15 = v8;
        int v16 = 398;
LABEL_28:
        acm_mem_alloc_info( v14,  v15,  100LL,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c",  v16,  "Util_AllocRequirement");
        int v9 = 84;
        if (!v8) {
          goto LABEL_50;
        }
        goto LABEL_6;
      case 6:
      case 9:
      case 10:
      case 11:
      case 12:
      case 14:
      case 15:
      case 18:
      case 19:
      case 22:
      case 23:
      case 27:
      case 28:
        int v8 = acm_mem_alloc(0x10uLL);
        acm_mem_alloc_info( "ACMRequirement",  v8,  16LL,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c",  333,  "Util_AllocRequirement");
        int v9 = 0;
        if (v8) {
          goto LABEL_6;
        }
        goto LABEL_50;
      case 7:
        int v8 = acm_mem_alloc(0x68uLL);
        acm_mem_alloc_info( "ACMRequirement - ACMRequirementDataKofN",  v8,  104LL,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c",  391,  "Util_AllocRequirement");
        int v9 = 88;
        if (!v8) {
          goto LABEL_50;
        }
        goto LABEL_6;
      case 8:
        int v8 = acm_mem_alloc(0x410uLL);
        acm_mem_alloc_info( "ACMRequirement - ACMRequirementDataAccessGroups",  v8,  1040LL,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c",  378,  "Util_AllocRequirement");
        int v9 = 1024;
        if (!v8) {
          goto LABEL_50;
        }
        goto LABEL_6;
      case 13:
        int v8 = acm_mem_alloc(0x30uLL);
        acm_mem_alloc_info( "ACMRequirement - ACMRequirementDataUserOutputDisplayed",  v8,  48LL,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c",  363,  "Util_AllocRequirement");
        int v9 = 32;
        if (!v8) {
          goto LABEL_50;
        }
        goto LABEL_6;
      case 16:
      case 17:
        break;
      case 20:
        int v8 = acm_mem_alloc(0x14uLL);
        unsigned int v11 = "ACMRequirement - ACMRequirementDataSecureIntent";
        uint64_t v12 = v8;
        int v13 = 353;
        goto LABEL_49;
      case 21:
        int v8 = acm_mem_alloc(0x14uLL);
        unsigned int v11 = "ACMRequirement - ACMRequirementDataBiometryMatchAttempted";
        uint64_t v12 = v8;
        int v13 = 358;
LABEL_49:
        acm_mem_alloc_info( v11,  v12,  20LL,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c",  v13,  "Util_AllocRequirement");
        int v9 = 4;
        if (!v8) {
          goto LABEL_50;
        }
        goto LABEL_6;
      case 24:
        int v8 = acm_mem_alloc(0x434uLL);
        acm_mem_alloc_info( "ACMRequirement - ACMRequirementDataAP",  v8,  1076LL,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c",  368,  "Util_AllocRequirement");
        int v9 = 1060;
        if (!v8) {
          goto LABEL_50;
        }
        goto LABEL_6;
      case 25:
        int v8 = acm_mem_alloc(0x3BuLL);
        acm_mem_alloc_info( "ACMRequirement - ACMRequirementDataKeyRef",  v8,  59LL,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c",  373,  "Util_AllocRequirement");
        int v9 = 43;
        if (!v8) {
          goto LABEL_50;
        }
        goto LABEL_6;
      case 26:
        int v8 = acm_mem_alloc(0x2CuLL);
        acm_mem_alloc_info( "ACMRequirement - ACMRequirementDataRatchet",  v8,  44LL,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c",  384,  "Util_AllocRequirement");
        int v9 = 28;
        if (!v8)
        {
LABEL_50:
          uint64_t v6 = 4294967292LL;
          goto LABEL_54;
        }

LABEL_6:
        *int v8 = a1;
        *(void *)(v8 + 1) = 0x100000001LL;
        v8[3] = v9;
        if ((a1 & 0xFFFFFFFE) == 4)
        {
          v8[4] = a2;
        }

        else if (a1 == 1000)
        {
          v8[13] = a2;
        }

        else if (a1 == 7)
        {
          v8[5] = a2;
        }

        uint64_t v6 = 0LL;
        *a3 = v8;
        unsigned int v7 = 10;
        break;
      default:
        switch(a1)
        {
          case 1000:
            int v8 = acm_mem_alloc(0x88uLL);
            acm_mem_alloc_info( "ACMRequirement - ACMRequirementDataKofNWithAttributes",  v8,  136LL,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c",  414,  "Util_AllocRequirement");
            int v9 = 120;
            if (!v8) {
              goto LABEL_50;
            }
            goto LABEL_6;
          case 1001:
            int v8 = acm_mem_alloc(0xB8uLL);
            acm_mem_alloc_info( "ACMRequirement - ACMRequirementDataBiometryMatchedWithAttributes",  v8,  184LL,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c",  419,  "Util_AllocRequirement");
            int v9 = 168;
            if (!v8) {
              goto LABEL_50;
            }
            goto LABEL_6;
          case 1002:
            int v8 = acm_mem_alloc(0x14uLL);
            unsigned int v11 = "ACMRequirement - ACMRequirementDataPushButtonWithAttributes";
            uint64_t v12 = v8;
            int v13 = 424;
            goto LABEL_49;
          case 1003:
            int v8 = acm_mem_alloc(0x14uLL);
            unsigned int v11 = "ACMRequirement - ACMRequirementDataSecureStateWithAttributes";
            uint64_t v12 = v8;
            int v13 = 429;
            goto LABEL_49;
          case 1004:
            int v8 = acm_mem_alloc(0x20uLL);
            acm_mem_alloc_info( "ACMRequirement - ACMRequirementDataPasscodeValidatedWithAttributes",  v8,  32LL,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c",  434,  "Util_AllocRequirement");
            int v9 = 16;
            if (!v8) {
              goto LABEL_50;
            }
            goto LABEL_6;
          default:
            goto LABEL_17;
        }
    }
  }

  else
  {
LABEL_53:
    uint64_t v6 = 4294967293LL;
LABEL_54:
    unsigned int v7 = 70;
  }

LABEL_17:
  return v6;
}

uint64_t Util_CreateRequirement(int a1, uint64_t a2)
{
  uint64_t v5 = 0LL;
  Util_AllocRequirement(a1, a2, &v5);
  return v5;
}

uint64_t Util_DeallocRequirement(int *a1)
{
  if (!a1)
  {
    uint64_t v7 = 4294967293LL;
    unsigned int v8 = 70;
    goto LABEL_28;
  }

  int v2 = *a1;
  if (*a1 > 6)
  {
    if (v2 == 7)
    {
      if (a1[5])
      {
        unint64_t v6 = 0LL;
        do
          Util_DeallocRequirement(*(void *)&a1[2 * v6++ + 6]);
        while (v6 < a1[5]);
      }
    }

    else
    {
      if (v2 != 1000) {
        goto LABEL_25;
      }
      if (a1[13])
      {
        unint64_t v4 = 0LL;
        do
          Util_DeallocRequirement(*(void *)&a1[2 * v4++ + 14]);
        while (v4 < a1[13]);
      }
    }
  }

  else if (v2 == 4)
  {
    if (a1[4])
    {
      unint64_t v5 = 0LL;
      do
        Util_DeallocRequirement(*(void *)&a1[2 * v5++ + 5]);
      while (v5 < a1[4]);
    }
  }

  else
  {
    if (v2 != 5) {
      goto LABEL_25;
    }
    if (a1[4])
    {
      unint64_t v3 = 0LL;
      do
        Util_DeallocRequirement(*(void *)&a1[2 * v3++ + 5]);
      while (v3 < a1[4]);
    }
  }

  int v2 = *a1;
LABEL_25:
  uint64_t v7 = 4294967293LL;
  unsigned int v8 = 70;
  switch(v2)
  {
    case 1:
      int v9 = "ACMRequirement - ACMRequirementDataPasscodeValidated";
      rsize_t v10 = 20LL;
      unsigned int v11 = a1;
      unint64_t v12 = 20LL;
      int v13 = 542;
      goto LABEL_27;
    case 2:
      int v9 = "ACMRequirement - ACMRequirementDataPassphraseEntered";
      rsize_t v10 = 20LL;
      unsigned int v11 = a1;
      unint64_t v12 = 20LL;
      int v13 = 546;
      goto LABEL_27;
    case 3:
      int v9 = "ACMRequirement - ACMRequirementDataBiometryMatched";
      rsize_t v10 = 172LL;
      unsigned int v11 = a1;
      unint64_t v12 = 172LL;
      int v13 = 550;
      goto LABEL_27;
    case 4:
      int v9 = "ACMRequirement - ACMRequirementDataOr";
      rsize_t v10 = 100LL;
      unsigned int v11 = a1;
      unint64_t v12 = 100LL;
      int v13 = 595;
      goto LABEL_27;
    case 5:
      int v9 = "ACMRequirement - ACMRequirementDataAnd";
      rsize_t v10 = 100LL;
      unsigned int v11 = a1;
      unint64_t v12 = 100LL;
      int v13 = 589;
      goto LABEL_27;
    case 6:
    case 9:
    case 10:
    case 11:
    case 12:
    case 14:
    case 15:
    case 18:
    case 19:
    case 22:
    case 23:
    case 27:
    case 28:
      int v9 = "ACMRequirement";
      rsize_t v10 = 16LL;
      unsigned int v11 = a1;
      unint64_t v12 = 16LL;
      int v13 = 538;
      goto LABEL_27;
    case 7:
      int v9 = "ACMRequirement - ACMRequirementDataKofN";
      rsize_t v10 = 104LL;
      unsigned int v11 = a1;
      unint64_t v12 = 104LL;
      int v13 = 584;
      goto LABEL_27;
    case 8:
      int v9 = "ACMRequirement - ACMRequirementDataAccessGroups";
      rsize_t v10 = 1040LL;
      unsigned int v11 = a1;
      unint64_t v12 = 1040LL;
      int v13 = 574;
      goto LABEL_27;
    case 13:
      int v9 = "ACMRequirement - ACMRequirementDataUserOutputDisplayed";
      rsize_t v10 = 48LL;
      unsigned int v11 = a1;
      unint64_t v12 = 48LL;
      int v13 = 562;
      goto LABEL_27;
    case 16:
    case 17:
      break;
    case 20:
      int v9 = "ACMRequirement - ACMRequirementDataSecureIntent";
      rsize_t v10 = 20LL;
      unsigned int v11 = a1;
      unint64_t v12 = 20LL;
      int v13 = 554;
      goto LABEL_27;
    case 21:
      int v9 = "ACMRequirement - ACMRequirementDataBiometryMatchAttempted";
      rsize_t v10 = 20LL;
      unsigned int v11 = a1;
      unint64_t v12 = 20LL;
      int v13 = 558;
      goto LABEL_27;
    case 24:
      int v9 = "ACMRequirement - ACMRequirementDataAP";
      rsize_t v10 = 1076LL;
      unsigned int v11 = a1;
      unint64_t v12 = 1076LL;
      int v13 = 566;
      goto LABEL_27;
    case 25:
      int v9 = "ACMRequirement - ACMRequirementDataKeyRef";
      rsize_t v10 = 59LL;
      unsigned int v11 = a1;
      unint64_t v12 = 59LL;
      int v13 = 570;
      goto LABEL_27;
    case 26:
      int v9 = "ACMRequirement - ACMRequirementDataRatchet";
      rsize_t v10 = 44LL;
      unsigned int v11 = a1;
      unint64_t v12 = 44LL;
      int v13 = 579;
LABEL_27:
      acm_mem_free_info( v9,  v11,  v12,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c",  v13,  "Util_DeallocRequirement");
      acm_mem_free(a1, v10);
      uint64_t v7 = 0LL;
      unsigned int v8 = 10;
      break;
    default:
      switch(v2)
      {
        case 1000:
          int v9 = "ACMRequirement - ACMRequirementDataKofNWithAttributes";
          rsize_t v10 = 136LL;
          unsigned int v11 = a1;
          unint64_t v12 = 136LL;
          int v13 = 601;
          goto LABEL_27;
        case 1001:
          int v9 = "ACMRequirement - ACMRequirementDataBiometryMatchedWithAttributes";
          rsize_t v10 = 184LL;
          unsigned int v11 = a1;
          unint64_t v12 = 184LL;
          int v13 = 605;
          goto LABEL_27;
        case 1002:
          int v9 = "ACMRequirement - ACMRequirementDataPushButtonWithAttributes";
          rsize_t v10 = 20LL;
          unsigned int v11 = a1;
          unint64_t v12 = 20LL;
          int v13 = 609;
          goto LABEL_27;
        case 1003:
          int v9 = "ACMRequirement - ACMRequirementDataSecureStateWithAttributes";
          rsize_t v10 = 20LL;
          unsigned int v11 = a1;
          unint64_t v12 = 20LL;
          int v13 = 613;
          goto LABEL_27;
        case 1004:
          int v9 = "ACMRequirement - ACMRequirementDataPasscodeValidatedWithAttributes";
          rsize_t v10 = 32LL;
          unsigned int v11 = a1;
          unint64_t v12 = 32LL;
          int v13 = 617;
          goto LABEL_27;
        default:
          goto LABEL_28;
      }
  }

LABEL_28:
  return v7;
}

    unint64_t v12 = 0LL;
    if (v14) {
      goto LABEL_29;
    }
LABEL_30:
    uint64_t v14 = 0;
    int v13 = 10;
  }

void sub_15934()
{
}

void sub_1595C()
{
}

uint64_t ACMContextCreate(uint64_t *a1)
{
  if (byte_2CE31 <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    unsigned int v8 = "ACMLib";
    __int16 v9 = 2080;
    rsize_t v10 = "ACMContextCreate";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }

  uint64_t v6 = 0LL;
  uint64_t v2 = LibCall_ACMContextCreate( (uint64_t (*)(uint64_t, uint64_t, void, void, void, _BYTE *, uint64_t *))sub_15BAC,  (uint64_t)&v6,  a1,  &byte_2CE31,  1);
  if ((_DWORD)v2)
  {
    sub_1AAE4();
    unsigned int v3 = 70;
  }

  else
  {
    unsigned int v3 = 10;
    if (a1 && byte_2CE31 <= 0x28u)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        uint64_t v4 = *a1;
        if (*a1) {
          LODWORD(v4) = *(_DWORD *)(v4 + 16);
        }
        *(_DWORD *)buf = 136315650;
        unsigned int v8 = "ACMLib";
        __int16 v9 = 2080;
        rsize_t v10 = "ACMContextCreate";
        __int16 v11 = 1024;
        LODWORD(v12) = v4;
        _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: CS[%u] created.\n", buf, 0x1Cu);
      }

      unsigned int v3 = 10;
    }
  }

  if (v3 >= byte_2CE31 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    unsigned int v8 = "ACMLib";
    __int16 v9 = 2080;
    rsize_t v10 = "ACMContextCreate";
    __int16 v11 = 2048;
    uint64_t v12 = (int)v2;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }

  return v2;
}

uint64_t sub_15BAC(uint64_t *a1, int a2, char a3, const void *a4, size_t a5, void *a6, size_t *a7)
{
  if (byte_2CE31 <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v18 = 136315394;
    uint64_t v19 = "ACMLib";
    __int16 v20 = 2080;
    uint64_t v21 = "ioKitTransport";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v18, 0x16u);
  }

  if (a1)
  {
    uint64_t v14 = sub_1637C();
    unsigned int v15 = 70;
    if ((_DWORD)v14)
    {
      uint64_t v16 = v14;
    }

    else
    {
      uint64_t v16 = sub_1655C(*a1, a2, a3, a4, a5, a6, a7);
      if ((_DWORD)v16) {
        unsigned int v15 = 70;
      }
      else {
        unsigned int v15 = 10;
      }
    }
  }

  else
  {
    unsigned int v15 = 70;
    uint64_t v16 = 4294967293LL;
  }

  if (v15 >= byte_2CE31 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v18 = 136315650;
    uint64_t v19 = "ACMLib";
    __int16 v20 = 2080;
    uint64_t v21 = "ioKitTransport";
    __int16 v22 = 2048;
    uint64_t v23 = (int)v16;
    _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "%s: %s: returning, err = %ld.\n",  (uint8_t *)&v18,  0x20u);
  }

  return v16;
}

_DWORD *ACMContextCreateWithExternalForm(_OWORD *a1, uint64_t a2)
{
  if (byte_2CE31 <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    rsize_t v10 = "ACMLib";
    __int16 v11 = 2080;
    uint64_t v12 = "ACMContextCreateWithExternalForm";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }

  uint64_t v8 = 0LL;
  uint64_t v4 = LibCall_ACMContextCreateWithExternalForm( (uint64_t (*)(uint64_t, uint64_t, void, _OWORD *, uint64_t, void *, uint64_t *))sub_15BAC,  (uint64_t)&v8,  a1,  a2,  &byte_2CE31,  1);
  if (v4)
  {
    if (byte_2CE31 <= 0x28u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      int v5 = v4[4];
      *(_DWORD *)buf = 136315650;
      rsize_t v10 = "ACMLib";
      __int16 v11 = 2080;
      uint64_t v12 = "ACMContextCreateWithExternalForm";
      __int16 v13 = 1024;
      LODWORD(v14) = v5;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: CS[%u] acquired.\n", buf, 0x1Cu);
    }

    unsigned int v6 = 30;
  }

  else
  {
    sub_1AAE4();
    unsigned int v6 = 70;
  }

  if (v6 >= byte_2CE31 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    rsize_t v10 = "ACMLib";
    __int16 v11 = 2080;
    uint64_t v12 = "ACMContextCreateWithExternalForm";
    __int16 v13 = 2048;
    uint64_t v14 = v4;
    _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "%s: %s: returning, -> ctx = %p.\n",  buf,  0x20u);
  }

  return v4;
}

uint64_t ACMContextDelete(_DWORD *a1, int a2)
{
  unsigned int v4 = byte_2CE31;
  if (byte_2CE31 <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v12 = "ACMLib";
    __int16 v13 = 2080;
    uint64_t v14 = "ACMContextDelete";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
    unsigned int v4 = byte_2CE31;
  }

  if (a1 && v4 <= 0x28 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v5 = a1[4];
    unsigned int v6 = "deleted";
    *(_DWORD *)buf = 136315906;
    uint64_t v12 = "ACMLib";
    uint64_t v14 = "ACMContextDelete";
    __int16 v13 = 2080;
    if (a2) {
      unsigned int v6 = "destroyed";
    }
    __int16 v15 = 1024;
    LODWORD(v16[0]) = v5;
    WORD2(v16[0]) = 2080;
    *(void *)((char *)v16 + 6) = v6;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: CS[%u] %s.\n", buf, 0x26u);
  }

  rsize_t v10 = a1;
  uint64_t v7 = LibCall_ACMContextDelete( (void (*)(uint64_t, uint64_t, void, void *, uint64_t, void, void))sub_15BAC,  (uint64_t)&v10,  a1,  a2);
  if ((_DWORD)v7) {
    unsigned int v8 = 70;
  }
  else {
    unsigned int v8 = 10;
  }
  if (v8 >= byte_2CE31 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v12 = "ACMLib";
    __int16 v13 = 2080;
    uint64_t v14 = "ACMContextDelete";
    __int16 v15 = 2048;
    v16[0] = (int)v7;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }

  return v7;
}

void ACMContextGetExternalForm(const void *a1, uint64_t a2)
{
  if (byte_2CE31 <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315394;
    int v5 = "ACMLib";
    __int16 v6 = 2080;
    uint64_t v7 = "ACMContextGetExternalForm";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v4, 0x16u);
  }

  else {
    (*(void (**)(uint64_t, const void *, uint64_t))(a2 + 16))(a2, a1, 16LL);
  }
  if (byte_2CE31 <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315394;
    int v5 = "ACMLib";
    __int16 v6 = 2080;
    uint64_t v7 = "ACMContextGetExternalForm";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: returning.\n", (uint8_t *)&v4, 0x16u);
  }

uint64_t sub_1637C()
{
  if (byte_2CE31 <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315394;
    uint64_t v7 = "ACMLib";
    __int16 v8 = 2080;
    __int16 v9 = "init";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v6, 0x16u);
  }

  if ((byte_2CEBC & 1) != 0)
  {
    uint64_t v0 = 0LL;
  }

  else
  {
    unint64_t v1 = IOServiceMatching("AppleCredentialManager");
    io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v1);
    if (!MatchingService)
    {
      unsigned int v4 = 70;
      uint64_t v0 = 4294967291LL;
      goto LABEL_10;
    }

    io_object_t v3 = MatchingService;
    uint64_t v0 = IOServiceOpen(MatchingService, mach_task_self_, 0, (io_connect_t *)&dword_2CEB8);
    if ((_DWORD)v0)
    {
      unsigned int v4 = 70;
      goto LABEL_10;
    }

    IOObjectRelease(v3);
    byte_2CEBC = 1;
  }

  unsigned int v4 = 10;
LABEL_10:
  if (v4 >= byte_2CE31 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315650;
    uint64_t v7 = "ACMLib";
    __int16 v8 = 2080;
    __int16 v9 = "init";
    __int16 v10 = 2048;
    uint64_t v11 = (int)v0;
    _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "%s: %s: returning, err = %ld.\n",  (uint8_t *)&v6,  0x20u);
  }

  return v0;
}

uint64_t sub_1655C(uint64_t a1, int a2, char a3, const void *a4, size_t a5, void *a6, size_t *a7)
{
  if (byte_2CE31 <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    size_t v25 = "ACMLib";
    __int16 v26 = 2080;
    int v27 = "performCommand";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }

  size_t inputStructCnt = 0LL;
  uint64_t v14 = LibCall_BuildCommand(a2, 0, a3, a4, a5, &inputStructCnt);
  if (v14)
  {
    __int16 v15 = v14;
    if (!a6 && a7)
    {
      uint64_t v18 = 4294967293LL;
    }

    else
    {
      if (a7) {
        size_t v16 = *a7;
      }
      else {
        size_t v16 = 0LL;
      }
      size_t v22 = v16;
      uint64_t v17 = IOConnectCallStructMethod(dword_2CEB8, 0, v14, inputStructCnt, a6, &v22);
      uint64_t v18 = v17;
      if (a1) {
        LODWORD(a1) = *(_DWORD *)(a1 + 16);
      }
      if ((_DWORD)v17)
      {
        if (byte_2CE31 <= 0x46u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136316418;
          size_t v25 = "ACMLib";
          __int16 v26 = 2080;
          int v27 = "performCommand";
          __int16 v28 = 1024;
          *(_DWORD *)unint64_t v29 = a2;
          *(_WORD *)&v29[4] = 1024;
          *(_DWORD *)&v29[6] = a1;
          __int16 v30 = 1024;
          int v31 = v18;
          __int16 v32 = 1024;
          int v33 = v18;
          _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "%s: %s: cmd(%u) on CS[%u] -> err 0x%x (%d).\n",  buf,  0x2Eu);
        }
      }

      else
      {
        if (byte_2CE31 <= 0x28u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315906;
          size_t v25 = "ACMLib";
          __int16 v26 = 2080;
          int v27 = "performCommand";
          __int16 v28 = 1024;
          *(_DWORD *)unint64_t v29 = a2;
          *(_WORD *)&v29[4] = 1024;
          *(_DWORD *)&v29[6] = a1;
          _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "%s: %s: cmd(%u) on CS[%u] -> ok.\n",  buf,  0x22u);
        }

        uint64_t v18 = 0LL;
        if (a7) {
          *a7 = v22;
        }
      }
    }

    size_t v19 = inputStructCnt;
    acm_mem_free_info( "<data>",  v15,  inputStructCnt,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c",  134,  "performCommand");
    acm_mem_free_data(v15, v19);
    if ((_DWORD)v18) {
      unsigned int v20 = 70;
    }
    else {
      unsigned int v20 = 10;
    }
  }

  else
  {
    unsigned int v20 = 70;
    uint64_t v18 = 4294967291LL;
  }

  if (v20 >= byte_2CE31 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    size_t v25 = "ACMLib";
    __int16 v26 = 2080;
    int v27 = "performCommand";
    __int16 v28 = 2048;
    *(void *)unint64_t v29 = (int)v18;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }

  return v18;
}

uint64_t ACMContextAddCredential(_OWORD *a1, unsigned int *a2)
{
  if (byte_2CE31 <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315394;
    int v6 = "ACMLib";
    __int16 v7 = 2080;
    __int16 v8 = "ACMContextAddCredential";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v5, 0x16u);
  }

  return ACMContextAddCredentialWithScope(a1, a2, 1);
}

uint64_t ACMContextAddCredentialWithScope(_OWORD *a1, unsigned int *a2, int a3)
{
  if (byte_2CE31 <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v18 = "ACMLib";
    __int16 v19 = 2080;
    unsigned int v20 = "ACMContextAddCredentialWithScope";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }

  size_t __size = 0LL;
  if (a1) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = a3 == 2;
  }
  char v7 = !v6;
  unsigned int v8 = 70;
  uint64_t v9 = 4294967293LL;
  if (a2 && (v7 & 1) == 0)
  {
    uint64_t SerializedAddCredentialSize = sub_1637C();
    if ((_DWORD)SerializedAddCredentialSize
      || (uint64_t SerializedAddCredentialSize = GetSerializedAddCredentialSize((uint64_t)a1, a2, a3, &__size),
          (_DWORD)SerializedAddCredentialSize))
    {
      uint64_t v9 = SerializedAddCredentialSize;
      unsigned int v8 = 70;
    }

    else
    {
      size_t v11 = __size;
      uint64_t v12 = acm_mem_alloc_data(__size);
      acm_mem_alloc_info( "<data>",  v12,  v11,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c",  325,  "ACMContextAddCredentialWithScope");
      if (v12)
      {
        uint64_t v13 = SerializeAddCredential(a1, a2, a3, (uint64_t)v12, &__size);
        if (!(_DWORD)v13) {
          uint64_t v13 = sub_1655C((uint64_t)a1, 5, 0, v12, __size, 0LL, 0LL);
        }
        uint64_t v9 = v13;
        size_t v14 = __size;
        acm_mem_free_info( "<data>",  v12,  __size,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c",  338,  "ACMContextAddCredentialWithScope");
        acm_mem_free_data(v12, v14);
        if ((_DWORD)v9) {
          unsigned int v8 = 70;
        }
        else {
          unsigned int v8 = 10;
        }
      }

      else
      {
        unsigned int v8 = 70;
        uint64_t v9 = 4294967292LL;
      }
    }
  }

  if (v8 >= byte_2CE31 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v18 = "ACMLib";
    __int16 v19 = 2080;
    unsigned int v20 = "ACMContextAddCredentialWithScope";
    __int16 v21 = 2048;
    uint64_t v22 = (int)v9;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }

  return v9;
}

uint64_t ACMContextRemoveCredentialsByType(_OWORD *a1, int a2)
{
  if (byte_2CE31 <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315394;
    BOOL v6 = "ACMLib";
    __int16 v7 = 2080;
    unsigned int v8 = "ACMContextRemoveCredentialsByType";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v5, 0x16u);
  }

  return ACMContextRemoveCredentialsByTypeAndScope(a1, a2, 1);
}

uint64_t ACMContextRemoveCredentialsByTypeAndScope(_OWORD *a1, int a2, int a3)
{
  if (byte_2CE31 <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315394;
    uint64_t v12 = "ACMLib";
    __int16 v13 = 2080;
    size_t v14 = "ACMContextRemoveCredentialsByTypeAndScope";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v11, 0x16u);
  }

  if (a1 || a3 == 2)
  {
    uint64_t v6 = sub_1637C();
    if ((_DWORD)v6)
    {
      uint64_t v8 = v6;
      unsigned int v9 = 70;
    }

    else
    {
      __int16 v7 = acm_mem_alloc_data(0x18uLL);
      acm_mem_alloc_info( "<data>",  v7,  24LL,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c",  386,  "ACMContextRemoveCredentialsByTypeAndScope");
      if (v7)
      {
        if (a1)
        {
          _OWORD *v7 = *a1;
        }

        else
        {
          *(void *)__int16 v7 = 0LL;
          *((void *)v7 + 1) = 0LL;
        }

        *((_DWORD *)v7 + 4) = a2;
        *((_DWORD *)v7 + 5) = a3;
        uint64_t v8 = sub_1655C((uint64_t)a1, 9, 0, v7, 0x18uLL, 0LL, 0LL);
        acm_mem_free_info( "<data>",  v7,  0x18uLL,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c",  407,  "ACMContextRemoveCredentialsByTypeAndScope");
        acm_mem_free_data(v7, 0x18uLL);
        if ((_DWORD)v8) {
          unsigned int v9 = 70;
        }
        else {
          unsigned int v9 = 10;
        }
      }

      else
      {
        unsigned int v9 = 70;
        uint64_t v8 = 4294967292LL;
      }
    }
  }

  else
  {
    unsigned int v9 = 70;
    uint64_t v8 = 4294967293LL;
  }

  if (v9 >= byte_2CE31 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315650;
    uint64_t v12 = "ACMLib";
    __int16 v13 = 2080;
    size_t v14 = "ACMContextRemoveCredentialsByTypeAndScope";
    __int16 v15 = 2048;
    uint64_t v16 = (int)v8;
    _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "%s: %s: returning, err = %ld.\n",  (uint8_t *)&v11,  0x20u);
  }

  return v8;
}

uint64_t ACMContextRemoveCredentialsByValue(uint64_t a1, _DWORD *a2)
{
  if (byte_2CE31 <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315394;
    uint64_t v6 = "ACMLib";
    __int16 v7 = 2080;
    uint64_t v8 = "ACMContextRemoveCredentialsByValue";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v5, 0x16u);
  }

  return ACMContextRemoveCredentialsByValueAndScope(a1, a2, 1LL);
}

uint64_t ACMContextRemoveCredentialsByValueAndScope(uint64_t a1, _DWORD *a2, uint64_t a3)
{
  if (byte_2CE31 <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v18 = "ACMLib";
    __int16 v19 = 2080;
    unsigned int v20 = "ACMContextRemoveCredentialsByValueAndScope";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }

  size_t __size = 0LL;
  if (a1) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = (_DWORD)a3 == 2;
  }
  char v7 = !v6;
  unsigned int v8 = 70;
  uint64_t v9 = 4294967293LL;
  if (a2 && (v7 & 1) == 0)
  {
    uint64_t v10 = sub_1637C();
    if ((_DWORD)v10 || (uint64_t v10 = GetSerializedRemoveCredentialSize(a1, a2, a3, &__size), (_DWORD)v10))
    {
      uint64_t v9 = v10;
      unsigned int v8 = 70;
    }

    else
    {
      size_t v11 = __size;
      uint64_t v12 = acm_mem_alloc_data(__size);
      acm_mem_alloc_info( "<data>",  v12,  v11,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c",  457,  "ACMContextRemoveCredentialsByValueAndScope");
      if (v12)
      {
        uint64_t v13 = SerializeRemoveCredential(a1, a2, a3, v12, &__size);
        if (!(_DWORD)v13) {
          uint64_t v13 = sub_1655C(a1, 6, 0, v12, __size, 0LL, 0LL);
        }
        uint64_t v9 = v13;
        size_t v14 = __size;
        acm_mem_free_info( "<data>",  v12,  __size,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c",  470,  "ACMContextRemoveCredentialsByValueAndScope");
        acm_mem_free_data(v12, v14);
        if ((_DWORD)v9) {
          unsigned int v8 = 70;
        }
        else {
          unsigned int v8 = 10;
        }
      }

      else
      {
        unsigned int v8 = 70;
        uint64_t v9 = 4294967292LL;
      }
    }
  }

  if (v8 >= byte_2CE31 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v18 = "ACMLib";
    __int16 v19 = 2080;
    unsigned int v20 = "ACMContextRemoveCredentialsByValueAndScope";
    __int16 v21 = 2048;
    uint64_t v22 = (int)v9;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }

  return v9;
}

uint64_t ACMContextContainsCredentialType(_OWORD *a1, int a2)
{
  if (byte_2CE31 <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315394;
    BOOL v6 = "ACMLib";
    __int16 v7 = 2080;
    unsigned int v8 = "ACMContextContainsCredentialType";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v5, 0x16u);
  }

  return ACMContextContainsCredentialTypeEx(a1, a2, 0);
}

uint64_t ACMContextContainsCredentialTypeEx(_OWORD *a1, int a2, int a3)
{
  if (byte_2CE31 <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v16 = "ACMLib";
    __int16 v17 = 2080;
    uint64_t v18 = "ACMContextContainsCredentialTypeEx";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }

  int v14 = 0;
  size_t v13 = 4LL;
  if (a1)
  {
    uint64_t v6 = sub_1637C();
    if ((_DWORD)v6)
    {
      uint64_t v11 = v6;
      unsigned int v8 = 70;
    }

    else
    {
      __int16 v7 = acm_mem_alloc_data(0x18uLL);
      acm_mem_alloc_info( "<data>",  v7,  24LL,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c",  576,  "ACMContextContainsCredentialTypeEx");
      unsigned int v8 = 70;
      if (v7)
      {
        *(_OWORD *)__int16 v7 = *a1;
        v7[4] = a2;
        v7[5] = a3;
        unsigned int v9 = sub_1655C((uint64_t)a1, 4, 0, v7, 0x18uLL, &v14, &v13);
        if (v14) {
          unsigned int v10 = 0;
        }
        else {
          unsigned int v10 = -7;
        }
        if (v9) {
          uint64_t v11 = v9;
        }
        else {
          uint64_t v11 = v10;
        }
        acm_mem_free_info( "<data>",  v7,  0x18uLL,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c",  590,  "ACMContextContainsCredentialTypeEx");
        acm_mem_free_data(v7, 0x18uLL);
        if ((_DWORD)v11) {
          unsigned int v8 = 70;
        }
        else {
          unsigned int v8 = 10;
        }
      }

      else
      {
        uint64_t v11 = 4294967292LL;
      }
    }
  }

  else
  {
    unsigned int v8 = 70;
    uint64_t v11 = 4294967293LL;
  }

  if (v8 >= byte_2CE31 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v16 = "ACMLib";
    __int16 v17 = 2080;
    uint64_t v18 = "ACMContextContainsCredentialTypeEx";
    __int16 v19 = 2048;
    uint64_t v20 = (int)v11;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }

  return v11;
}

uint64_t ACMGlobalContextAddCredential(unsigned int *a1)
{
  if (byte_2CE31 <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    unsigned int v8 = "ACMLib";
    __int16 v9 = 2080;
    unsigned int v10 = "ACMGlobalContextAddCredential";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }

  uint64_t v6 = 0LL;
  if (a1)
  {
    uint64_t v2 = ACMContextCreate((uint64_t *)&v6);
    if (!(_DWORD)v2) {
      uint64_t v2 = ACMContextAddCredentialWithScope(v6, a1, 2);
    }
    uint64_t v3 = v2;
    if (v6) {
      ACMContextDelete(v6, 1);
    }
    if ((_DWORD)v3) {
      unsigned int v4 = 70;
    }
    else {
      unsigned int v4 = 10;
    }
  }

  else
  {
    unsigned int v4 = 70;
    uint64_t v3 = 4294967293LL;
  }

  if (v4 >= byte_2CE31 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    unsigned int v8 = "ACMLib";
    __int16 v9 = 2080;
    unsigned int v10 = "ACMGlobalContextAddCredential";
    __int16 v11 = 2048;
    uint64_t v12 = (int)v3;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }

  return v3;
}

uint64_t ACMGlobalContextRemoveCredentialsByType(int a1)
{
  if (byte_2CE31 <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    unsigned int v8 = "ACMLib";
    __int16 v9 = 2080;
    unsigned int v10 = "ACMGlobalContextRemoveCredentialsByType";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }

  uint64_t v6 = 0LL;
  uint64_t v2 = ACMContextCreate((uint64_t *)&v6);
  if (!(_DWORD)v2) {
    uint64_t v2 = ACMContextRemoveCredentialsByTypeAndScope(v6, a1, 2);
  }
  uint64_t v3 = v2;
  if (v6) {
    ACMContextDelete(v6, 1);
  }
  if ((_DWORD)v3) {
    unsigned int v4 = 70;
  }
  else {
    unsigned int v4 = 10;
  }
  if (v4 >= byte_2CE31 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    unsigned int v8 = "ACMLib";
    __int16 v9 = 2080;
    unsigned int v10 = "ACMGlobalContextRemoveCredentialsByType";
    __int16 v11 = 2048;
    uint64_t v12 = (int)v3;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }

  return v3;
}

uint64_t ACMContextRemovePassphraseCredentialsByPurposeAndScope(_OWORD *a1, int a2, int a3)
{
  if (byte_2CE31 <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315394;
    uint64_t v12 = "ACMLib";
    __int16 v13 = 2080;
    int v14 = "ACMContextRemovePassphraseCredentialsByPurposeAndScope";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v11, 0x16u);
  }

  if (a1 || a3 == 2)
  {
    uint64_t v6 = sub_1637C();
    if ((_DWORD)v6)
    {
      uint64_t v8 = v6;
      unsigned int v9 = 70;
    }

    else
    {
      __int16 v7 = acm_mem_alloc_data(0x18uLL);
      acm_mem_alloc_info( "<data>",  v7,  24LL,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c",  492,  "ACMContextRemovePassphraseCredentialsByPurposeAndScope");
      if (v7)
      {
        if (a1)
        {
          _OWORD *v7 = *a1;
        }

        else
        {
          *(void *)__int16 v7 = 0LL;
          *((void *)v7 + 1) = 0LL;
        }

        *((_DWORD *)v7 + 4) = a2;
        *((_DWORD *)v7 + 5) = a3;
        uint64_t v8 = sub_1655C((uint64_t)a1, 16, 0, v7, 0x18uLL, 0LL, 0LL);
        acm_mem_free_info( "<data>",  v7,  0x18uLL,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c",  513,  "ACMContextRemovePassphraseCredentialsByPurposeAndScope");
        acm_mem_free_data(v7, 0x18uLL);
        if ((_DWORD)v8) {
          unsigned int v9 = 70;
        }
        else {
          unsigned int v9 = 10;
        }
      }

      else
      {
        unsigned int v9 = 70;
        uint64_t v8 = 4294967292LL;
      }
    }
  }

  else
  {
    unsigned int v9 = 70;
    uint64_t v8 = 4294967293LL;
  }

  if (v9 >= byte_2CE31 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315650;
    uint64_t v12 = "ACMLib";
    __int16 v13 = 2080;
    int v14 = "ACMContextRemovePassphraseCredentialsByPurposeAndScope";
    __int16 v15 = 2048;
    uint64_t v16 = (int)v8;
    _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "%s: %s: returning, err = %ld.\n",  (uint8_t *)&v11,  0x20u);
  }

  return v8;
}

uint64_t ACMContextReplacePassphraseCredentialsWithScope(uint64_t a1, _DWORD *a2, uint64_t a3)
{
  if (byte_2CE31 <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v18 = "ACMLib";
    __int16 v19 = 2080;
    uint64_t v20 = "ACMContextReplacePassphraseCredentialsWithScope";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }

  size_t __size = 0LL;
  if (a1) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = (_DWORD)a3 == 2;
  }
  char v7 = !v6;
  unsigned int v8 = 70;
  uint64_t v9 = 4294967293LL;
  if (a2 && (v7 & 1) == 0)
  {
    uint64_t SerializedReplacePassphraseCredentialSize = sub_1637C();
    if ((_DWORD)SerializedReplacePassphraseCredentialSize
      || (uint64_t SerializedReplacePassphraseCredentialSize = GetSerializedReplacePassphraseCredentialSize(a1, a2, a3, &__size),
          (_DWORD)SerializedReplacePassphraseCredentialSize))
    {
      uint64_t v9 = SerializedReplacePassphraseCredentialSize;
      unsigned int v8 = 70;
    }

    else
    {
      size_t v11 = __size;
      uint64_t v12 = acm_mem_alloc_data(__size);
      acm_mem_alloc_info( "<data>",  v12,  v11,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c",  538,  "ACMContextReplacePassphraseCredentialsWithScope");
      if (v12)
      {
        uint64_t v13 = SerializeReplacePassphraseCredential(a1, a2, a3, v12, &__size);
        if (!(_DWORD)v13) {
          uint64_t v13 = sub_1655C(a1, 15, 0, v12, __size, 0LL, 0LL);
        }
        uint64_t v9 = v13;
        bzero(v12, __size);
        size_t v14 = __size;
        acm_mem_free_info( "<data>",  v12,  __size,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c",  552,  "ACMContextReplacePassphraseCredentialsWithScope");
        acm_mem_free_data(v12, v14);
        if ((_DWORD)v9) {
          unsigned int v8 = 70;
        }
        else {
          unsigned int v8 = 10;
        }
      }

      else
      {
        unsigned int v8 = 70;
        uint64_t v9 = 4294967292LL;
      }
    }
  }

  if (v8 >= byte_2CE31 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v18 = "ACMLib";
    __int16 v19 = 2080;
    uint64_t v20 = "ACMContextReplacePassphraseCredentialsWithScope";
    __int16 v21 = 2048;
    uint64_t v22 = (int)v9;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }

  return v9;
}

uint64_t ACMContextContainsPassphraseCredentialWithPurpose(_OWORD *a1, int a2, int a3)
{
  if (byte_2CE31 <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v16 = "ACMLib";
    __int16 v17 = 2080;
    uint64_t v18 = "ACMContextContainsPassphraseCredentialWithPurpose";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }

  int v14 = 0;
  size_t v13 = 4LL;
  if (a1)
  {
    uint64_t v6 = sub_1637C();
    if ((_DWORD)v6)
    {
      uint64_t v11 = v6;
      unsigned int v8 = 70;
    }

    else
    {
      char v7 = acm_mem_alloc_data(0x18uLL);
      acm_mem_alloc_info( "<data>",  v7,  24LL,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c",  614,  "ACMContextContainsPassphraseCredentialWithPurpose");
      unsigned int v8 = 70;
      if (v7)
      {
        *(_OWORD *)char v7 = *a1;
        v7[4] = a2;
        v7[5] = a3;
        unsigned int v9 = sub_1655C((uint64_t)a1, 13, 0, v7, 0x18uLL, &v14, &v13);
        if (v14) {
          unsigned int v10 = 0;
        }
        else {
          unsigned int v10 = -7;
        }
        if (v9) {
          uint64_t v11 = v9;
        }
        else {
          uint64_t v11 = v10;
        }
        acm_mem_free_info( "<data>",  v7,  0x18uLL,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c",  628,  "ACMContextContainsPassphraseCredentialWithPurpose");
        acm_mem_free_data(v7, 0x18uLL);
        if ((_DWORD)v11) {
          unsigned int v8 = 70;
        }
        else {
          unsigned int v8 = 10;
        }
      }

      else
      {
        uint64_t v11 = 4294967292LL;
      }
    }
  }

  else
  {
    unsigned int v8 = 70;
    uint64_t v11 = 4294967293LL;
  }

  if (v8 >= byte_2CE31 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v16 = "ACMLib";
    __int16 v17 = 2080;
    uint64_t v18 = "ACMContextContainsPassphraseCredentialWithPurpose";
    __int16 v19 = 2048;
    uint64_t v20 = (int)v11;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }

  return v11;
}

uint64_t ACMContextVerifyPolicy(_OWORD *a1, char *a2, uint64_t a3)
{
  if (byte_2CE31 <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v11 = "ACMLib";
    __int16 v12 = 2080;
    size_t v13 = "ACMContextVerifyPolicy";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }

  unsigned int v9 = a1;
  uint64_t v6 = LibCall_ACMContextVerifyPolicy_Block( (uint64_t (*)(uint64_t, uint64_t, void, _OWORD *, size_t, unsigned int *, unint64_t *))sub_15BAC,  (uint64_t)&v9,  a1,  a2,  a3);
  if ((_DWORD)v6) {
    unsigned int v7 = 70;
  }
  else {
    unsigned int v7 = 10;
  }
  if (v7 >= byte_2CE31 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v11 = "ACMLib";
    __int16 v12 = 2080;
    size_t v13 = "ACMContextVerifyPolicy";
    __int16 v14 = 2048;
    uint64_t v15 = (int)v6;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }

  return v6;
}

uint64_t ACMContextVerifyPolicyWithPreflight(_OWORD *a1, char *__s1, uint64_t a3, uint64_t a4)
{
  if (byte_2CE31 <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    size_t v13 = "ACMLib";
    __int16 v14 = 2080;
    uint64_t v15 = "ACMContextVerifyPolicyWithPreflight";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }

  uint64_t v11 = a1;
  uint64_t v8 = LibCall_ACMContextVerifyPolicyWithPreflight_Block( (uint64_t (*)(uint64_t, uint64_t, void, _OWORD *, size_t, unsigned int *, unint64_t *))sub_15BAC,  (uint64_t)&v11,  a1,  __s1,  a3,  a4);
  if ((_DWORD)v8) {
    unsigned int v9 = 70;
  }
  else {
    unsigned int v9 = 10;
  }
  if (v9 >= byte_2CE31 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    size_t v13 = "ACMLib";
    __int16 v14 = 2080;
    uint64_t v15 = "ACMContextVerifyPolicyWithPreflight";
    __int16 v16 = 2048;
    uint64_t v17 = (int)v8;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }

  return v8;
}

void ACMContextVerifyPolicyEx( _OWORD *a1, char *__s1, uint64_t a3, _DWORD *a4, unsigned int a5, uint64_t a6, uint64_t a7)
{
  if (byte_2CE31 <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v16 = "ACMLib";
    __int16 v17 = 2080;
    uint64_t v18 = "ACMContextVerifyPolicyEx";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }

  __int16 v14 = a1;
  LibCall_ACMContextVerifyPolicyEx_Block( (uint64_t (*)(uint64_t, uint64_t, void, _OWORD *, size_t, unsigned int *, unint64_t *))sub_15BAC,  (uint64_t)&v14,  a1,  __s1,  a3,  a4,  a5,  a6,  a7);
  if (byte_2CE31 <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v16 = "ACMLib";
    __int16 v17 = 2080;
    uint64_t v18 = "ACMContextVerifyPolicyEx";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: returning.\n", buf, 0x16u);
  }

void ACMGlobalContextVerifyPolicy(char *a1, uint64_t a2, _DWORD *a3, unsigned int a4, uint64_t a5)
{
  if (byte_2CE31 <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    size_t v13 = "ACMLib";
    __int16 v14 = 2080;
    uint64_t v15 = "ACMGlobalContextVerifyPolicy";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }

  *(void *)uint64_t v11 = 0LL;
  uint64_t v10 = ACMContextCreate((uint64_t *)v11);
  if ((_DWORD)v10)
  {
    if (a5) {
      (*(void (**)(uint64_t, uint64_t, void, void))(a5 + 16))(a5, v10, 0LL, 0LL);
    }
  }

  else
  {
    ACMContextVerifyPolicyEx(*(_OWORD **)v11, a1, a2, a3, a4, 0xFFFFFFFFLL, a5);
  }

  if (*(void *)v11) {
    ACMContextDelete(*(_DWORD **)v11, 1);
  }
  if (byte_2CE31 <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    size_t v13 = "ACMLib";
    __int16 v14 = 2080;
    uint64_t v15 = "ACMGlobalContextVerifyPolicy";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: returning.\n", buf, 0x16u);
  }

uint64_t ACMContextVerifyAclConstraint( _OWORD *a1, const void *a2, uint64_t a3, unsigned __int8 a4, _DWORD *a5, unsigned int a6, unsigned int a7, uint64_t a8)
{
  unsigned int v9 = a1;
  return LibCall_ACMContextVerifyAclConstraint((uint64_t)sub_15BAC, (uint64_t)&v9, a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t ACMContextVerifyAclConstraintForOperation( _OWORD *a1, const void *a2, uint64_t a3, const void *a4, unsigned int a5, unsigned __int8 a6, _DWORD *a7, unsigned int a8, unsigned int a9, uint64_t a10)
{
  uint64_t v11 = a1;
  return LibCall_ACMContextVerifyAclConstraintForOperation( (uint64_t)sub_15BAC,  (uint64_t)&v11,  a1,  a2,  a3,  a4,  a5,  a6,  a7,  a8,  a9,  a10);
}

uint64_t ACMContextGetTrackingNumber(uint64_t result)
{
  if (result) {
    return *(unsigned int *)(result + 16);
  }
  return result;
}

uint64_t ACMParseAclAndCopyConstraintCharacteristics(const void *a1, uint64_t a2, uint64_t a3)
{
  size_t __n = 4096LL;
  size_t __size = 0LL;
  if (byte_2CE31 <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v22 = "ACMLib";
    __int16 v23 = 2080;
    BOOL v24 = "ACMParseAclAndCopyConstraintCharacteristics";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }

  uint64_t v6 = 4294967293LL;
  if (!a1 || !a2 || !a3) {
    goto LABEL_28;
  }
  uint64_t SerializedProcessAclSize = sub_1637C();
  if ((_DWORD)SerializedProcessAclSize
    || (uint64_t SerializedProcessAclSize = GetSerializedProcessAclSize(0LL, (uint64_t)a1, a2, 0LL, 0, 0LL, 0LL, 0, &__size),
        (_DWORD)SerializedProcessAclSize))
  {
    uint64_t v6 = SerializedProcessAclSize;
LABEL_28:
    (*(void (**)(uint64_t, uint64_t, void, uint64_t))(a3 + 16))(a3, v6, 0LL, 4096LL);
    goto LABEL_19;
  }

  size_t v8 = __size;
  unsigned int v9 = acm_mem_alloc_data(__size);
  acm_mem_alloc_info( "<data>",  v9,  v8,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c",  744,  "ACMParseAclAndCopyConstraintCharacteristics");
  if (!v9)
  {
    uint64_t v6 = 4294967292LL;
    goto LABEL_28;
  }

  uint64_t v10 = SerializeProcessAcl(0LL, a1, a2, 0LL, 0, 0LL, 0LL, 0, (uint64_t)v9, &__size);
  if ((_DWORD)v10)
  {
    uint64_t v6 = v10;
    __int16 v12 = 0LL;
    __int16 v14 = 0LL;
    size_t v11 = 4096LL;
    goto LABEL_15;
  }

  size_t v11 = 4096LL;
  __int16 v12 = acm_mem_alloc_data(0x1000uLL);
  acm_mem_alloc_info( "<data>",  v12,  4096LL,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c",  750,  "ACMParseAclAndCopyConstraintCharacteristics");
  if (!v12)
  {
    __int16 v14 = 0LL;
LABEL_31:
    uint64_t v6 = 4294967292LL;
    goto LABEL_15;
  }

  uint64_t v13 = sub_1655C(0LL, 20, 0, v9, __size, v12, &__n);
  size_t v11 = __n;
  if ((_DWORD)v13)
  {
    uint64_t v6 = v13;
    __int16 v14 = 0LL;
    goto LABEL_15;
  }

  __int16 v14 = acm_mem_alloc_data(__n);
  acm_mem_alloc_info( "<data>",  v14,  v11,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c",  756,  "ACMParseAclAndCopyConstraintCharacteristics");
  size_t v11 = __n;
  if (!v14) {
    goto LABEL_31;
  }
  memcpy(v14, v12, __n);
  uint64_t v6 = 0LL;
  size_t v11 = __n;
LABEL_15:
  (*(void (**)(uint64_t, uint64_t, void *, size_t))(a3 + 16))(a3, v6, v14, v11);
  size_t v15 = __size;
  acm_mem_free_info( "<data>",  v9,  __size,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c",  767,  "ACMParseAclAndCopyConstraintCharacteristics");
  acm_mem_free_data(v9, v15);
  if (v12)
  {
    acm_mem_free_info( "<data>",  v12,  0x1000uLL,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c",  770,  "ACMParseAclAndCopyConstraintCharacteristics");
    acm_mem_free_data(v12, 0x1000uLL);
  }

  if (v14)
  {
    size_t v16 = __n;
    acm_mem_free_info( "<data>",  v14,  __n,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c",  773,  "ACMParseAclAndCopyConstraintCharacteristics");
    acm_mem_free_data(v14, v16);
  }

uint64_t ACMCredentialGetProperty(int *a1, int a2, uint64_t a3)
{
  if (byte_2CE31 <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v12 = "ACMLib";
    __int16 v13 = 2080;
    __int16 v14 = "ACMCredentialGetProperty";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }

  uint64_t v9 = 0LL;
  uint64_t v10 = 0LL;
  unsigned int v6 = 70;
  uint64_t v7 = 4294967293LL;
  if (a1 && a3)
  {
    uint64_t v7 = LibCall_ACMCredentialGetPropertyData(a1, a2, &v10, &v9);
    if ((_DWORD)v7)
    {
      unsigned int v6 = 70;
    }

    else
    {
      (*(void (**)(uint64_t, int *, uint64_t))(a3 + 16))(a3, v10, v9);
      unsigned int v6 = 10;
    }
  }

  if (v6 >= byte_2CE31 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v12 = "ACMLib";
    __int16 v13 = 2080;
    __int16 v14 = "ACMCredentialGetProperty";
    __int16 v15 = 2048;
    uint64_t v16 = (int)v7;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }

  return v7;
}

void ACMRequirementGetSubrequirements(int *a1, uint64_t a2)
{
  if (byte_2CE31 <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315394;
    uint64_t v9 = "ACMLib";
    __int16 v10 = 2080;
    size_t v11 = "ACMRequirementGetSubrequirements";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v8, 0x16u);
  }

  if (a1 && a2)
  {
    int v4 = *a1;
    if (*a1 == 4)
    {
      if (a1[4])
      {
        unint64_t v6 = 0LL;
        do
          (*(void (**)(uint64_t, void))(a2 + 16))(a2, *(void *)&a1[2 * v6++ + 5]);
        while (v6 < a1[4]);
      }
    }

    else if (v4 == 5)
    {
      if (a1[4])
      {
        unint64_t v7 = 0LL;
        do
          (*(void (**)(uint64_t, void))(a2 + 16))(a2, *(void *)&a1[2 * v7++ + 5]);
        while (v7 < a1[4]);
      }
    }

    else if (v4 == 7 && a1[5])
    {
      unint64_t v5 = 0LL;
      do
        (*(void (**)(uint64_t, void))(a2 + 16))(a2, *(void *)&a1[2 * v5++ + 6]);
      while (v5 < a1[5]);
    }
  }

  if (byte_2CE31 <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315394;
    uint64_t v9 = "ACMLib";
    __int16 v10 = 2080;
    size_t v11 = "ACMRequirementGetSubrequirements";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: returning.\n", (uint8_t *)&v8, 0x16u);
  }

uint64_t ACMRequirementGetProperty(int *a1, int a2, uint64_t a3)
{
  if (byte_2CE31 <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v12 = "ACMLib";
    __int16 v13 = 2080;
    __int16 v14 = "ACMRequirementGetProperty";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }

  unint64_t v9 = 0LL;
  __int16 v10 = 0LL;
  unsigned int v6 = 70;
  uint64_t v7 = 4294967293LL;
  if (a1 && a3)
  {
    uint64_t v7 = LibCall_ACMRequirementGetPropertyData(a1, a2, &v10, &v9);
    if ((_DWORD)v7)
    {
      unsigned int v6 = 70;
    }

    else
    {
      (*(void (**)(uint64_t, int *, unint64_t))(a3 + 16))(a3, v10, v9);
      unsigned int v6 = 10;
    }
  }

  if (v6 >= byte_2CE31 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v12 = "ACMLib";
    __int16 v13 = 2080;
    __int16 v14 = "ACMRequirementGetProperty";
    __int16 v15 = 2048;
    uint64_t v16 = (int)v7;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }

  return v7;
}

uint64_t ACMRequirementGetProperties(int *a1, uint64_t a2)
{
  if (byte_2CE31 <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315394;
    unint64_t v9 = "ACMLib";
    __int16 v10 = 2080;
    size_t v11 = "ACMRequirementGetProperties";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v8, 0x16u);
  }

  uint64_t v4 = 4294967293LL;
  unsigned int v5 = 70;
  if (a1 && a2)
  {
    (*(void (**)(uint64_t, uint64_t, int *, uint64_t))(a2 + 16))(a2, 1LL, a1, 4LL);
    (*(void (**)(uint64_t, uint64_t, int *, uint64_t))(a2 + 16))(a2, 2LL, a1 + 1, 4LL);
    (*(void (**)(uint64_t, uint64_t, int *, uint64_t))(a2 + 16))(a2, 3LL, a1 + 2, 4LL);
    uint64_t v4 = 0LL;
    int v6 = *a1;
    unsigned int v5 = 10;
    switch(*a1)
    {
      case 1:
        goto LABEL_10;
      case 2:
        (*(void (**)(uint64_t, uint64_t, int *, uint64_t))(a2 + 16))(a2, 200LL, a1 + 4, 4LL);
        goto LABEL_13;
      case 3:
        (*(void (**)(uint64_t, uint64_t, int *, uint64_t))(a2 + 16))(a2, 100LL, a1 + 4, 4LL);
        (*(void (**)(uint64_t, uint64_t, int *, uint64_t))(a2 + 16))(a2, 300LL, a1 + 5, 8LL);
        (*(void (**)(uint64_t, uint64_t, int *, uint64_t))(a2 + 16))(a2, 302LL, a1 + 9, 8LL);
        (*(void (**)(uint64_t, uint64_t, int *, uint64_t))(a2 + 16))(a2, 301LL, a1 + 13, 8LL);
        goto LABEL_13;
      case 4:
      case 5:
      case 6:
        break;
      case 7:
        (*(void (**)(uint64_t, uint64_t, int *, uint64_t))(a2 + 16))(a2, 700LL, a1 + 4, 4LL);
        goto LABEL_13;
      default:
        if (v6 != 20 && v6 != 21) {
          break;
        }
LABEL_10:
        (*(void (**)(uint64_t, uint64_t, int *, uint64_t))(a2 + 16))(a2, 100LL, a1 + 4, 4LL);
LABEL_13:
        uint64_t v4 = 0LL;
        unsigned int v5 = 10;
        break;
    }
  }

  if (v5 >= byte_2CE31 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315650;
    unint64_t v9 = "ACMLib";
    __int16 v10 = 2080;
    size_t v11 = "ACMRequirementGetProperties";
    __int16 v12 = 2048;
    uint64_t v13 = (int)v4;
    _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "%s: %s: returning, err = %ld.\n",  (uint8_t *)&v8,  0x20u);
  }

  return v4;
}

void ACMGetAclAuthMethod(__n128 *a1, uint64_t a2)
{
  if (byte_2CE31 <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    int v6 = "ACMLib";
    __int16 v7 = 2080;
    int v8 = "ACMGetAclAuthMethod";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }

  uint64_t v4 = a1;
  LibCall_ACMGetAclAuthMethod_Block((uint64_t)sub_15BAC, (uint64_t)&v4, a1, a2);
  if (byte_2CE31 <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    int v6 = "ACMLib";
    __int16 v7 = 2080;
    int v8 = "ACMGetAclAuthMethod";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: returning.\n", buf, 0x16u);
  }

uint64_t ACMSetEnvironmentVariable(int a1, const void *a2, size_t a3)
{
  if (byte_2CE31 <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    size_t v11 = "ACMLib";
    __int16 v12 = 2080;
    uint64_t v13 = "ACMSetEnvironmentVariable";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }

  uint64_t v9 = 0LL;
  uint64_t v6 = LibCall_ACMSetEnvironmentVariable( (uint64_t (*)(uint64_t, uint64_t, void, char *, size_t, void, void))sub_15BAC,  (uint64_t)&v9,  a1,  0LL,  0LL,  0LL,  a2,  a3);
  if ((_DWORD)v6) {
    unsigned int v7 = 70;
  }
  else {
    unsigned int v7 = 10;
  }
  if (v7 >= byte_2CE31 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    size_t v11 = "ACMLib";
    __int16 v12 = 2080;
    uint64_t v13 = "ACMSetEnvironmentVariable";
    __int16 v14 = 2048;
    uint64_t v15 = (int)v6;
    __int16 v16 = 1024;
    int v17 = a1;
    _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "%s: %s: returning, err = %ld, var=%u.\n",  buf,  0x26u);
  }

  return v6;
}

uint64_t ACMSetEnvironmentVariableWithAccessPolicy( int a1, _OWORD *a2, _OWORD *a3, uint64_t a4, const void *a5, size_t a6)
{
  if (byte_2CE31 <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    int v17 = "ACMLib";
    __int16 v18 = 2080;
    __int16 v19 = "ACMSetEnvironmentVariableWithAccessPolicy";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }

  uint64_t v15 = 0LL;
  uint64_t v12 = LibCall_ACMSetEnvironmentVariable( (uint64_t (*)(uint64_t, uint64_t, void, char *, size_t, void, void))sub_15BAC,  (uint64_t)&v15,  a1,  a2,  a3,  a4,  a5,  a6);
  if ((_DWORD)v12) {
    unsigned int v13 = 70;
  }
  else {
    unsigned int v13 = 10;
  }
  if (v13 >= byte_2CE31 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    int v17 = "ACMLib";
    __int16 v18 = 2080;
    __int16 v19 = "ACMSetEnvironmentVariableWithAccessPolicy";
    __int16 v20 = 2048;
    uint64_t v21 = (int)v12;
    __int16 v22 = 1024;
    int v23 = a1;
    _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "%s: %s: returning, err = %ld, var=%u.\n",  buf,  0x26u);
  }

  return v12;
}

uint64_t ACMGetEnvironmentVariable(int a1, uint64_t a2)
{
  if (byte_2CE31 <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v9 = "ACMLib";
    __int16 v10 = 2080;
    size_t v11 = "ACMGetEnvironmentVariable";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }

  uint64_t v7 = 0LL;
  uint64_t v4 = LibCall_ACMGetEnvironmentVariable_Block( (uint64_t (*)(uint64_t, uint64_t, void, int *, uint64_t, uint64_t, uint64_t))sub_15BAC,  (uint64_t)&v7,  a1,  a2);
  if ((_DWORD)v4) {
    unsigned int v5 = 70;
  }
  else {
    unsigned int v5 = 10;
  }
  if (v5 >= byte_2CE31 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    uint64_t v9 = "ACMLib";
    __int16 v10 = 2080;
    size_t v11 = "ACMGetEnvironmentVariable";
    __int16 v12 = 2048;
    uint64_t v13 = (int)v4;
    __int16 v14 = 1024;
    int v15 = a1;
    _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "%s: %s: returning, err = %ld, var=%u.\n",  buf,  0x26u);
  }

  return v4;
}

uint64_t ACMKernelControl(int a1, const void *a2, size_t a3, uint64_t a4)
{
  if (byte_2CE31 <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v13 = "ACMLib";
    __int16 v14 = 2080;
    int v15 = "ACMKernelControl";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }

  uint64_t v11 = 0LL;
  uint64_t v8 = LibCall_ACMKernelControl_Block( (uint64_t (*)(uint64_t, uint64_t, void, char *, size_t, uint64_t, uint64_t))sub_15BAC,  (uint64_t)&v11,  a1,  a2,  a3,  a4);
  if ((_DWORD)v8) {
    unsigned int v9 = 70;
  }
  else {
    unsigned int v9 = 10;
  }
  if (v9 >= byte_2CE31 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    uint64_t v13 = "ACMLib";
    __int16 v14 = 2080;
    int v15 = "ACMKernelControl";
    __int16 v16 = 2048;
    uint64_t v17 = (int)v8;
    __int16 v18 = 1024;
    int v19 = a1;
    _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "%s: %s: returning, err = %ld, code=%u.\n",  buf,  0x26u);
  }

  return v8;
}

uint64_t ACMSEPControl(const void *a1, size_t a2, uint64_t a3)
{
  uint64_t v4 = 0LL;
  return LibCall_ACMSEPControl_Block( (uint64_t (*)(uint64_t, uint64_t, void, char *, uint64_t, unsigned int *, unint64_t *))sub_15BAC,  (uint64_t)&v4,  a1,  a2,  0LL,  0LL,  0,  a3);
}

uint64_t ACMSEPControlEx(uint64_t a1, _DWORD *a2, unsigned int a3, const void *a4, size_t a5, uint64_t a6)
{
  uint64_t v7 = 0LL;
  return LibCall_ACMSEPControl_Block( (uint64_t (*)(uint64_t, uint64_t, void, char *, uint64_t, unsigned int *, unint64_t *))sub_15BAC,  (uint64_t)&v7,  a4,  a5,  a1,  a2,  a3,  a6);
}

void ACMGlobalContextCredentialGetProperty(int a1, int a2, uint64_t a3)
{
  if (byte_2CE31 <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v8 = "ACMLib";
    __int16 v9 = 2080;
    __int16 v10 = "ACMGlobalContextCredentialGetProperty";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }

  uint64_t v6 = 0LL;
  LibCall_ACMGlobalContextCredentialGetProperty_Block((uint64_t)sub_15BAC, (uint64_t)&v6, a1, a2, a3);
  if (byte_2CE31 <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v8 = "ACMLib";
    __int16 v9 = 2080;
    __int16 v10 = "ACMGlobalContextCredentialGetProperty";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: returning.\n", buf, 0x16u);
  }

void ACMContextCredentialGetProperty(__n128 *a1, unsigned __int32 a2, unsigned __int32 a3, uint64_t a4)
{
  if (byte_2CE31 <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v16 = "ACMLib";
    __int16 v17 = 2080;
    __int16 v18 = "ACMContextCredentialGetProperty";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }

  uint64_t v10 = 256LL;
  if (a4)
  {
    __int16 v9 = a1;
    uint64_t v8 = LibCall_ACMContextCredentialGetProperty( (uint64_t (*)(uint64_t, uint64_t, void, __n128 *, uint64_t, uint64_t, uint64_t, __n128))sub_15BAC,  (uint64_t)&v9,  a1,  a2,  a3,  (uint64_t)buf,  (uint64_t)&v10);
    (*(void (**)(uint64_t, uint64_t, uint8_t *, uint64_t))(a4 + 16))(a4, v8, buf, v10);
  }

  if (byte_2CE31 <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uint64_t v11 = 136315394;
    __int16 v12 = "ACMLib";
    __int16 v13 = 2080;
    __int16 v14 = "ACMContextCredentialGetProperty";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: returning.\n", v11, 0x16u);
  }

uint64_t ACMContextSetData(_OWORD *a1, int a2, const void *a3, size_t a4)
{
  if (byte_2CE31 <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315394;
    __int16 v12 = "ACMLib";
    __int16 v13 = 2080;
    __int16 v14 = "ACMContextSetData";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v11, 0x16u);
  }

  uint64_t v8 = ACMContextSetDataEx(a1, a2, 0LL, 0, a3, a4);
  if ((_DWORD)v8) {
    unsigned int v9 = 70;
  }
  else {
    unsigned int v9 = 10;
  }
  if (v9 >= byte_2CE31 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315650;
    __int16 v12 = "ACMLib";
    __int16 v13 = 2080;
    __int16 v14 = "ACMContextSetData";
    __int16 v15 = 2048;
    uint64_t v16 = (int)v8;
    _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "%s: %s: returning, err = %ld.\n",  (uint8_t *)&v11,  0x20u);
  }

  return v8;
}

uint64_t ACMContextSetDataEx(_OWORD *a1, int a2, _DWORD *a3, unsigned int a4, const void *a5, size_t a6)
{
  if (byte_2CE31 <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v17 = "ACMLib";
    __int16 v18 = 2080;
    int v19 = "ACMContextSetDataEx";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }

  __int16 v15 = a1;
  uint64_t v12 = LibCall_ACMContextSetData( (uint64_t (*)(uint64_t, uint64_t, void, void *, size_t, void, void))sub_15BAC,  (uint64_t)&v15,  a1,  a2,  a3,  a4,  a5,  a6);
  if ((_DWORD)v12) {
    unsigned int v13 = 70;
  }
  else {
    unsigned int v13 = 10;
  }
  if (v13 >= byte_2CE31 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v17 = "ACMLib";
    __int16 v18 = 2080;
    int v19 = "ACMContextSetDataEx";
    __int16 v20 = 2048;
    uint64_t v21 = (int)v12;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }

  return v12;
}

uint64_t ACMContextGetData(_OWORD *a1, int a2, uint64_t a3)
{
  if (byte_2CE31 <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315394;
    uint64_t v10 = "ACMLib";
    __int16 v11 = 2080;
    uint64_t v12 = "ACMContextGetData";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v9, 0x16u);
  }

  uint64_t Data = ACMContextGetDataEx(a1, a2, 0LL, 0, a3);
  if ((_DWORD)Data) {
    unsigned int v7 = 70;
  }
  else {
    unsigned int v7 = 10;
  }
  if (v7 >= byte_2CE31 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315650;
    uint64_t v10 = "ACMLib";
    __int16 v11 = 2080;
    uint64_t v12 = "ACMContextGetData";
    __int16 v13 = 2048;
    uint64_t v14 = (int)Data;
    _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "%s: %s: returning, err = %ld.\n",  (uint8_t *)&v9,  0x20u);
  }

  return Data;
}

uint64_t ACMContextGetDataEx(_OWORD *a1, int a2, _DWORD *a3, unsigned int a4, uint64_t a5)
{
  if (byte_2CE31 <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int __size_4 = 136315394;
    BOOL v24 = "ACMLib";
    __int16 v25 = 2080;
    uint64_t v26 = "ACMContextGetDataEx";
    _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "%s: %s: called.\n",  (uint8_t *)&__size_4,  0x16u);
  }

  unsigned int __size = 0;
  uint64_t v20 = 0LL;
  uint64_t v21 = 4LL;
  int v19 = a1;
  uint64_t v10 = LibCall_ACMContextGetData( (uint64_t (*)(uint64_t, uint64_t, void, void *, size_t, uint64_t, uint64_t))sub_15BAC,  (uint64_t)&v19,  a1,  a2,  1,  a3,  a4,  (uint64_t)&__size,  (uint64_t)&v21);
  if (!(_DWORD)v10)
  {
    uint64_t v11 = __size;
    if (__size)
    {
      uint64_t v12 = acm_mem_alloc_data(__size);
      acm_mem_alloc_info( "<data>",  v12,  v11,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c",  1199,  "ACMContextGetDataEx");
      if (!v12)
      {
        unsigned int v16 = 70;
        uint64_t v14 = 4294967292LL;
        goto LABEL_15;
      }

      uint64_t v20 = __size;
      __int16 v18 = a1;
      uint64_t v13 = LibCall_ACMContextGetData( (uint64_t (*)(uint64_t, uint64_t, void, void *, size_t, uint64_t, uint64_t))sub_15BAC,  (uint64_t)&v18,  a1,  a2,  0,  a3,  a4,  (uint64_t)v12,  (uint64_t)&v20);
      uint64_t v14 = v13;
      if (a5 && !(_DWORD)v13) {
        (*(void (**)(uint64_t, void *, uint64_t))(a5 + 16))(a5, v12, v20);
      }
      rsize_t v15 = __size;
      acm_mem_free_info( "<data>",  v12,  __size,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c",  1213,  "ACMContextGetDataEx");
      acm_mem_free_data(v12, v15);
      if ((_DWORD)v14) {
        goto LABEL_11;
      }
    }

    else if (a5)
    {
      (*(void (**)(uint64_t, void, void))(a5 + 16))(a5, 0LL, 0LL);
    }

    uint64_t v14 = 0LL;
    unsigned int v16 = 10;
    goto LABEL_15;
  }

  uint64_t v14 = v10;
LABEL_11:
  unsigned int v16 = 70;
LABEL_15:
  if (v16 >= byte_2CE31 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int __size_4 = 136315650;
    BOOL v24 = "ACMLib";
    __int16 v25 = 2080;
    uint64_t v26 = "ACMContextGetDataEx";
    __int16 v27 = 2048;
    uint64_t v28 = (int)v14;
    _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "%s: %s: returning, err = %ld.\n",  (uint8_t *)&__size_4,  0x20u);
  }

  return v14;
}

uint64_t ACMContextGetDataProperty(_OWORD *a1, unsigned __int16 a2, unsigned __int16 a3, uint64_t a4)
{
  if (byte_2CE31 <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315394;
    uint64_t v12 = "ACMLib";
    __int16 v13 = 2080;
    uint64_t v14 = "ACMContextGetDataProperty";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v11, 0x16u);
  }

  uint64_t Data = ACMContextGetData(a1, a2 | (a3 << 16), a4);
  if ((_DWORD)Data) {
    unsigned int v9 = 70;
  }
  else {
    unsigned int v9 = 10;
  }
  if (v9 >= byte_2CE31 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315650;
    uint64_t v12 = "ACMLib";
    __int16 v13 = 2080;
    uint64_t v14 = "ACMContextGetDataProperty";
    __int16 v15 = 2048;
    uint64_t v16 = (int)Data;
    _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "%s: %s: returning, err = %ld.\n",  (uint8_t *)&v11,  0x20u);
  }

  return Data;
}

uint64_t ACMContextGetInfo(__int128 *a1, int a2, void *a3)
{
  if (byte_2CE31 <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    int v11 = "ACMLib";
    __int16 v12 = 2080;
    __int16 v13 = "ACMContextGetInfo";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }

  unsigned int v9 = a1;
  uint64_t v6 = LibCall_ACMContextGetInfo( (uint64_t (*)(uint64_t, uint64_t, void, int *, uint64_t, _OWORD *, unint64_t *))sub_15BAC,  (uint64_t)&v9,  a1,  a2,  a3);
  if ((_DWORD)v6) {
    unsigned int v7 = 70;
  }
  else {
    unsigned int v7 = 10;
  }
  if (v7 >= byte_2CE31 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    int v11 = "ACMLib";
    __int16 v12 = 2080;
    __int16 v13 = "ACMContextGetInfo";
    __int16 v14 = 2048;
    uint64_t v15 = (int)v6;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }

  return v6;
}

uint64_t ACMPing()
{
  uint64_t v1 = 0LL;
  return LibCall_ACMPing( (uint64_t (*)(uint64_t, uint64_t, void, void, void, void, void))sub_15BAC,  (uint64_t)&v1,  29LL);
}

void sub_1AAE4()
{
  if (byte_2CE31 <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    unsigned int v5 = "ACMLib";
    __int16 v6 = 2080;
    unsigned int v7 = "updateLogLevelFromKext";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }

  uint32_t outputCnt = 1;
  if (IOConnectCallScalarMethod(dword_2CEB8, 2u, 0LL, 0, &output, &outputCnt)) {
    goto LABEL_8;
  }
  unsigned __int8 v0 = output;
  unsigned int v1 = output;
  byte_2CE31 = output;
  if (output <= 0x1EuLL && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    unsigned int v5 = "ACMLib";
    __int16 v6 = 2080;
    unsigned int v7 = "updateLogLevelFromKext";
    __int16 v8 = 1024;
    int v9 = v0;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: log level set to %d.\n", buf, 0x1Cu);
LABEL_8:
    unsigned int v1 = byte_2CE31;
  }

  if (v1 <= 0xA && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    unsigned int v5 = "ACMLib";
    __int16 v6 = 2080;
    unsigned int v7 = "updateLogLevelFromKext";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: returning.\n", buf, 0x16u);
  }

_BYTE *LibCall_BuildCommand(char a1, char a2, char a3, const void *a4, size_t a5, void *a6)
{
  __int16 v12 = 0LL;
  if (a5) {
    BOOL v13 = a4 == 0LL;
  }
  else {
    BOOL v13 = 0;
  }
  if (!v13 && a6)
  {
    if (a5 >= 0xFFFFFFFFFFFFFFF8LL)
    {
      __int16 v12 = 0LL;
    }

    else
    {
      __int16 v12 = acm_mem_alloc_data(a5 + 8);
      acm_mem_alloc_info( "<data>",  v12,  a5 + 8,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c",  22,  "LibCall_BuildCommand");
      if (v12)
      {
        *a6 = a5 + 8;
        *(_DWORD *)__int16 v12 = 1396920900;
        v12[4] = a1;
        v12[5] = a2;
        v12[6] = a3;
        if (a5) {
          memcpy(v12 + 8, a4, a5);
        }
      }
    }
  }

  return v12;
}

uint64_t LibCall_ACMContextCreate( uint64_t (*a1)(uint64_t, uint64_t, void, void, void, _BYTE *, uint64_t *), uint64_t a2, void *a3, _BYTE *a4, int a5)
{
  unsigned int v10 = 70;
  uint64_t v11 = 4294967293LL;
  if (!a1 || !a3) {
    goto LABEL_25;
  }
  __int16 v12 = acm_mem_alloc(0x14uLL);
  acm_mem_alloc_info( "ACMHandleWithPayload",  v12,  20LL,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c",  50,  "LibCall_ACMContextCreate");
  if (!v12)
  {
    unsigned int v10 = 70;
    uint64_t v11 = 4294967292LL;
    goto LABEL_25;
  }

  memset(v19, 0, sizeof(v19));
  if (a5)
  {
    uint64_t v18 = 21LL;
    uint64_t v13 = a1(a2, 36LL, 0LL, 0LL, 0LL, v19, &v18);
    if (!(_DWORD)v13)
    {
      if (v18 != 21)
      {
        uint64_t v11 = 4294967291LL;
        goto LABEL_23;
      }

      uint64_t v11 = 0LL;
      goto LABEL_20;
    }

    uint64_t v11 = v13;
    if ((_DWORD)v13 != -3)
    {
LABEL_23:
      acm_mem_free_info( "ACMHandleWithPayload",  v12,  0x14uLL,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c",  89,  "LibCall_ACMContextCreate");
      acm_mem_free(v12, 0x14uLL);
      unsigned int v10 = 70;
      goto LABEL_25;
    }
  }

  uint64_t v18 = 17LL;
  unsigned int v14 = a1(a2, 1LL, 0LL, 0LL, 0LL, v19, &v18);
  if (v18 == 17) {
    unsigned int v15 = 0;
  }
  else {
    unsigned int v15 = -5;
  }
  if (v14) {
    uint64_t v11 = v14;
  }
  else {
    uint64_t v11 = v15;
  }
  if (!v14 && v18 == 17)
  {
LABEL_20:
    int v16 = *(_DWORD *)&v19[17];
    *(_OWORD *)__int16 v12 = *(_OWORD *)v19;
    v12[4] = v16;
    *a3 = v12;
    if (a4) {
      *a4 = v19[16];
    }
  }

  if ((_DWORD)v11) {
    goto LABEL_23;
  }
  unsigned int v10 = 10;
LABEL_25:
  return v11;
}

_DWORD *LibCall_ACMContextCreateWithExternalForm( uint64_t (*a1)(uint64_t, uint64_t, void, _OWORD *, uint64_t, void *, uint64_t *), uint64_t a2, _OWORD *a3, uint64_t a4, _BYTE *a5, int a6)
{
  __int16 v12 = 0LL;
  unsigned int v13 = 70;
  int v14 = -3;
  if (a1 && a3 && a4 == 16)
  {
    memset(v21, 0, 9);
    if (a6)
    {
      uint64_t v20 = 9LL;
      int v15 = a1(a2, 37LL, 0LL, a3, 16LL, v21, &v20);
      if (!v15)
      {
        if (v20 == 9)
        {
          int v14 = 0;
          goto LABEL_19;
        }

        int v14 = -5;
        goto LABEL_28;
      }

      int v14 = v15;
      if (v15 != -3) {
        goto LABEL_28;
      }
    }

    uint64_t v20 = 5LL;
    int v16 = a1(a2, 18LL, 0LL, a3, 16LL, v21, &v20);
    if (v20 == 5) {
      int v17 = 0;
    }
    else {
      int v17 = -5;
    }
    if (v16) {
      int v14 = v16;
    }
    else {
      int v14 = v17;
    }
    if (!v16 && v20 == 5)
    {
LABEL_19:
      if (LODWORD(v21[0]))
      {
        __int16 v12 = acm_mem_alloc(0x14uLL);
        acm_mem_alloc_info( "ACMHandleWithPayload",  v12,  20LL,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c",  128,  "LibCall_ACMContextCreateWithExternalForm");
        if (!v12)
        {
          unsigned int v13 = 70;
          int v14 = -4;
          goto LABEL_31;
        }

        int v18 = *(_DWORD *)((char *)v21 + 5);
        *(_OWORD *)__int16 v12 = *a3;
        v12[4] = v18;
        if (a5) {
          *a5 = BYTE4(v21[0]);
        }
        if (v14)
        {
          acm_mem_free_info( "ACMHandleWithPayload",  v12,  0x14uLL,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c",  147,  "LibCall_ACMContextCreateWithExternalForm");
          acm_mem_free(v12, 0x14uLL);
LABEL_29:
          unsigned int v13 = 70;
          goto LABEL_31;
        }
      }

      else
      {
        __int16 v12 = 0LL;
      }

      goto LABEL_30;
    }

LABEL_31:
  return v12;
}

uint64_t LibCall_ACMContextDelete( void (*a1)(uint64_t, uint64_t, void, void *, uint64_t, void, void), uint64_t a2, void *a3, int a4)
{
  if (a1 && a3)
  {
    if (a4) {
      a1(a2, 2LL, 0LL, a3, 16LL, 0LL, 0LL);
    }
    goto LABEL_7;
  }

  if (a3)
  {
LABEL_7:
    acm_mem_free_info( "ACMHandleWithPayload",  a3,  0x14uLL,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c",  172,  "LibCall_ACMContextDelete");
    acm_mem_free(a3, 0x14uLL);
    uint64_t v8 = 0LL;
    unsigned int v9 = 10;
    goto LABEL_8;
  }

  unsigned int v9 = 70;
  uint64_t v8 = 4294967293LL;
LABEL_8:
  return v8;
}

uint64_t LibCall_ACMContexAddCredentialWithScope( uint64_t (*a1)(uint64_t, uint64_t, void, void *, size_t, void, void), uint64_t a2, _OWORD *a3, unsigned int *a4, int a5)
{
  size_t __size = 0LL;
  if (a3) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = a5 == 2;
  }
  char v11 = !v10;
  unsigned int v12 = 70;
  uint64_t v13 = 4294967293LL;
  if (a4 && (v11 & 1) == 0)
  {
    uint64_t SerializedAddCredentialSize = GetSerializedAddCredentialSize((uint64_t)a3, a4, a5, &__size);
    if ((_DWORD)SerializedAddCredentialSize)
    {
      uint64_t v13 = SerializedAddCredentialSize;
      unsigned int v12 = 70;
    }

    else
    {
      size_t v15 = __size;
      int v16 = acm_mem_alloc_data(__size);
      acm_mem_alloc_info( "<data>",  v16,  v15,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c",  192,  "LibCall_ACMContexAddCredentialWithScope");
      if (v16)
      {
        uint64_t v17 = SerializeAddCredential(a3, a4, a5, (uint64_t)v16, &__size);
        if (!(_DWORD)v17) {
          uint64_t v17 = a1(a2, 5LL, 0LL, v16, __size, 0LL, 0LL);
        }
        uint64_t v13 = v17;
        size_t v18 = __size;
        acm_mem_free_info( "<data>",  v16,  __size,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c",  203,  "LibCall_ACMContexAddCredentialWithScope");
        acm_mem_free_data(v16, v18);
        if ((_DWORD)v13) {
          unsigned int v12 = 70;
        }
        else {
          unsigned int v12 = 10;
        }
      }

      else
      {
        unsigned int v12 = 70;
        uint64_t v13 = 4294967292LL;
      }
    }
  }

  return v13;
}

uint64_t LibCall_ACMContexRemoveCredentialsByTypeAndScope( uint64_t (*a1)(uint64_t, uint64_t, void, _OWORD *, uint64_t, void, void), uint64_t a2, _OWORD *a3, int a4, int a5)
{
  if (a3 || a5 == 2)
  {
    BOOL v10 = acm_mem_alloc_data(0x18uLL);
    acm_mem_alloc_info( "<data>",  v10,  24LL,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c",  217,  "LibCall_ACMContexRemoveCredentialsByTypeAndScope");
    if (v10)
    {
      if (a3)
      {
        *BOOL v10 = *a3;
      }

      else
      {
        *(void *)BOOL v10 = 0LL;
        *((void *)v10 + 1) = 0LL;
      }

      *((_DWORD *)v10 + 4) = a4;
      *((_DWORD *)v10 + 5) = a5;
      uint64_t v11 = a1(a2, 9LL, 0LL, v10, 24LL, 0LL, 0LL);
      acm_mem_free_info( "<data>",  v10,  0x18uLL,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c",  233,  "LibCall_ACMContexRemoveCredentialsByTypeAndScope");
      acm_mem_free_data(v10, 0x18uLL);
      if ((_DWORD)v11) {
        unsigned int v12 = 70;
      }
      else {
        unsigned int v12 = 10;
      }
    }

    else
    {
      unsigned int v12 = 70;
      uint64_t v11 = 4294967292LL;
    }
  }

  else
  {
    unsigned int v12 = 70;
    uint64_t v11 = 4294967293LL;
  }

  return v11;
}

uint64_t LibCall_ACMContextRemoveCredentialsByValueAndScope( uint64_t (*a1)(uint64_t, uint64_t, void, void *, size_t, void, void), uint64_t a2, uint64_t a3, _DWORD *a4, uint64_t a5)
{
  size_t __size = 0LL;
  if (a3) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = (_DWORD)a5 == 2;
  }
  char v11 = !v10;
  unsigned int v12 = 70;
  uint64_t v13 = 4294967293LL;
  if (a4 && (v11 & 1) == 0)
  {
    uint64_t v14 = GetSerializedRemoveCredentialSize(a3, a4, a5, &__size);
    if ((_DWORD)v14)
    {
      uint64_t v13 = v14;
      unsigned int v12 = 70;
    }

    else
    {
      size_t v15 = __size;
      int v16 = acm_mem_alloc_data(__size);
      acm_mem_alloc_info( "<data>",  v16,  v15,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c",  251,  "LibCall_ACMContextRemoveCredentialsByValueAndScope");
      if (v16)
      {
        uint64_t v17 = SerializeRemoveCredential(a3, a4, a5, v16, &__size);
        if (!(_DWORD)v17) {
          uint64_t v17 = a1(a2, 6LL, 0LL, v16, __size, 0LL, 0LL);
        }
        uint64_t v13 = v17;
        size_t v18 = __size;
        acm_mem_free_info( "<data>",  v16,  __size,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c",  264,  "LibCall_ACMContextRemoveCredentialsByValueAndScope");
        acm_mem_free_data(v16, v18);
        if ((_DWORD)v13) {
          unsigned int v12 = 70;
        }
        else {
          unsigned int v12 = 10;
        }
      }

      else
      {
        unsigned int v12 = 70;
        uint64_t v13 = 4294967292LL;
      }
    }
  }

  return v13;
}

uint64_t LibCall_ACMContextVerifyPolicyAndCopyRequirementEx( uint64_t (*a1)(uint64_t, uint64_t, void, _OWORD *, size_t, unsigned int *, unint64_t *), uint64_t a2, _OWORD *a3, char *__s1, uint64_t a5, _DWORD *a6, unsigned int a7, uint64_t a8, BOOL *a9, void *a10)
{
  size_t v32 = 0LL;
  size_t __size = 0LL;
  __int16 v30 = 0LL;
  unint64_t v31 = 4096LL;
  unsigned int v18 = 70;
  uint64_t v19 = 4294967293LL;
  size_t v29 = 0LL;
  if (a1 && a3 && __s1 && a9)
  {
    if ((a6 != 0LL) != (a7 != 0))
    {
      unsigned int v18 = 70;
      uint64_t v19 = 4294967293LL;
    }

    else
    {
      uint64_t SerializedVerifyPolicySize = GetSerializedVerifyPolicySize((uint64_t)a3, __s1, a5, a8, a6, a7, &__size);
      if ((_DWORD)SerializedVerifyPolicySize)
      {
        uint64_t v19 = SerializedVerifyPolicySize;
        unsigned int v18 = 70;
      }

      else
      {
        size_t v21 = __size;
        __int16 v22 = acm_mem_alloc_data(__size);
        acm_mem_alloc_info( "<data>",  v22,  v21,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c",  293,  "LibCall_ACMContextVerifyPolicyAndCopyRequirementEx");
        if (v22)
        {
          size_t v32 = __size;
          uint64_t v23 = SerializeVerifyPolicy(a3, __s1, a5, a8, a6, a7, v22, &v32);
          if ((_DWORD)v23)
          {
            uint64_t v19 = v23;
            BOOL v24 = 0LL;
          }

          else
          {
            BOOL v24 = (unsigned int *)acm_mem_alloc_data(0x1000uLL);
            acm_mem_alloc_info( "<data>",  v24,  4096LL,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c",  300,  "LibCall_ACMContextVerifyPolicyAndCopyRequirementEx");
            if (v24)
            {
              uint64_t v25 = a1(a2, 3LL, 0LL, v22, v32, v24, &v31);
              if ((_DWORD)v25)
              {
                uint64_t v19 = v25;
              }

              else
              {
                unint64_t v26 = v31 - 4;
                if (v31 < 4)
                {
                  uint64_t v19 = 4294967291LL;
                }

                else
                {
                  *a9 = *v24 != 0;
                  if (a10)
                  {
                    uint64_t v19 = DeserializeRequirement(v24 + 1, v26, &v30, &v29);
                    if (!(_DWORD)v19) {
                      *a10 = v30;
                    }
                  }

                  else
                  {
                    uint64_t v19 = 0LL;
                  }
                }
              }
            }

            else
            {
              uint64_t v19 = 4294967292LL;
            }
          }

          size_t v27 = __size;
          acm_mem_free_info( "<data>",  v22,  __size,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c",  324,  "LibCall_ACMContextVerifyPolicyAndCopyRequirementEx");
          acm_mem_free_data(v22, v27);
          if (v24)
          {
            acm_mem_free_info( "<data>",  v24,  0x1000uLL,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c",  327,  "LibCall_ACMContextVerifyPolicyAndCopyRequirementEx");
            acm_mem_free_data(v24, 0x1000uLL);
          }

          if ((_DWORD)v19) {
            unsigned int v18 = 70;
          }
          else {
            unsigned int v18 = 10;
          }
        }

        else
        {
          unsigned int v18 = 70;
          uint64_t v19 = 4294967292LL;
        }
      }
    }
  }

  return v19;
}

uint64_t LibCall_ACMRequirementDelete(uint64_t a1, int *a2)
{
  unsigned int v4 = 70;
  uint64_t v5 = 4294967293LL;
  if (a1 && a2)
  {
    uint64_t v5 = Util_DeallocRequirement(a2);
    if ((_DWORD)v5) {
      unsigned int v4 = 70;
    }
    else {
      unsigned int v4 = 10;
    }
  }

  return v5;
}

uint64_t LibCall_ACMKernelControl( uint64_t (*a1)(uint64_t, uint64_t, void, char *, size_t, uint64_t, uint64_t), uint64_t a2, int a3, const void *a4, size_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v13 = a1;
  if (gACMLoggingLevel <= 0xAu) {
    a1 = (uint64_t (*)(uint64_t, uint64_t, void, char *, size_t, uint64_t, uint64_t))printf( "%s: %s: called.\n",  "ACM",  "LibCall_ACMKernelControl");
  }
  if (!v13) {
    goto LABEL_16;
  }
  BOOL v14 = a5 != 0;
  if (a4) {
    BOOL v14 = a5 - 4097 < 0xFFFFFFFFFFFFF000LL;
  }
  if (v14)
  {
LABEL_16:
    unsigned int v18 = 70;
    uint64_t v17 = 4294967293LL;
  }

  else
  {
    uint64_t v20 = (uint64_t)&v20;
    __chkstk_darwin(a1);
    size_t v15 = (_DWORD *)((char *)&v20 - ((a5 + 19) & 0xFFFFFFFFFFFFFFF0LL));
    *size_t v15 = a3;
    int v16 = v15 + 1;
    if (a5)
    {
      memcpy(v15 + 1, a4, a5);
      int v16 = (_DWORD *)((char *)v16 + a5);
    }

    uint64_t v17 = v13(a2, 26LL, 0LL, (char *)&v20 - ((a5 + 19) & 0xFFFFFFFFFFFFFFF0LL), a5 + 4, a6, a7);
    if ((_DWORD)v17) {
      unsigned int v18 = 70;
    }
    else {
      unsigned int v18 = 10;
    }
  }

  return v17;
}

_DWORD *LibCall_ACMCredentialDelete(_DWORD *a1)
{
  if (a1) {
    return (_DWORD *)Util_DeallocCredential(a1);
  }
  return a1;
}

unsigned int *LibCall_ACMCredentialGetType(unsigned int *result)
{
  if (result) {
    return (unsigned int *)*result;
  }
  return result;
}

uint64_t LibCall_ACMCredentialSetProperty(int *a1, int a2, _OWORD *__src, size_t __n)
{
  if (!a1) {
    return 4294967293LL;
  }
  int v4 = __n;
  if ((__src != 0LL) != (__n != 0)) {
    return 4294967293LL;
  }
  uint64_t result = 4294967293LL;
  if (a2 > 399)
  {
    if (a2 > 601)
    {
      if (a2 <= 801)
      {
        if (a2 != 602)
        {
          if (a2 == 701)
          {
            if (__n <= 0x80 && *a1 == 13)
            {
              a1[8] = __n;
              BOOL v14 = a1 + 9;
LABEL_118:
              memcpy(v14, __src, __n);
              return 0LL;
            }
          }

          else if (a2 == 801 && __n == 16 && *a1 == 17)
          {
            uint64_t result = 0LL;
            *((_OWORD *)a1 + 2) = *__src;
          }

          return result;
        }

        BOOL v13 = *a1 == 12 || *a1 == 15;
        if (__n != 4 || !v13) {
          return result;
        }
LABEL_79:
        uint64_t result = 0LL;
        a1[9] = *(_DWORD *)__src;
        return result;
      }

      if (a2 == 802)
      {
        if (__n != 65 || *a1 != 17) {
          return result;
        }
        uint64_t result = 0LL;
        *((_OWORD *)a1 + 3) = *__src;
        __int128 v11 = __src[1];
        __int128 v16 = __src[2];
        __int128 v17 = __src[3];
        *((_BYTE *)a1 + 112) = *((_BYTE *)__src + 64);
        *((_OWORD *)a1 + 5) = v16;
        *((_OWORD *)a1 + 6) = v17;
        goto LABEL_92;
      }

      if (a2 != 901)
      {
        if (a2 == 1001 && __n <= 0x80 && *a1 == 21)
        {
          memcpy(a1 + 9, __src, __n);
          uint64_t result = 0LL;
          a1[8] = v4;
        }

        return result;
      }

      if (__n != 32 || *a1 != 20) {
        return result;
      }
    }

    else
    {
      if (a2 > 501)
      {
        switch(a2)
        {
          case 502:
            if (__n == 16 && *a1 == 10)
            {
LABEL_102:
              uint64_t result = 0LL;
              *(_OWORD *)(a1 + 13) = *__src;
            }

            break;
          case 503:
            if (__n == 16 && *a1 == 10)
            {
              uint64_t result = 0LL;
              __int128 v15 = *__src;
LABEL_99:
              *(_OWORD *)(a1 + 17) = v15;
            }

            break;
          case 601:
            BOOL v9 = *a1 == 12 || *a1 == 15;
            BOOL v10 = v9;
            if (__n == 4 && v10)
            {
LABEL_64:
              uint64_t result = 0LL;
              a1[8] = *(_DWORD *)__src;
            }

            break;
        }

        return result;
      }

      if (a2 != 400)
      {
        if (a2 != 401)
        {
          if (a2 == 501 && __n == 16 && *a1 == 10)
          {
LABEL_16:
            uint64_t result = 0LL;
            *(_OWORD *)(a1 + 9) = *__src;
          }

          return result;
        }

        if (__n != 24 || *a1 != 7) {
          return result;
        }
        uint64_t result = 0LL;
        __int128 v11 = *__src;
        *((void *)a1 + 10) = *((void *)__src + 2);
LABEL_92:
        *((_OWORD *)a1 + 4) = v11;
        return result;
      }

      if (__n != 32 || *a1 != 7) {
        return result;
      }
    }

    uint64_t result = 0LL;
    __int128 v18 = __src[1];
    *((_OWORD *)a1 + 2) = *__src;
    *((_OWORD *)a1 + 3) = v18;
    return result;
  }

  if (a2 > 199)
  {
    switch(a2)
    {
      case 300:
        if (__n == 16 && *a1 == 3) {
          goto LABEL_16;
        }
        break;
      case 301:
        if (__n == 32 && *a1 == 3)
        {
          uint64_t result = 0LL;
          __int128 v15 = *__src;
          *(_OWORD *)(a1 + 21) = __src[1];
          goto LABEL_99;
        }

        break;
      case 302:
        if (__n == 16 && *a1 == 3) {
          goto LABEL_102;
        }
        break;
      case 303:
        if (__n == 65 && *a1 == 3)
        {
          uint64_t result = 0LL;
          *(_OWORD *)(a1 + 30) = *__src;
          __int128 v19 = __src[1];
          __int128 v20 = __src[2];
          __int128 v21 = __src[3];
          *((_BYTE *)a1 + 184) = *((_BYTE *)__src + 64);
          *(_OWORD *)(a1 + 42) = v21;
          *(_OWORD *)(a1 + 3_Block_object_dispose(va, 8) = v20;
          *(_OWORD *)(a1 + 34) = v19;
        }

        break;
      case 304:
        if (__n == 16 && *a1 == 3)
        {
          uint64_t result = 0LL;
          *(_OWORD *)((char *)a1 + 185) = *__src;
        }

        break;
      case 305:
        if (__n == 4 && *a1 == 3)
        {
          uint64_t result = 0LL;
          *(int *)((char *)a1 + 201) = *(_DWORD *)__src;
        }

        break;
      case 306:
        if (__n <= 0x80 && *a1 == 3)
        {
          memcpy((char *)a1 + 209, __src, __n);
          uint64_t result = 0LL;
          *(int *)((char *)a1 + 205) = v4;
        }

        break;
      default:
        if (a2 == 200)
        {
          if (__n <= 0x80 && *a1 == 2)
          {
            a1[9] = __n;
            BOOL v14 = a1 + 10;
            goto LABEL_118;
          }
        }

        else if (a2 == 201 && __n == 4 && *a1 == 2)
        {
          goto LABEL_64;
        }

        break;
    }

    return result;
  }

  if (a2 > 100)
  {
    if (a2 == 101)
    {
      if (__n == 4)
      {
        switch(*a1)
        {
          case 1:
          case 3:
          case 9:
          case 10:
            goto LABEL_64;
          case 2:
          case 4:
          case 5:
          case 6:
          case 7:
          case 8:
            return result;
          default:
            if (*a1 == 18) {
              goto LABEL_64;
            }
            break;
        }
      }

      return result;
    }

    if (a2 != 102 || __n != 4 || *a1 != 1) {
      return result;
    }
    goto LABEL_79;
  }

  if (a2 == 5)
  {
    if (__n == 4)
    {
      uint64_t result = 0LL;
      a1[3] = *(_DWORD *)__src;
    }
  }

  else if (a2 == 100 && __n == 16)
  {
    int v7 = *a1;
    if (*a1 > 8)
    {
      if (v7 == 9)
      {
        uint64_t v8 = a1 + 10;
        a1[9] = 16;
      }

      else
      {
        if (v7 != 18) {
          return result;
        }
        uint64_t v8 = a1 + 9;
      }
    }

    else if (v7 == 1)
    {
      uint64_t v8 = a1 + 11;
      a1[10] = 16;
    }

    else
    {
      if (v7 != 3) {
        return result;
      }
      uint64_t v8 = a1 + 26;
      a1[25] = 16;
    }

    uint64_t result = 0LL;
    *uint64_t v8 = *__src;
  }

  return result;
}

uint64_t LibCall_ACMCredentialGetPropertyData(int *a1, int a2, int **a3, uint64_t *a4)
{
  uint64_t result = 4294967293LL;
  if (!a1 || !a3 || !a4) {
    return result;
  }
  if (a2 > 399)
  {
    if (a2 > 601)
    {
      if (a2 > 801)
      {
        if (a2 == 802)
        {
          if (*a1 != 17) {
            return result;
          }
          __int128 v11 = a1 + 12;
LABEL_87:
          uint64_t v12 = 65LL;
          BOOL v13 = v11;
          uint64_t v14 = 65LL;
        }

        else
        {
          if (a2 != 901)
          {
            if (a2 != 1001 || *a1 != 21) {
              return result;
            }
            __int128 v15 = a1 + 9;
            if ((Util_isNullOrZeroMemory((_BYTE *)a1 + 36, 128LL) & 1) != 0)
            {
              __int128 v15 = 0LL;
              uint64_t v10 = 0LL;
            }

            else
            {
              uint64_t v10 = a1[8];
            }

            uint64_t result = 0LL;
            *a3 = v15;
LABEL_99:
            *a4 = v10;
            return result;
          }

          if (*a1 != 20) {
            return result;
          }
          __int128 v11 = a1 + 8;
          uint64_t v12 = 32LL;
          BOOL v13 = v11;
          uint64_t v14 = 32LL;
        }
      }

      else
      {
        if (a2 == 602)
        {
          if (*a1 != 15 && *a1 != 12) {
            return result;
          }
          goto LABEL_61;
        }

        if (a2 == 701)
        {
          if (*a1 != 13) {
            return result;
          }
          uint64_t result = 0LL;
          *a3 = a1 + 9;
          uint64_t v10 = a1[8];
          goto LABEL_99;
        }

        if (a2 != 801 || *a1 != 17) {
          return result;
        }
        __int128 v11 = a1 + 8;
        uint64_t v12 = 16LL;
        BOOL v13 = v11;
        uint64_t v14 = 16LL;
      }

      unsigned int v19 = Util_isNullOrZeroMemory(v13, v14);
      uint64_t result = 0LL;
      BOOL v20 = v19 == 0;
      if (v19) {
        __int128 v21 = 0LL;
      }
      else {
        __int128 v21 = (int *)v11;
      }
      if (v20) {
        uint64_t v22 = v12;
      }
      else {
        uint64_t v22 = 0LL;
      }
      *a3 = v21;
      *a4 = v22;
      return result;
    }

    if (a2 > 501)
    {
      if (a2 == 502)
      {
        if (*a1 != 10) {
          return result;
        }
        BOOL v9 = a1 + 13;
      }

      else
      {
        if (a2 != 503)
        {
          if (a2 != 601 || *a1 != 15 && *a1 != 12) {
            return result;
          }
          goto LABEL_77;
        }

        if (*a1 != 10) {
          return result;
        }
        BOOL v9 = a1 + 17;
      }

LABEL_68:
      *a3 = v9;
      uint64_t result = (uint64_t)Util_isNullOrZeroMemory(v9, 16LL);
      if ((_DWORD)result)
      {
        uint64_t result = 0LL;
        *a4 = 0LL;
        *a3 = 0LL;
        return result;
      }

LABEL_70:
      uint64_t v10 = 16LL;
      goto LABEL_99;
    }

    if (a2 == 400)
    {
      if (*a1 != 7) {
        return result;
      }
      uint64_t result = 0LL;
      __int128 v16 = a1 + 8;
LABEL_84:
      *a3 = v16;
      uint64_t v10 = 32LL;
      goto LABEL_99;
    }

    if (a2 == 401)
    {
      if (*a1 != 7) {
        return result;
      }
      uint64_t result = 0LL;
      *a3 = a1 + 16;
      uint64_t v10 = 24LL;
      goto LABEL_99;
    }

    if (a2 != 501 || *a1 != 10) {
      return result;
    }
LABEL_15:
    BOOL v9 = a1 + 9;
    goto LABEL_68;
  }

  if (a2 > 199)
  {
    switch(a2)
    {
      case 300:
        if (*a1 == 3)
        {
          uint64_t result = 0LL;
          uint64_t v8 = a1 + 9;
          goto LABEL_50;
        }

        break;
      case 301:
        if (*a1 == 3)
        {
          uint64_t result = 0LL;
          __int128 v16 = a1 + 17;
          goto LABEL_84;
        }

        break;
      case 302:
        if (*a1 == 3)
        {
          uint64_t result = 0LL;
          uint64_t v8 = a1 + 13;
          goto LABEL_50;
        }

        break;
      case 303:
        if (*a1 == 3)
        {
          __int128 v11 = a1 + 30;
          goto LABEL_87;
        }

        break;
      case 304:
        if (*a1 == 3)
        {
          uint64_t result = 0LL;
          uint64_t v8 = (int *)((char *)a1 + 185);
LABEL_50:
          *a3 = v8;
          goto LABEL_70;
        }

        break;
      case 305:
        if (*a1 == 3)
        {
          uint64_t result = 0LL;
          __int128 v17 = (int *)((char *)a1 + 201);
          goto LABEL_97;
        }

        break;
      case 306:
        if (*a1 == 3)
        {
          uint64_t result = 0LL;
          uint64_t v10 = *(unsigned int *)((char *)a1 + 205);
          uint64_t v23 = (int *)((char *)a1 + 209);
          *a3 = v23;
          goto LABEL_99;
        }

        break;
      default:
        if (a2 == 200)
        {
          if (*a1 == 2)
          {
            uint64_t result = 0LL;
            *a3 = a1 + 10;
            uint64_t v10 = a1[9];
            goto LABEL_99;
          }
        }

        else if (a2 == 201 && *a1 == 2)
        {
          goto LABEL_77;
        }

        break;
    }

    return result;
  }

  if (a2 > 99)
  {
    if (a2 != 100)
    {
      if (a2 != 101)
      {
        if (a2 != 102 || *a1 != 1) {
          return result;
        }
LABEL_61:
        uint64_t result = 0LL;
        __int128 v17 = a1 + 9;
        goto LABEL_97;
      }

LABEL_77:
      uint64_t result = 0LL;
      __int128 v17 = a1 + 8;
LABEL_97:
      *a3 = v17;
LABEL_98:
      uint64_t v10 = 4LL;
      goto LABEL_99;
    }

    int v18 = *a1;
    if (*a1 <= 8)
    {
      if (v18 == 1)
      {
        BOOL v9 = a1 + 11;
      }

      else
      {
        if (v18 != 3) {
          return result;
        }
        BOOL v9 = a1 + 26;
      }

      goto LABEL_68;
    }

    if (v18 == 9)
    {
      BOOL v9 = a1 + 10;
      goto LABEL_68;
    }

    if (v18 != 18) {
      return result;
    }
    goto LABEL_15;
  }

  switch(a2)
  {
    case 1:
      uint64_t result = 0LL;
      *a3 = a1 + 4;
      uint64_t v10 = 8LL;
      goto LABEL_99;
    case 2:
      uint64_t result = 0LL;
      __int128 v17 = a1 + 6;
      goto LABEL_97;
    case 3:
      uint64_t result = 0LL;
      *a3 = a1;
      goto LABEL_98;
    case 4:
      uint64_t result = 0LL;
      __int128 v17 = a1 + 1;
      goto LABEL_97;
    case 5:
      uint64_t result = 0LL;
      __int128 v17 = a1 + 3;
      goto LABEL_97;
    default:
      return result;
  }

  return result;
}

unsigned int *LibCall_ACMRequirementGetType(unsigned int *result)
{
  if (result) {
    return (unsigned int *)*result;
  }
  return result;
}

uint64_t LibCall_ACMRequirementGetState(uint64_t result)
{
  if (result) {
    return *(unsigned int *)(result + 4);
  }
  return result;
}

uint64_t LibCall_ACMRequirementGetPriority(uint64_t result)
{
  if (result) {
    return *(unsigned int *)(result + 8);
  }
  return result;
}

uint64_t LibCall_ACMRequirementGetPropertyData(int *a1, int a2, int **a3, unint64_t *a4)
{
  uint64_t v4 = 4294967293LL;
  if (!a1 || !a3 || !a4) {
    return v4;
  }
  uint64_t v4 = 4294967293LL;
  if (a2 > 399)
  {
    if (a2 > 600)
    {
      if (a2 == 601)
      {
        if (*a1 == 26)
        {
          if (a1[3] >= 0x1C)
          {
            int v7 = a1 + 7;
LABEL_45:
            *a3 = v7;
            unint64_t v10 = 16LL;
            goto LABEL_72;
          }

          return 4294967282LL;
        }

        return 4294967293LL;
      }

      if (a2 != 602)
      {
        if (a2 != 700) {
          return v4;
        }
        if (*a1 == 7)
        {
LABEL_28:
          uint64_t v8 = a1 + 4;
          goto LABEL_58;
        }

        return 4294967293LL;
      }

      if (*a1 != 26) {
        return 4294967293LL;
      }
      *a3 = a1 + 4;
      unint64_t v10 = 8LL;
    }

    else
    {
      if (a2 == 400)
      {
        if (*a1 == 13)
        {
          BOOL v9 = a1 + 4;
LABEL_64:
          *a3 = v9;
          unint64_t v10 = 32LL;
          goto LABEL_72;
        }

        return 4294967293LL;
      }

      if (a2 != 500)
      {
        if (a2 != 600) {
          return v4;
        }
        if (*a1 == 26)
        {
          if (a1[3] >= 0x1C)
          {
            uint64_t v8 = a1 + 6;
LABEL_58:
            *a3 = v8;
            goto LABEL_59;
          }

          return 4294967282LL;
        }

        return 4294967293LL;
      }

      if (*a1 != 25) {
        return 4294967293LL;
      }
      *a3 = a1 + 4;
      unint64_t v10 = 43LL;
    }

LABEL_72:
    uint64_t v4 = 0LL;
    *a4 = v10;
    return v4;
  }

  if (a2 > 99)
  {
    switch(a2)
    {
      case 300:
        if (*a1 != 3) {
          return 4294967293LL;
        }
        int v7 = a1 + 5;
        goto LABEL_45;
      case 301:
        if (*a1 != 3) {
          return 4294967293LL;
        }
        BOOL v9 = a1 + 13;
        goto LABEL_64;
      case 302:
        if (*a1 != 3) {
          return 4294967293LL;
        }
        int v7 = a1 + 9;
        goto LABEL_45;
      case 303:
        if (*a1 != 3) {
          return 4294967293LL;
        }
        unint64_t v10 = 0LL;
        __int128 v11 = a1 + 21;
        break;
      case 304:
        if (*a1 != 3) {
          return 4294967293LL;
        }
        uint64_t v8 = a1 + 41;
        goto LABEL_58;
      case 305:
        if (*a1 != 3) {
          return 4294967293LL;
        }
        uint64_t v8 = a1 + 42;
        goto LABEL_58;
      case 306:
        if (*a1 != 24) {
          return 4294967293LL;
        }
        *a3 = a1 + 5;
        unint64_t v10 = a1[4];
        goto LABEL_72;
      case 307:
        if (*a1 != 24) {
          return 4294967293LL;
        }
        BOOL v9 = a1 + 261;
        goto LABEL_64;
      default:
        if (a2 == 100)
        {
          int v13 = *a1;
          if (*a1 > 19)
          {
            if (v13 == 20 || v13 == 21) {
              goto LABEL_28;
            }
          }

          else if (v13 == 1 || v13 == 3)
          {
            goto LABEL_28;
          }

          return v4;
        }

        if (a2 != 200) {
          return v4;
        }
        if (*a1 != 2) {
          return 4294967293LL;
        }
        goto LABEL_28;
    }

    while ((Util_isNullOrZeroMemory((_BYTE *)v11 + v10, 16LL) & 1) == 0)
    {
      BOOL v12 = v10 >= 0x40;
      v10 += 16LL;
      if (v12)
      {
        unint64_t v10 = 80LL;
        goto LABEL_71;
      }
    }

    if (!v10) {
      __int128 v11 = 0LL;
    }
LABEL_71:
    *a3 = v11;
    goto LABEL_72;
  }

  switch(a2)
  {
    case 1:
      *a3 = a1;
LABEL_59:
      unint64_t v10 = 4LL;
      goto LABEL_72;
    case 2:
      uint64_t v8 = a1 + 1;
      goto LABEL_58;
    case 3:
      uint64_t v8 = a1 + 2;
      goto LABEL_58;
  }

  return v4;
}

uint64_t LibCall_ACMPing( uint64_t (*a1)(uint64_t, uint64_t, void, void, void, void, void), uint64_t a2, uint64_t a3)
{
  unsigned int v6 = 70;
  if (a1 && ((_DWORD)a3 == 47 || (_DWORD)a3 == 29))
  {
    uint64_t v7 = a1(a2, a3, 0LL, 0LL, 0LL, 0LL, 0LL);
    if ((_DWORD)v7) {
      unsigned int v6 = 70;
    }
    else {
      unsigned int v6 = 10;
    }
  }

  else
  {
    uint64_t v7 = 4294967293LL;
  }

  return v7;
}

uint64_t LibCall_ACMKernDoubleClickNotify( uint64_t (*a1)(uint64_t, uint64_t, void, void, void, void, void), uint64_t a2)
{
  unsigned int v4 = 70;
  if (a1)
  {
    uint64_t v5 = a1(a2, 28LL, 0LL, 0LL, 0LL, 0LL, 0LL);
    if ((_DWORD)v5) {
      unsigned int v4 = 70;
    }
    else {
      unsigned int v4 = 10;
    }
  }

  else
  {
    uint64_t v5 = 4294967293LL;
  }

  return v5;
}

uint64_t LibCall_ACMContextCredentialGetProperty( uint64_t (*a1)(uint64_t, uint64_t, void, __n128 *, uint64_t, uint64_t, uint64_t, __n128), uint64_t a2, __n128 *a3, unsigned __int32 a4, unsigned __int32 a5, uint64_t a6, uint64_t a7)
{
  unsigned int v14 = 70;
  uint64_t v15 = 4294967293LL;
  if (a1)
  {
    if (a3)
    {
      uint64_t v15 = 4294967293LL;
      if (a6)
      {
        if (a7)
        {
          uint64_t v19 = 24LL;
          __n128 Property_Serialize = LibSer_ContextCredentialGetProperty_Serialize(a3, a4, a5, &v20, &v19);
          if ((_DWORD)v16)
          {
            uint64_t v15 = v16;
          }

          else if (v19 == 24)
          {
            uint64_t v15 = a1(a2, 33LL, 0LL, &v20, 24LL, a6, a7, Property_Serialize);
            if (!(_DWORD)v15)
            {
              unsigned int v14 = 10;
              goto LABEL_11;
            }
          }

          else
          {
            uint64_t v15 = 4294967291LL;
          }

          unsigned int v14 = 70;
        }
      }
    }
  }

LABEL_11:
  return v15;
}

  return v11;
}

uint64_t LibCall_ACMGlobalContextCredentialGetProperty( uint64_t (*a1)(uint64_t, uint64_t, void, int *, uint64_t, uint64_t, uint64_t), uint64_t a2, int a3, int a4, uint64_t a5, uint64_t a6)
{
  unsigned int v12 = 70;
  uint64_t v13 = 4294967293LL;
  if (a1 && a5 && a6)
  {
    uint64_t v16 = 8LL;
    uint64_t Property_Serialize = LibSer_GlobalContextCredentialGetProperty_Serialize(a3, a4, &v17, &v16);
    if ((_DWORD)Property_Serialize)
    {
      uint64_t v13 = Property_Serialize;
    }

    else if (v16 == 8)
    {
      uint64_t v13 = a1(a2, 27LL, 0LL, &v17, 8LL, a5, a6);
      if (!(_DWORD)v13)
      {
        unsigned int v12 = 10;
        goto LABEL_10;
      }
    }

    else
    {
      uint64_t v13 = 4294967291LL;
    }

    unsigned int v12 = 70;
  }

uint64_t LibCall_ACMContextVerifyPolicyEx( uint64_t (*a1)(uint64_t, uint64_t, void, _OWORD *, size_t, unsigned int *, unint64_t *), uint64_t a2, _OWORD *a3, char *__s1, uint64_t a5, _DWORD *a6, unsigned int a7, uint64_t a8, BOOL *a9, int **a10)
{
  unint64_t v31 = 4096LL;
  size_t __size = 0LL;
  size_t v29 = 0LL;
  __int16 v30 = 0LL;
  uint64_t v18 = 4294967293LL;
  if (!a3 || !__s1 || !a9)
  {
LABEL_18:
    if (!(_DWORD)v18) {
      goto LABEL_21;
    }
    goto LABEL_19;
  }

  uint64_t SerializedVerifyPolicySize = GetSerializedVerifyPolicySize((uint64_t)a3, __s1, a5, a8, a6, a7, &__size);
  if (!(_DWORD)SerializedVerifyPolicySize)
  {
    size_t v20 = __size;
    __int128 v21 = acm_mem_alloc_data(__size);
    acm_mem_alloc_info( "<data>",  v21,  v20,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c",  1257,  "LibCall_ACMContextVerifyPolicyEx");
    if (v21)
    {
      uint64_t v22 = SerializeVerifyPolicy(a3, __s1, a5, a8, a6, a7, v21, &__size);
      if ((_DWORD)v22)
      {
        uint64_t v18 = v22;
        uint64_t v23 = 0LL;
      }

      else
      {
        uint64_t v23 = (unsigned int *)acm_mem_alloc_data(0x1000uLL);
        acm_mem_alloc_info( "<data>",  v23,  4096LL,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c",  1263,  "LibCall_ACMContextVerifyPolicyEx");
        if (v23)
        {
          uint64_t v24 = a1(a2, 3LL, 0LL, v21, __size, v23, &v31);
          if ((_DWORD)v24)
          {
            uint64_t v18 = v24;
          }

          else
          {
            unint64_t v25 = v31 - 4;
            if (v31 < 4)
            {
              uint64_t v18 = 4294967291LL;
            }

            else
            {
              *a9 = *v23 != 0;
              if (a10)
              {
                uint64_t v18 = DeserializeRequirement(v23 + 1, v25, (void **)&v30, &v29);
                if (!(_DWORD)v18) {
                  *a10 = v30;
                }
              }

              else
              {
                uint64_t v18 = 0LL;
              }
            }
          }
        }

        else
        {
          uint64_t v18 = 4294967292LL;
        }
      }

      size_t v26 = __size;
      acm_mem_free_info( "<data>",  v21,  __size,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c",  1288,  "LibCall_ACMContextVerifyPolicyEx");
      acm_mem_free_data(v21, v26);
      if (v23)
      {
        acm_mem_free_info( "<data>",  v23,  0x1000uLL,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c",  1291,  "LibCall_ACMContextVerifyPolicyEx");
        acm_mem_free_data(v23, 0x1000uLL);
      }
    }

    else
    {
      uint64_t v18 = 4294967292LL;
    }

    goto LABEL_18;
  }

  uint64_t v18 = SerializedVerifyPolicySize;
LABEL_19:
  if (v30) {
    Util_DeallocRequirement(v30);
  }
LABEL_21:
  if ((_DWORD)v18) {
    unsigned int v27 = 70;
  }
  else {
    unsigned int v27 = 10;
  }
  return v18;
}

uint64_t LibCall_ACMGlobalContextVerifyPolicyEx( uint64_t (*a1)(uint64_t, uint64_t, void, _OWORD *, size_t, unsigned int *, unint64_t *), uint64_t a2, char *a3, uint64_t a4, _DWORD *a5, unsigned int a6, BOOL *a7, int **a8)
{
  *(void *)size_t v20 = 0LL;
  uint64_t v16 = LibCall_ACMContextCreate( (uint64_t (*)(uint64_t, uint64_t, void, void, void, _BYTE *, uint64_t *))a1,  a2,  v20,  0LL,  1);
  if (!(_DWORD)v16) {
    uint64_t v16 = LibCall_ACMContextVerifyPolicyEx(a1, a2, *(_OWORD **)v20, a3, a4, a5, a6, 0xFFFFFFFFLL, a7, a8);
  }
  uint64_t v17 = v16;
  if (*(void *)v20) {
    LibCall_ACMContextDelete( (void (*)(uint64_t, uint64_t, void, void *, uint64_t, void, void))a1,  a2,  *(void **)v20,  1);
  }
  if ((_DWORD)v17) {
    unsigned int v18 = 70;
  }
  else {
    unsigned int v18 = 10;
  }
  return v17;
}

uint64_t LibCall_ACMGetEnvironmentVariable( uint64_t (*a1)(uint64_t, uint64_t, void, int *, uint64_t, uint64_t, uint64_t), uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  int v12 = a3;
  unsigned int v9 = 70;
  uint64_t v10 = 4294967293LL;
  if (a1 && a4 && a5)
  {
    uint64_t v10 = a1(a2, 25LL, 0LL, &v12, 4LL, a4, a5);
    if ((_DWORD)v10) {
      unsigned int v9 = 70;
    }
    else {
      unsigned int v9 = 10;
    }
  }

  return v10;
}

uint64_t LibCall_ACMSetEnvironmentVariable( uint64_t (*a1)(uint64_t, uint64_t, void, char *, size_t, void, void), uint64_t a2, int a3, _OWORD *a4, _OWORD *a5, uint64_t a6, const void *a7, size_t a8)
{
  uint64_t v15 = a1;
  if (gACMLoggingLevel <= 0xAu) {
    a1 = (uint64_t (*)(uint64_t, uint64_t, void, char *, size_t, void, void))printf( "%s: %s: called.\n",  "ACM",  "LibCall_ACMSetEnvironmentVariable");
  }
  if (v15 && a6 == 16LL * (a5 != 0LL) && (a7 ? (BOOL v16 = a8 - 129 < 0xFFFFFFFFFFFFFF80LL) : (BOOL v16 = a8 != 0), !v16))
  {
    __chkstk_darwin(a1);
    uint64_t v17 = (char *)&v21 - ((a8 + 59) & 0xFFFFFFFFFFFFFFF0LL);
    *(_DWORD *)uint64_t v17 = a3;
    *((_DWORD *)v17 + 1) = 2;
    *((_DWORD *)v17 + 2) = a8;
    *(_OWORD *)(v17 + 12) = 0u;
    *(_OWORD *)(v17 + 2_Block_object_dispose(va, 8) = 0u;
    if (a4) {
      *(_OWORD *)(v17 + 12) = *a4;
    }
    if (a5) {
      *(_OWORD *)(v17 + 2_Block_object_dispose(va, 8) = *a5;
    }
    if (a8) {
      memcpy(v17 + 44, a7, a8);
    }
    uint64_t v18 = v15(a2, 44LL, 0LL, (char *)&v21 - ((a8 + 59) & 0xFFFFFFFFFFFFFFF0LL), a8 + 44, 0LL, 0LL);
    if ((_DWORD)v18) {
      unsigned int v19 = 70;
    }
    else {
      unsigned int v19 = 10;
    }
  }

  else
  {
    unsigned int v19 = 70;
    uint64_t v18 = 4294967293LL;
  }

  return v18;
}

uint64_t LibCall_ACMTRMLoadState( uint64_t (*a1)(uint64_t, uint64_t, void, void, void, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  unsigned int v8 = 70;
  uint64_t v9 = 4294967293LL;
  if (a1 && a3 && a4)
  {
    uint64_t v9 = a1(a2, 38LL, 0LL, 0LL, 0LL, a3, a4);
    if ((_DWORD)v9) {
      unsigned int v8 = 70;
    }
    else {
      unsigned int v8 = 10;
    }
  }

  return v9;
}

uint64_t LibCall_ACMTRMSaveState( uint64_t (*a1)(uint64_t, uint64_t, void, uint64_t, uint64_t, void, void), uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  if (a1)
  {
    BOOL v10 = (unint64_t)(a4 - 8193) < 0xFFFFFFFFFFFFE000LL;
    if (!a3) {
      BOOL v10 = a4 != 0;
    }
    unsigned int v11 = 70;
    if (!v10)
    {
      if (a5) {
        uint64_t v12 = 43LL;
      }
      else {
        uint64_t v12 = 39LL;
      }
      uint64_t v13 = a1(a2, v12, 0LL, a3, a4, 0LL, 0LL);
      if ((_DWORD)v13) {
        unsigned int v11 = 70;
      }
      else {
        unsigned int v11 = 10;
      }
      goto LABEL_13;
    }
  }

  else
  {
    unsigned int v11 = 70;
  }

  uint64_t v13 = 4294967293LL;
LABEL_13:
  return v13;
}

uint64_t LibCall_ACMContextLoadFromImage( uint64_t (*a1)(uint64_t, uint64_t, void, char *, uint64_t, _OWORD *, unint64_t *), uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  unsigned int v10 = 70;
  uint64_t v11 = 4294967293LL;
  if (a1 && a3 && (unint64_t)(a4 - 4097) >= 0xFFFFFFFFFFFFF000LL)
  {
    uint64_t v12 = acm_mem_alloc(0x14uLL);
    acm_mem_alloc_info( "ACMHandleWithPayload",  v12,  20LL,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c",  1447,  "LibCall_ACMContextLoadFromImage");
    if (v12)
    {
      bzero(v20, 0x1005uLL);
      char v19 = 1;
      *(_WORD *)&v20[1] = 6;
      __int16 v21 = a4;
      __memcpy_chk(&v22, a3, a4, 4096LL);
      memset(v17, 0, sizeof(v17));
      uint64_t v18 = 0LL;
      unint64_t v16 = 280LL;
      uint64_t v13 = a1(a2, 48LL, 0LL, &v19, 4102LL, v17, &v16);
      if ((_DWORD)v13)
      {
        uint64_t v11 = v13;
      }

      else if (v16 < 0x18)
      {
        uint64_t v11 = 4294967291LL;
      }

      else
      {
        if (LOBYTE(v17[0]))
        {
          uint64_t v11 = 0LL;
          int v14 = DWORD1(v17[1]);
          *(_OWORD *)uint64_t v12 = *(_OWORD *)((char *)v17 + 4);
          v12[4] = v14;
          *a5 = v12;
          unsigned int v10 = 10;
          goto LABEL_11;
        }

        uint64_t v11 = 4294967280LL;
      }

      acm_mem_free_info( "ACMHandleWithPayload",  v12,  0x14uLL,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c",  1508,  "LibCall_ACMContextLoadFromImage");
      acm_mem_free(v12, 0x14uLL);
      unsigned int v10 = 70;
    }

    else
    {
      unsigned int v10 = 70;
      uint64_t v11 = 4294967292LL;
    }
  }

uint64_t LibCall_ACMContextUnloadToImage( uint64_t (*a1)(uint64_t, uint64_t, void, int *, uint64_t, _BYTE *, int *), uint64_t a2, __int128 *a3, void *a4, void *a5)
{
  unsigned int v10 = 70;
  uint64_t v11 = 4294967293LL;
  if (a1 && a4 && a5)
  {
    int v19 = 1310721;
    if (a3) {
      __int128 v20 = *a3;
    }
    else {
      __int128 v20 = 0uLL;
    }
    bzero(v16, 0x1106uLL);
    *(void *)uint64_t v15 = 4358LL;
    uint64_t v12 = a1(a2, 49LL, 0LL, &v19, 20LL, v16, v15);
    if ((_DWORD)v12)
    {
      uint64_t v11 = v12;
LABEL_18:
      unsigned int v10 = 70;
      goto LABEL_14;
    }

    if (*(void *)v15 < 6uLL)
    {
      unsigned int v10 = 70;
      uint64_t v11 = 4294967291LL;
    }

    else
    {
      if (v16[0])
      {
        uint64_t v14 = v17;
        uint64_t v11 = Util_ReadFromBuffer((uint64_t)v16, *(size_t *)v15, &v14, a4, (unsigned __int16)__n);
        if (!(_DWORD)v11)
        {
          *a5 = v14 - v17;
          unsigned int v10 = 10;
          goto LABEL_14;
        }

        goto LABEL_18;
      }

      unsigned int v10 = 70;
      uint64_t v11 = 4294967280LL;
    }
  }

LABEL_14:
  return v11;
}

uint64_t LibCall_ACMContextSetData( uint64_t (*a1)(uint64_t, uint64_t, void, void *, size_t, void, void), uint64_t a2, _OWORD *a3, int a4, _DWORD *a5, unsigned int a6, const void *a7, size_t a8)
{
  size_t __size = 0LL;
  unsigned int v16 = 70;
  uint64_t v17 = 4294967293LL;
  if (a1 && a3)
  {
    if ((a7 != 0LL) != (a8 != 0))
    {
      unsigned int v16 = 70;
      uint64_t v17 = 4294967293LL;
    }

    else if (a8 > 0xE00)
    {
      unsigned int v16 = 70;
      uint64_t v17 = 4294967276LL;
    }

    else
    {
      uint64_t Size = LibSer_StorageSetData_GetSize(a8, a5, a6, &__size);
      if ((_DWORD)Size)
      {
        uint64_t v17 = Size;
        unsigned int v16 = 70;
      }

      else
      {
        size_t v19 = __size;
        __int128 v20 = acm_mem_alloc_data(__size);
        acm_mem_alloc_info( "<data>",  v20,  v19,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c",  1593,  "LibCall_ACMContextSetData");
        if (v20)
        {
          uint64_t v21 = LibSer_StorageSetData_Serialize(a3, a4, a7, a8, a5, a6, (uint64_t)v20, &__size);
          if (!(_DWORD)v21) {
            uint64_t v21 = a1(a2, 40LL, 0LL, v20, __size, 0LL, 0LL);
          }
          uint64_t v17 = v21;
          size_t v22 = __size;
          acm_mem_free_info( "<data>",  v20,  __size,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c",  1605,  "LibCall_ACMContextSetData");
          acm_mem_free_data(v20, v22);
          if ((_DWORD)v17) {
            unsigned int v16 = 70;
          }
          else {
            unsigned int v16 = 10;
          }
        }

        else
        {
          unsigned int v16 = 70;
          uint64_t v17 = 4294967292LL;
        }
      }
    }
  }

  return v17;
}

uint64_t LibCall_ACMContextGetData( uint64_t (*a1)(uint64_t, uint64_t, void, void *, size_t, uint64_t, uint64_t), uint64_t a2, _OWORD *a3, int a4, char a5, _DWORD *a6, unsigned int a7, uint64_t a8, uint64_t a9)
{
  if (gACMLoggingLevel <= 0xAu)
  {
    uint64_t v16 = a8;
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextGetData");
    a8 = v16;
  }

  size_t __size = 0LL;
  unsigned int v17 = 70;
  uint64_t v18 = 4294967293LL;
  if (a1)
  {
    uint64_t v26 = a2;
    if (a3)
    {
      uint64_t v18 = 4294967293LL;
      if (a8)
      {
        if (a9)
        {
          uint64_t v19 = a8;
          uint64_t Size = LibSer_StorageGetData_GetSize(a6, a7, &__size);
          if ((_DWORD)Size)
          {
            uint64_t v18 = Size;
            unsigned int v17 = 70;
          }

          else
          {
            size_t v21 = __size;
            size_t v22 = acm_mem_alloc_data(__size);
            acm_mem_alloc_info( "<data>",  v22,  v21,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c",  1628,  "LibCall_ACMContextGetData");
            if (v22)
            {
              uint64_t Data_Serialize = LibSer_StorageGetData_Serialize(a3, a4, a5, a6, a7, (uint64_t)v22, &__size);
              if (!(_DWORD)Data_Serialize) {
                uint64_t Data_Serialize = a1(v26, 41LL, 0LL, v22, __size, v19, a9);
              }
              uint64_t v18 = Data_Serialize;
              size_t v24 = __size;
              acm_mem_free_info( "<data>",  v22,  __size,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c",  1640,  "LibCall_ACMContextGetData");
              acm_mem_free_data(v22, v24);
              if ((_DWORD)v18) {
                unsigned int v17 = 70;
              }
              else {
                unsigned int v17 = 10;
              }
            }

            else
            {
              unsigned int v17 = 70;
              uint64_t v18 = 4294967292LL;
            }
          }
        }
      }
    }
  }

  return v18;
}

uint64_t LibCall_ACMPublishTrustedAccessories( uint64_t (*a1)(uint64_t, uint64_t, void, char *, size_t, void, void), uint64_t a2, const void *a3, size_t a4)
{
  uint64_t v7 = a1;
  if (gACMLoggingLevel <= 0xAu) {
    a1 = (uint64_t (*)(uint64_t, uint64_t, void, char *, size_t, void, void))printf( "%s: %s: called.\n",  "ACM",  "LibCall_ACMPublishTrustedAccessories");
  }
  if (v7)
  {
    if (a3) {
      BOOL v8 = 1;
    }
    else {
      BOOL v8 = a4 == 0;
    }
    char v9 = !v8;
    unsigned int v10 = 70;
    uint64_t v11 = 4294967293LL;
    if ((a4 & 0xF) == 0 && a4 <= 0x100 && (v9 & 1) == 0)
    {
      __chkstk_darwin(a1);
      uint64_t v12 = (_DWORD *)((char *)&v14 - ((a4 + 23) & 0xFFFFFFFFFFFFFFF0LL));
      _DWORD *v12 = 1;
      v12[1] = a4;
      if (a4) {
        memcpy(v12 + 2, a3, a4);
      }
      uint64_t v11 = v7(a2, 45LL, 0LL, (char *)&v14 - ((a4 + 23) & 0xFFFFFFFFFFFFFFF0LL), a4 + 8, 0LL, 0LL);
      if ((_DWORD)v11) {
        unsigned int v10 = 70;
      }
      else {
        unsigned int v10 = 10;
      }
    }
  }

  else
  {
    unsigned int v10 = 70;
    uint64_t v11 = 4294967293LL;
  }

  return v11;
}

uint64_t LibCall_ACMContextGetInfo( uint64_t (*a1)(uint64_t, uint64_t, void, int *, uint64_t, _OWORD *, unint64_t *), uint64_t a2, __int128 *a3, int a4, void *a5)
{
  unsigned int v10 = 70;
  uint64_t v11 = 4294967293LL;
  if (a3 && a1 && a5)
  {
    int v16 = 1;
    int v18 = a4;
    __int128 v17 = *a3;
    memset(v15, 0, 140);
    unint64_t v14 = 140LL;
    uint64_t v12 = a1(a2, 46LL, 0LL, &v16, 24LL, v15, &v14);
    if ((_DWORD)v12)
    {
      uint64_t v11 = v12;
    }

    else if (v14 < 0xC)
    {
      uint64_t v11 = 4294967291LL;
    }

    else
    {
      if (LODWORD(v15[0]))
      {
        uint64_t v11 = 0LL;
        *a5 = *(void *)((char *)v15 + 4);
        unsigned int v10 = 10;
        goto LABEL_10;
      }

      uint64_t v11 = 4294967281LL;
    }

    unsigned int v10 = 70;
  }

uint64_t verifyAclConstraintInternal( uint64_t (*a1)(uint64_t, uint64_t, void, void *, size_t, unsigned int *, unint64_t *), uint64_t a2, uint64_t a3, _OWORD *a4, const void *a5, uint64_t a6, const void *a7, unsigned int a8, unsigned __int8 a9, _DWORD *a10, unsigned int a11, unsigned int a12, BOOL *a13, int **a14)
{
  size_t v36 = 0LL;
  unint64_t v34 = 0LL;
  unint64_t v35 = 4096LL;
  size_t v33 = 0LL;
  uint64_t v20 = 4294967293LL;
  if (!a4 || !a5 || !a6 || !a13)
  {
LABEL_19:
    if (!(_DWORD)v20) {
      goto LABEL_22;
    }
    goto LABEL_20;
  }

  SerializedVerifyAclConstraintuint64_t Size = GetSerializedVerifyAclConstraintSize( a3,  (uint64_t)a4,  (uint64_t)a5,  a6,  (uint64_t)a7,  a8,  a9,  a12,  a10,  a11,  &v36);
  if (!(_DWORD)SerializedVerifyAclConstraintSize)
  {
    uint64_t v22 = v36;
    uint64_t v23 = acm_mem_alloc_data(v36);
    acm_mem_alloc_info( "<data>",  v23,  v22,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c",  1929,  "verifyAclConstraintInternal");
    if (v23)
    {
      uint64_t v24 = SerializeVerifyAclConstraint(a3, a4, a5, a6, a7, a8, a9, a12, a10, a11, (uint64_t)v23, &v36);
      if ((_DWORD)v24)
      {
        uint64_t v20 = v24;
        unint64_t v25 = 0LL;
      }

      else
      {
        unint64_t v25 = (unsigned int *)acm_mem_alloc_data(0x1000uLL);
        acm_mem_alloc_info( "<data>",  v25,  4096LL,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c",  1935,  "verifyAclConstraintInternal");
        if (v25)
        {
          uint64_t v26 = a1(a2, a3, 0LL, v23, v36, v25, &v35);
          if ((_DWORD)v26)
          {
            uint64_t v20 = v26;
          }

          else
          {
            unint64_t v27 = v35 - 4;
            if (v35 < 4)
            {
              uint64_t v20 = 4294967291LL;
            }

            else
            {
              *a13 = *v25 != 0;
              if (a14)
              {
                uint64_t v20 = DeserializeRequirement(v25 + 1, v27, (void **)&v34, &v33);
                if (!(_DWORD)v20) {
                  *a14 = v34;
                }
              }

              else
              {
                uint64_t v20 = 0LL;
              }
            }
          }
        }

        else
        {
          uint64_t v20 = 4294967292LL;
        }
      }

      rsize_t v28 = v36;
      acm_mem_free_info( "<data>",  v23,  v36,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c",  1958,  "verifyAclConstraintInternal");
      acm_mem_free_data(v23, v28);
      if (v25)
      {
        acm_mem_free_info( "<data>",  v25,  0x1000uLL,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c",  1961,  "verifyAclConstraintInternal");
        acm_mem_free_data(v25, 0x1000uLL);
      }
    }

    else
    {
      uint64_t v20 = 4294967292LL;
    }

    goto LABEL_19;
  }

  uint64_t v20 = SerializedVerifyAclConstraintSize;
LABEL_20:
  if (v34) {
    Util_DeallocRequirement(v34);
  }
LABEL_22:
  if ((_DWORD)v20) {
    unsigned int v29 = 70;
  }
  else {
    unsigned int v29 = 10;
  }
  return v20;
}

uint64_t LibCall_ACMSecContextProcessAcl( uint64_t (*a1)(uint64_t, uint64_t, void, char *, uint64_t, int *, uint64_t *), uint64_t a2, _OWORD *a3, unsigned __int8 *a4, uint64_t a5, unsigned __int8 *a6, uint64_t a7, _DWORD *a8, unsigned int a9, unsigned int a10, _DWORD *a11, BOOL *a12)
{
  return sub_1E874(a1, a2, 12, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, 0LL, 0LL);
}

uint64_t sub_1E874( uint64_t (*a1)(uint64_t, uint64_t, void, char *, uint64_t, int *, uint64_t *), uint64_t a2, int a3, _OWORD *a4, unsigned __int8 *a5, uint64_t a6, unsigned __int8 *a7, uint64_t a8, _DWORD *a9, unsigned int a10, unsigned int a11, _DWORD *a12, BOOL *a13, void *a14, unint64_t *a15)
{
  unsigned int v19 = gACMLoggingLevel;
  if (gACMLoggingLevel <= 0xAu)
  {
    printf("%s: %s: called.\n", "ACM", "processAclCommandInternal");
    unsigned int v19 = gACMLoggingLevel;
  }

  if (v19 <= 0x14)
  {
    printf("%s: %s: command = %u.\n", "ACM", "processAclCommandInternal", a3);
    unsigned int v19 = gACMLoggingLevel;
    if (gACMLoggingLevel <= 0x14u)
    {
      printf("%s: %s: context = %p.\n", "ACM", "processAclCommandInternal", a4);
      unsigned int v19 = gACMLoggingLevel;
      if (gACMLoggingLevel <= 0x14u)
      {
        printf("%s: %s: acl = %p, aclLength = %zu.\n", "ACM", "processAclCommandInternal", a5, a6);
        unsigned int v19 = gACMLoggingLevel;
        if (gACMLoggingLevel <= 0x14u)
        {
          printf("%s: %s (len=%u): acl:", "ACM", "processAclCommandInternal", a6);
          unsigned int v19 = gACMLoggingLevel;
        }
      }
    }
  }

  if (a6)
  {
    uint64_t v20 = a6;
    size_t v21 = a5;
    do
    {
      if (v19 <= 0x14)
      {
        printf("%02x ", *v21);
        unsigned int v19 = gACMLoggingLevel;
      }

      ++v21;
      --v20;
    }

    while (v20);
  }

  if (v19 < 0x15)
  {
    putchar(10);
    unsigned int v19 = gACMLoggingLevel;
    if (gACMLoggingLevel <= 0x14u)
    {
      printf("%s: %s: operation = %p, operationLength = %zu.\n", "ACM", "processAclCommandInternal", a7, a8);
      unsigned int v19 = gACMLoggingLevel;
      if (gACMLoggingLevel <= 0x14u)
      {
        printf("%s: %s (len=%u): operation:", "ACM", "processAclCommandInternal", a8);
        unsigned int v19 = gACMLoggingLevel;
      }
    }
  }

  int v39 = a3;
  if (a8)
  {
    uint64_t v22 = a8;
    uint64_t v23 = a7;
    do
    {
      if (v19 <= 0x14)
      {
        printf("%02x ", *v23);
        unsigned int v19 = gACMLoggingLevel;
      }

      ++v23;
      --v22;
    }

    while (v22);
  }

  if (v19 < 0x15)
  {
    putchar(10);
    if (gACMLoggingLevel <= 0x14u)
    {
      printf("%s: %s: parameters = %p, parameterCount = %u.\n", "ACM", "processAclCommandInternal", a9, a10);
      if (gACMLoggingLevel <= 0x14u)
      {
        printf("%s: %s: maxGlobalCredentialAge = %u.\n", "ACM", "processAclCommandInternal", a11);
        if (gACMLoggingLevel <= 0x14u)
        {
          printf("%s: %s: constraintState = %p.\n", "ACM", "processAclCommandInternal", a12);
        }
      }
    }
  }

  if (a7 || a9 || a12)
  {
    if (a5) {
      BOOL v26 = a6 == 0;
    }
    else {
      BOOL v26 = 1;
    }
    int v27 = v26;
    unsigned int v24 = 70;
    uint64_t v25 = 4294967293LL;
    if (!a7) {
      goto LABEL_79;
    }
    if (!a8) {
      goto LABEL_79;
    }
    if (v27) {
      goto LABEL_79;
    }
    unsigned int v24 = 70;
    uint64_t v25 = 4294967293LL;
    if ((a9 != 0LL) != (a10 != 0) || !a12) {
      goto LABEL_79;
    }
    size_t v45 = 0LL;
    unint64_t v44 = 4096LL;
    uint64_t SerializedProcessAclSize = GetSerializedProcessAclSize( (uint64_t)a4,  (uint64_t)a5,  a6,  (uint64_t)a7,  a8,  a11,  a9,  a10,  &v45);
    if ((_DWORD)SerializedProcessAclSize)
    {
      uint64_t v25 = SerializedProcessAclSize;
      unsigned int v37 = 70;
      goto LABEL_74;
    }

    uint64_t v29 = v45;
    __int16 v30 = acm_mem_alloc_data(v45);
    acm_mem_alloc_info( "<data>",  v30,  v29,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c",  1776,  "processAclInternal");
    if (!v30)
    {
      unsigned int v37 = 70;
      uint64_t v25 = 4294967292LL;
      goto LABEL_74;
    }

    unint64_t v44 = 4096LL;
    unint64_t v31 = acm_mem_alloc_data(0x1000uLL);
    acm_mem_alloc_info( "<data>",  v31,  4096LL,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c",  1780,  "processAclInternal");
    if (!v31)
    {
      unint64_t v35 = 0LL;
      unint64_t v34 = 0LL;
      uint64_t v25 = 4294967292LL;
      goto LABEL_68;
    }

    uint64_t v32 = SerializeProcessAcl(a4, a5, a6, a7, a8, a11, a9, a10, (uint64_t)v30, &v45);
    if ((_DWORD)v32 || (uint64_t v32 = a1(a2, v39, 0LL, (char *)v30, v45, v31, (uint64_t *)&v44), (_DWORD)v32))
    {
      uint64_t v25 = v32;
      unint64_t v34 = 0LL;
      unint64_t v35 = 0LL;
      goto LABEL_67;
    }

    unint64_t v33 = v44;
    if (v44 >= 8)
    {
      *a12 = *v31;
      if (a13) {
        *a13 = v31[1] != 0;
      }
      uint64_t v25 = 0LL;
      unint64_t v34 = 0LL;
      if (v39 != 30 || !a14)
      {
        unint64_t v35 = 0LL;
        goto LABEL_67;
      }

      unint64_t v35 = 0LL;
      if (!a15)
      {
LABEL_67:
        acm_mem_free_info( "<data>",  v31,  0x1000uLL,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c",  1817,  "processAclInternal");
        acm_mem_free_data(v31, 0x1000uLL);
LABEL_68:
        rsize_t v36 = v45;
        acm_mem_free_info( "<data>",  v30,  v45,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c",  1821,  "processAclInternal");
        acm_mem_free_data(v30, v36);
        if ((_DWORD)v25 && v35)
        {
          acm_mem_free_info( "<data>",  v35,  v34,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c",  1825,  "processAclInternal");
          acm_mem_free_data(v35, v34);
          unsigned int v37 = 70;
        }

        else if ((_DWORD)v25)
        {
          unsigned int v37 = 70;
        }

        else
        {
          unsigned int v37 = 10;
        }

LABEL_74:
        goto LABEL_76;
      }

      if (v33 >= 0xC)
      {
        unint64_t v34 = v31[2];
        if ((_DWORD)v34)
        {
          if (v33 >= v34 + 12)
          {
            unint64_t v35 = acm_mem_alloc_data(v31[2]);
            acm_mem_alloc_info( "<data>",  v35,  v34,  "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c",  1805,  "processAclInternal");
            if (v35)
            {
              memcpy(v35, v31 + 3, v34);
              uint64_t v25 = 0LL;
              *a14 = v35;
              *a15 = v34;
            }

            else
            {
              uint64_t v25 = 4294967292LL;
            }

            goto LABEL_67;
          }

          goto LABEL_84;
        }

        unint64_t v34 = 0LL;
        unint64_t v35 = 0LL;
        uint64_t v25 = 0LL;
        goto LABEL_67;
      }
    }

    unint64_t v34 = 0LL;
LABEL_84:
    unint64_t v35 = 0LL;
    uint64_t v25 = 4294967291LL;
    goto LABEL_67;
  }

  if (a4)
  {
    unsigned int v24 = 70;
    uint64_t v25 = 4294967293LL;
    goto LABEL_79;
  }

  unsigned int v24 = 70;
  uint64_t v25 = 4294967293LL;
  if (a5 && a13 && a6)
  {
    uint64_t v25 = sub_1F99C(a1, a2, a5, a6, a13);
LABEL_76:
    if ((_DWORD)v25) {
      unsigned int v24 = 70;
    }
    else {
      unsigned int v24 = 10;
    }
  }

LABEL_79:
  return v25;
}

uint64_t LibCall_ACMSecContextProcessAclAndCopyAuthMethod( uint64_t (*a1)(uint64_t, uint64_t, void, char *, uint64_t, int *, uint64_t *), uint64_t a2, _OWORD *a3, unsigned __int8 *a4, uint64_t a5, unsigned __int8 *a6, uint64_t a7, _DWORD *a8, unsigned int a9, unsigned int a10, _DWORD *a11, BOOL *a12, void *a13, unint64_t *a14)
{
  return sub_1E874(a1, a2, 30, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14);
}

uint64_t LibCall_ACMSecContextVerifyAclConstraintAndCopyRequirement( uint64_t (*a1)(uint64_t, uint64_t, void, void *, size_t, unsigned int *, unint64_t *), uint64_t a2, _OWORD *a3, const void *a4, uint64_t a5, const void *a6, unsigned int a7, unsigned __int8 a8, _DWORD *a9, unsigned int a10, unsigned int a11, BOOL *a12, int **a13)
{
  unsigned int v21 = 70;
  uint64_t v22 = 4294967293LL;
  if (a3)
  {
    if (a4)
    {
      if (a5)
      {
        unsigned int v21 = 70;
        uint64_t v22 = 4294967293LL;
        if ((a9 != 0LL) == (a10 != 0))
        {
          if (a12)
          {
            uint64_t v22 = verifyAclConstraintInternal(a1, a2, 11LL, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13);
            if ((_DWORD)v22) {
              unsigned int v21 = 70;
            }
            else {
              unsigned int v21 = 10;
            }
          }
        }
      }
    }
  }

  if (v21 >= gACMLoggingLevel) {
    printf( "%s: %s: returning, err = %ld.\n",  "ACM",  "LibCall_ACMSecContextVerifyAclConstraintAndCopyRequirement",  (int)v22);
  }
  return v22;
}

uint64_t LibCall_ACMSecCredentialProviderEnrollmentStateChangedForUser( uint64_t (*a1)(uint64_t, uint64_t, void, char *, uint64_t, void, void), uint64_t a2, const void *a3, unsigned int a4, _OWORD *a5, uint64_t a6, int a7, _OWORD *a8, uint64_t a9)
{
  int v16 = a1;
  if (gACMLoggingLevel <= 0xAu) {
    a1 = (uint64_t (*)(uint64_t, uint64_t, void, char *, uint64_t, void, void))printf( "%s: %s: called.\n",  "ACM",  "LibCall_ACMSecCredentialPr oviderEnrollmentStateChangedForUser");
  }
  BOOL v17 = a4 - 113 < 0xFFFFFF90;
  if (!a3) {
    BOOL v17 = a4 != 0;
  }
  if (v17)
  {
    unsigned int v18 = 70;
    uint64_t v19 = 4294967293LL;
  }

  else
  {
    unsigned int v18 = 70;
    uint64_t v19 = 4294967293LL;
    if (a8)
    {
      if (a9 == 16)
      {
        uint64_t v19 = 4294967293LL;
        if (a5)
        {
          if (a6 == 16)
          {
            uint64_t v20 = a4 + 36LL;
            __chkstk_darwin(a1);
            uint64_t v22 = (char *)&v24 - ((v21 + 51) & 0x1FFFFFFF0LL);
            *(_DWORD *)uint64_t v22 = a7;
            *(_OWORD *)(v22 + 4) = *a8;
            *(_OWORD *)(v22 + 20) = *a5;
            if (a3) {
              memcpy(v22 + 36, a3, v21);
            }
            uint64_t v19 = v16(a2, 14LL, 0LL, v22, v20, 0LL, 0LL);
            if ((_DWORD)v19) {
              unsigned int v18 = 70;
            }
            else {
              unsigned int v18 = 10;
            }
          }
        }
      }
    }
  }

  if (v18 >= gACMLoggingLevel) {
    printf( "%s: %s: returning, err = %ld.\n",  "ACM",  "LibCall_ACMSecCredentialProviderEnrollmentStateChangedForUser",  (int)v19);
  }
  return v19;
}

uint64_t LibCall_ACMSecSetBuiltinBiometry( uint64_t (*a1)(uint64_t, uint64_t, void, char *, size_t, void, void), uint64_t a2, char a3)
{
  char v9 = a3;
  uint64_t v5 = LibCall_ACMSetEnvironmentVariable(a1, a2, 30, 0LL, 0LL, 0LL, &v9, 1uLL);
  uint64_t v6 = v5;
  if ((_DWORD)v5) {
    unsigned int v7 = 70;
  }
  else {
    unsigned int v7 = 10;
  }
  return v6;
}

uint64_t LibCall_ACMSecSetBiometryAvailability( uint64_t (*a1)(uint64_t, uint64_t, void, int *, uint64_t, uint64_t, uint64_t), uint64_t a2, char a3, int a4)
{
  char v15 = 0;
  unint64_t v14 = 1LL;
  char v13 = 0;
  uint64_t v8 = LibCall_ACMGetEnvironmentVariable(a1, a2, 6, (uint64_t)&v15, (uint64_t)&v14);
  if ((_DWORD)v8)
  {
    uint64_t v11 = v8;
    unsigned int v9 = 70;
  }

  else
  {
    unsigned int v9 = 70;
    if (v14 > 1)
    {
      uint64_t v11 = 4294967291LL;
    }

    else
    {
      char v10 = v15 & ~a3;
      if (a4) {
        char v10 = v15 | a3;
      }
      char v13 = v10;
      uint64_t v11 = LibCall_ACMSetEnvironmentVariable( (uint64_t (*)(uint64_t, uint64_t, void, char *, size_t, void, void))a1,  a2,  6,  0LL,  0LL,  0LL,  &v13,  1uLL);
      if ((_DWORD)v11) {
        unsigned int v9 = 70;
      }
      else {
        unsigned int v9 = 10;
      }
    }
  }

  return v11;
}

uint64_t LibCall_ACMSecContextGetUnlockSecret( uint64_t (*a1)(void, void, void, void, void, void, void), uint64_t a2, _OWORD *a3, _DWORD *a4, unsigned int a5, void *a6, size_t *a7, _BYTE *a8)
{
  uint64_t v25 = 64LL;
  uint64_t v24 = 129LL;
  if (!a3) {
    goto LABEL_18;
  }
  unsigned int v16 = 70;
  uint64_t v17 = 4294967293LL;
  if (!a6 || !a7 || !a8) {
    goto LABEL_14;
  }
  if ((a4 != 0LL) != (a5 != 0))
  {
LABEL_18:
    unsigned int v16 = 70;
    uint64_t v17 = 4294967293LL;
    goto LABEL_14;
  }

  uint64_t UnlockSecret_Serialize = LibSer_GetUnlockSecret_Serialize(a3, a4, a5, v27, &v25);
  if ((_DWORD)UnlockSecret_Serialize
    || (uint64_t UnlockSecret_Serialize = a1(a2, 50LL, 0LL, v27, v25, v26, &v24), (_DWORD)UnlockSecret_Serialize)
    || (size_t __n = 0LL,
        __src = 0LL,
        char v21 = 0,
        uint64_t UnlockSecret_Serialize = LibSer_GetUnlockSecretResponse_Deserialize(v26, v24, &__src, &__n, &v21),
        (_DWORD)UnlockSecret_Serialize))
  {
    uint64_t v17 = UnlockSecret_Serialize;
  }

  else
  {
    size_t v19 = __n;
    if (*a7 < __n)
    {
      uint64_t v17 = 4294967276LL;
    }

    else
    {
      if (__src)
      {
        memcpy(a6, __src, __n);
        uint64_t v17 = 0LL;
        *a7 = v19;
        *a8 = v21;
        unsigned int v16 = 10;
        goto LABEL_14;
      }

      uint64_t v17 = 4294967291LL;
    }
  }

  unsigned int v16 = 70;
LABEL_14:
  return v17;
}

uint64_t LibCall_ACMSEPControl( uint64_t (*a1)(uint64_t, uint64_t, void, char *, uint64_t, unsigned int *, unint64_t *), uint64_t a2, const void *a3, size_t a4, uint64_t a5, _DWORD *a6, unsigned int a7, void *a8, size_t *a9)
{
  __int16 v30 = a8;
  unint64_t v33 = 1024LL;
  uint64_t v34 = 0LL;
  if (!a1) {
    goto LABEL_17;
  }
  BOOL v16 = a4 - 4097 < 0xFFFFFFFFFFFFF000LL;
  if (!a3) {
    BOOL v16 = a4 != 0;
  }
  if (v16)
  {
LABEL_17:
    unsigned int v25 = 70;
    uint64_t v24 = 4294967293LL;
    goto LABEL_21;
  }

  uint64_t Size = LibSer_SEPControl_GetSize(a4, a6, a7, &v34);
  if ((_DWORD)Size)
  {
LABEL_18:
    uint64_t v24 = Size;
LABEL_25:
    unsigned int v25 = 70;
    goto LABEL_21;
  }

  uint64_t v18 = a5;
  uint64_t v19 = a2;
  uint64_t v20 = (_OWORD *)__chkstk_darwin(v18);
  uint64_t v22 = (char *)&v29 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v23 = LibSer_SEPControl_Serialize(v20, a6, a7, a3, a4, (uint64_t)v22, &v34);
  if ((_DWORD)v23)
  {
    uint64_t v24 = v23;
    goto LABEL_20;
  }

  uint64_t v24 = a1(v19, 51LL, 0LL, v22, v34, v35, &v33);
  if ((_DWORD)v24)
  {
LABEL_20:
    unsigned int v25 = 70;
    goto LABEL_21;
  }

  unsigned int v25 = 10;
  BOOL v26 = v30;
  if (!v30 || !a9) {
    goto LABEL_21;
  }
  size_t v31 = 0LL;
  uint64_t v32 = 0LL;
  uint64_t Size = LibSer_SEPControlResponse_Deserialize(v35, v33, &v32, &v31);
  if ((_DWORD)Size) {
    goto LABEL_18;
  }
  size_t v27 = v31;
  if (*a9 < v31)
  {
    uint64_t v24 = 4294967276LL;
    goto LABEL_25;
  }

  if (v32) {
    memcpy(v26, v32, v31);
  }
  uint64_t v24 = 0LL;
  *a9 = v27;
  unsigned int v25 = 10;
LABEL_21:
  return v24;
}

uint64_t sub_1F99C( uint64_t (*a1)(uint64_t, uint64_t, void, char *, uint64_t, int *, uint64_t *), uint64_t a2, const void *a3, unsigned int a4, _BYTE *a5)
{
  int v19 = 0;
  uint64_t v18 = 4LL;
  size_t v10 = a4;
  uint64_t v11 = a4 + 4LL;
  __chkstk_darwin(a1);
  uint64_t v12 = (unsigned int *)((char *)&v17 - ((v10 + 19) & 0x1FFFFFFF0LL));
  unsigned int v13 = 70;
  uint64_t v14 = 4294967293LL;
  if (a3 && a5)
  {
    unsigned int *v12 = a4;
    memcpy(v12 + 1, a3, v10);
    uint64_t v15 = a1(a2, 17LL, 0LL, (char *)&v17 - ((v10 + 19) & 0x1FFFFFFF0LL), v11, &v19, &v18);
    if ((_DWORD)v15)
    {
      uint64_t v14 = v15;
      unsigned int v13 = 70;
    }

    else if (v18 == 4)
    {
      uint64_t v14 = 0LL;
      *a5 = 1;
      unsigned int v13 = 10;
    }

    else
    {
      unsigned int v13 = 70;
      uint64_t v14 = 4294967291LL;
    }
  }

  return v14;
}

void sub_1FB54()
{
  __assert_rtn("LibCall_ACMKernelControl", "LibCall.c", 373, "commandCursor == commandBuffer + sizeof(commandBuffer)");
}

void sub_1FB7C(int a1, int a2, os_log_t log)
{
  v3[0] = 67109376;
  v3[1] = a1;
  __int16 v4 = 1024;
  int v5 = a2;
  _os_log_fault_impl( &dword_0,  log,  OS_LOG_TYPE_FAULT,  "ACMContextDelete of ACMContext:%u failed: %d",  (uint8_t *)v3,  0xEu);
}

void sub_1FC00(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "unsupported requirement: %d", (uint8_t *)v2, 8u);
}

void sub_1FC74(uint64_t a1, int a2, os_log_t log)
{
  v3[0] = 67109378;
  v3[1] = a2;
  __int16 v4 = 2114;
  uint64_t v5 = a1;
  _os_log_error_impl( &dword_0,  log,  OS_LOG_TYPE_ERROR,  "Failed to remove credential of type %d: %{public}@",  (uint8_t *)v3,  0x12u);
}

uint64_t sub_1FCF8()
{
  unsigned __int8 v0 = dlerror();
  uint64_t v1 = abort_report_np("%s", v0);
  return sub_1FD18(v1);
}

uint64_t sub_1FD18()
{
  uint64_t v0 = abort_report_np("Unable to find class %s", "TKTokenSmartCardPINAuthOperation");
  return sub_1FD3C(v0);
}

uint64_t sub_1FD3C()
{
  uint64_t v0 = abort_report_np("Unable to find class %s", "TKTokenPasswordAuthOperation");
  return sub_1FD60(v0);
}

uint64_t sub_1FD60()
{
  uint64_t v0 = (os_log_s *)abort_report_np("Unable to find class %s", "TKClientToken");
  return sub_1FD84(v0);
}

void sub_1FD84(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( &dword_0,  log,  OS_LOG_TYPE_ERROR,  "Exceeded number of allocated contexts, will invalidate a context in the process that hoarded the most.",  v1,  2u);
}

void sub_1FDC4(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *a1;
  uint64_t v4 = *(void *)(*(void *)a2 + 24LL);
  v5[0] = 67109376;
  v5[1] = v3;
  __int16 v6 = 1024;
  int v7 = v4;
  _os_log_error_impl( &dword_0,  log,  OS_LOG_TYPE_ERROR,  "%d submechanisms required, but only %d can be made satisfied.",  (uint8_t *)v5,  0xEu);
}

id objc_msgSend__evaluateACL_operation_options_uiDelegate_originator_request_callerName_callerBundleId_reply_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_evaluateACL:operation:options:uiDelegate:originator:request:callerName:callerBundleId:reply:");
}

id objc_msgSend__evaluateOperation_aclRef_options_uiDelegate_originator_request_validate_callerName_callerBundleId_reply_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_evaluateOperation:aclRef:options:uiDelegate:originator:request:validate:callerName:callerBundleId:reply:");
}

id objc_msgSend__handleAcmRequirement_policy_constraintData_operation_internalInfo_uiDelegate_originator_request_reply_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_handleAcmRequirement:policy:constraintData:operation:internalInfo:uiDelegate:originator:request:reply:");
}

id objc_msgSend__handleCTKACL_tokenId_operation_options_originator_request_callerName_callerBundleId_reply_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleCTKACL:tokenId:operation:options:originator:request:callerName:callerBundleId:reply:");
}

id objc_msgSend__nonUiMechanismForACMRequirement_acmContextRecord_policy_internalInfo_request_state_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_nonUiMechanismForACMRequirement:acmContextRecord:policy:internalInfo:request:state:error:");
}

id objc_msgSend__nonUiSubmechanismsForACMRequirement_acmContextRecord_policy_internalInfo_request_requiredCount_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_nonUiSubmechanismsForACMRequirement:acmContextRecord:policy:internalInfo:request:requiredCount:error:");
}

id objc_msgSend__restrictedNonUiMechanism_availabilityEvents_policy_internalInfo_request_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_restrictedNonUiMechanism:availabilityEvents:policy:internalInfo:request:error:");
}

id objc_msgSend__validateACL_evaluateOperation_options_uiDelegate_originator_request_callerName_callerBundleId_reply_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_validateACL:evaluateOperation:options:uiDelegate:originator:request:callerName:callerBundleId:reply:");
}

id objc_msgSend__validateOperation_aclRef_evaluateOperation_options_uiDelegate_originator_request_reply_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_validateOperation:aclRef:evaluateOperation:options:uiDelegate:originator:request:reply:");
}

id objc_msgSend__validateOperations_aclRef_evaluateOperation_options_uiDelegate_originator_request_currentResult_reply_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_validateOperations:aclRef:evaluateOperation:options:uiDelegate:originator:request:currentResult:reply:");
}

id objc_msgSend__validatePassword_options_uiDelegate_originator_request_callerName_callerBundleId_reply_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_validatePassword:options:uiDelegate:originator:request:callerName:callerBundleId:reply:");
}

id objc_msgSend_authenticateForPolicy_constraintData_internalInfo_uiDelegate_originator_request_mechanism_reply_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "authenticateForPolicy:constraintData:internalInfo:uiDelegate:originator:request:mechanism:reply:");
}

id objc_msgSend_createInternalInfo_skipCallerIdentification_callerBundleId_request_originator_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createInternalInfo:skipCallerIdentification:callerBundleId:request:originator:");
}

id objc_msgSend_evaluateACL_operation_options_uiDelegate_originator_request_callerName_callerBundleId_reply_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "evaluateACL:operation:options:uiDelegate:originator:request:callerName:callerBundleId:reply:");
}

id objc_msgSend_finishedAuthenticationForPolicy_constraintData_operation_internalInfo_uiDelegate_originator_request_availabilityEvents_result_error_reply_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "finishedAuthenticationForPolicy:constraintData:operation:internalInfo:uiDelegate:originator:request:availabil ityEvents:result:error:reply:");
}

id objc_msgSend_mechanismForACMRequirement_acmContextRecord_policy_internalInfo_uiDelegate_originator_request_reply_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "mechanismForACMRequirement:acmContextRecord:policy:internalInfo:uiDelegate:originator:request:reply:");
}

id objc_msgSend_mechanismForApplicationPasswordMode_acmContextRecord_options_internalInfo_uiDelegate_originator_request_reply_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "mechanismForApplicationPasswordMode:acmContextRecord:options:internalInfo:uiDelegate:originator:request:reply:");
}

id objc_msgSend_mechanismWithK_ofSubmechanisms_serial_request_preserveStandaloneReorganizers_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mechanismWithK:ofSubmechanisms:serial:request:preserveStandaloneReorganizers:");
}

id objc_msgSend_preflightPolicy_parameters_parametersCount_maxGlobalCredentialAge_processRequirement_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preflightPolicy:parameters:parametersCount:maxGlobalCredentialAge:processRequirement:");
}

id objc_msgSend_verifyAclConstraint_operation_preflight_parameters_parametersCount_maxGlobalCredentialAge_processRequirement_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "verifyAclConstraint:operation:preflight:parameters:parametersCount:maxGlobalCredentialAge:processRequirement:");
}

id objc_msgSend_weakToStrongObjectsMapTable(void *a1, const char *a2, ...)
{
  return [a1 weakToStrongObjectsMapTable];
}