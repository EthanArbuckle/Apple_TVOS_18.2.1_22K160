@interface MechanismManagerACM
+ (MechanismManagerACM)sharedInstance;
- (BOOL)_deviceHasLidClosedPreventingUseOfTouchID;
- (BOOL)_deviceHasPearl;
- (BOOL)_shouldDisregardUserIdForPolicy:(int64_t)a3;
- (id)_buildUiForMechanism:(id)a3 policy:(int64_t)a4 internalInfo:(id)a5 uiDelegate:(id)a6 request:(id)a7 error:(id *)a8;
- (id)_evaluationModeForPolicy:(int64_t)a3;
- (id)_loadACMMechanism:(int64_t)a3 initParams:(id)a4 request:(id)a5 error:(id *)a6;
- (id)_loadACMMechanismFromPlugin:(int64_t)a3 acmContextRecord:(id)a4 internalInfo:(id)a5 request:(id)a6 error:(id *)a7;
- (id)_nonUiMechanismForACMRequirement:(const __ACMRequirement *)a3 acmContextRecord:(id)a4 policy:(int64_t)a5 internalInfo:(id)a6 request:(id)a7 state:(unsigned int *)a8 error:(id *)a9;
- (id)_nonUiSubmechanismsForACMRequirement:(const __ACMRequirement *)a3 acmContextRecord:(id)a4 policy:(int64_t)a5 internalInfo:(id)a6 request:(id)a7 requiredCount:(unint64_t *)a8 error:(id *)a9;
- (id)_preferedError:(id)a3;
- (id)_prepareInitParamsUsingInternalInfo:(id)a3 acmContextRecord:(id)a4;
- (id)_restrictedNonUiMechanism:(id)a3 availabilityEvents:(id *)a4 policy:(int64_t)a5 internalInfo:(id)a6 request:(id)a7 error:(id *)a8;
- (id)_sortedSubmechanisms:(id)a3;
- (unint64_t)_acmRequirementPropertyFlags:(__ACMRequirement *)a3;
- (unsigned)_acmPurposeForPolicy:(int64_t)a3;
- (unsigned)_acmRequirementState:(__ACMRequirement *)a3;
- (unsigned)_acmRequirementType:(__ACMRequirement *)a3;
- (void)_mechanismForACMRequirement:(const __ACMRequirement *)a3 acmContextRecord:(id)a4 policy:(int64_t)a5 internalInfo:(id)a6 uiDelegate:(id)a7 originator:(id)a8 request:(id)a9 reply:(id)a10;
- (void)mechanismForACMRequirement:(const __ACMRequirement *)a3 acmContextRecord:(id)a4 policy:(int64_t)a5 internalInfo:(id)a6 uiDelegate:(id)a7 originator:(id)a8 request:(id)a9 reply:(id)a10;
- (void)mechanismForApplicationPasswordMode:(int64_t)a3 acmContextRecord:(id)a4 options:(id)a5 internalInfo:(id)a6 uiDelegate:(id)a7 originator:(id)a8 request:(id)a9 reply:(id)a10;
@end

@implementation MechanismManagerACM

+ (MechanismManagerACM)sharedInstance
{
  if (qword_2CE78 != -1) {
    dispatch_once(&qword_2CE78, &stru_28B20);
  }
  return (MechanismManagerACM *)(id)qword_2CE70;
}

- (void)mechanismForACMRequirement:(const __ACMRequirement *)a3 acmContextRecord:(id)a4 policy:(int64_t)a5 internalInfo:(id)a6 uiDelegate:(id)a7 originator:(id)a8 request:(id)a9 reply:(id)a10
{
}

- (void)_mechanismForACMRequirement:(const __ACMRequirement *)a3 acmContextRecord:(id)a4 policy:(int64_t)a5 internalInfo:(id)a6 uiDelegate:(id)a7 originator:(id)a8 request:(id)a9 reply:(id)a10
{
  id v14 = a6;
  id v15 = a7;
  id v16 = a9;
  v17 = (void (**)(id, MechanismManagerACMResult *, id))a10;
  id v18 = a4;
  v19 = (void *)objc_claimAutoreleasedReturnValue([v16 payload]);
  id v20 = [v19 mutableCopy];
  v21 = v20;
  if (v20) {
    v22 = (NSMutableDictionary *)v20;
  }
  else {
    v22 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  }
  v23 = v22;

  -[NSMutableDictionary setObject:forKeyedSubscript:]( v23,  "setObject:forKeyedSubscript:",  v14,  LACEvaluationRequestPayloadKeyInternalInfo);
  [v16 updatePayload:v23];
  id v51 = 0LL;
  v24 = (void *)objc_claimAutoreleasedReturnValue( -[MechanismManagerACM _nonUiMechanismForACMRequirement:acmContextRecord:policy:internalInfo:request:state:error:]( self,  "_nonUiMechanismForACMRequirement:acmContextRecord:policy:internalInfo:request:state:error:",  a3,  v18,  a5,  v14,  v16,  v52,  &v51));

  id v25 = v51;
  uint64_t v26 = objc_opt_class(&OBJC_CLASS___MechanismKofNReorganizer);
  v44 = v23;
  if ((objc_opt_isKindOfClass(v24, v26) & 1) != 0)
  {
    v27 = (os_log_s *)objc_claimAutoreleasedReturnValue([v16 log]);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v54 = v24;
      _os_log_impl(&dword_0, v27, OS_LOG_TYPE_DEFAULT, "resolving reorganizer: %@", buf, 0xCu);
    }

    v57 = v24;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v57, 1LL));
    uint64_t v29 = objc_claimAutoreleasedReturnValue( +[MechanismKofN mechanismWithK:ofSubmechanisms:serial:request:preserveStandaloneReorganizers:]( &OBJC_CLASS___MechanismKofN,  "mechanismWithK:ofSubmechanisms:serial:request:preserveStandaloneReorganizers:",  1LL,  v28,  0LL,  v16,  0LL));

    if (v29)
    {
      v24 = (void *)v29;
    }

    else
    {
      uint64_t v30 = objc_claimAutoreleasedReturnValue( +[LAErrorHelper internalErrorWithMessage:]( &OBJC_CLASS___LAErrorHelper,  "internalErrorWithMessage:",  @"No mechanisms after top-level reorganization."));

      v24 = 0LL;
      id v25 = (id)v30;
    }
  }

  v31 = (os_log_s *)objc_claimAutoreleasedReturnValue([v16 log]);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v54 = v24;
    _os_log_impl(&dword_0, v31, OS_LOG_TYPE_INFO, "nonUiMechanism: %{public}@", buf, 0xCu);
  }

  if (v24)
  {
    id v43 = v15;
    id v50 = v25;
    v32 = (void *)objc_claimAutoreleasedReturnValue([v24 bestEffortAvailableMechanismForRequest:v16 error:&v50]);
    id v33 = v50;

    if (v32 != v24 && os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v54 = v32;
      _os_log_impl(&dword_0, v31, OS_LOG_TYPE_INFO, "availableNonUiMechanism: %{public}@", buf, 0xCu);
    }

    if (v32)
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "availabilityEventsForPurpose:", objc_msgSend(v16, "purpose")));
      id v48 = v33;
      id v49 = v34;
      v35 = (void *)objc_claimAutoreleasedReturnValue( -[MechanismManagerACM _restrictedNonUiMechanism:availabilityEvents:policy:internalInfo:request:error:]( self,  "_restrictedNonUiMechanism:availabilityEvents:policy:internalInfo:request:error:",  v32,  &v49,  a5,  v14,  v16,  &v48));
      id v42 = v49;

      id v36 = v48;
      if (v35)
      {
        if (v35 != v32 && os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          v54 = v35;
          _os_log_impl(&dword_0, v31, OS_LOG_TYPE_INFO, "restrictedNonUiMechanism: %{public}@", buf, 0xCu);
        }

        id v47 = v36;
        v37 = (void *)objc_claimAutoreleasedReturnValue( -[MechanismManagerACM _buildUiForMechanism:policy:internalInfo:uiDelegate:request:error:]( self,  "_buildUiForMechanism:policy:internalInfo:uiDelegate:request:error:",  v35,  a5,  v14,  v43,  v16,  &v47));
        id v33 = v47;

        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v54 = v37;
          __int16 v55 = 2114;
          v56 = v35;
          _os_log_impl( &dword_0,  v31,  OS_LOG_TYPE_DEFAULT,  "uiMechanism: %{public}@ nonUiMechanism: %{public}@",  buf,  0x16u);
        }

        if (v37)
        {
          v46 = (void *)objc_claimAutoreleasedReturnValue([v35 mechanismTreeDescription]);
          v38 = -[MechanismManagerACMResult initWithMechanism:availableMechanisms:mechanismTree:internalInfo:]( objc_alloc(&OBJC_CLASS___MechanismManagerACMResult),  "initWithMechanism:availableMechanisms:mechanismTree:internalInfo:",  v37,  v42,  v46,  v14);
          v39 = v37;
          id v40 = v14;
          v41 = v38;
          v17[2](v17, v38, v33);

          id v14 = v40;
          v37 = v39;
        }

        else
        {
          v17[2](v17, 0LL, v33);
        }
      }

      else
      {
        v17[2](v17, 0LL, v36);
        id v33 = v36;
      }
    }

    else
    {
      v17[2](v17, 0LL, v33);
    }

    id v25 = v33;
    id v15 = v43;
  }

  else
  {
    v17[2](v17, 0LL, v25);
  }
}

- (void)mechanismForApplicationPasswordMode:(int64_t)a3 acmContextRecord:(id)a4 options:(id)a5 internalInfo:(id)a6 uiDelegate:(id)a7 originator:(id)a8 request:(id)a9 reply:(id)a10
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a9;
  v17 = (void (**)(id, id, void))a10;
  v27[0] = @"PasswordMode";
  id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  v28[0] = v18;
  v28[1] = v13;
  v27[1] = @"AcmContextRecord";
  v27[2] = @"UserId";
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:"));
  v28[2] = v19;
  id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v28,  v27,  3LL));

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[MechanismManagerACM sharedInstance](&OBJC_CLASS___MechanismManagerACM, "sharedInstance"));
  id v26 = 0LL;
  v22 = (void *)objc_claimAutoreleasedReturnValue( [v21 loadMechanism:1 initParams:v20 request:v16 className:@"MechanismPassword" error:&v26]);
  id v23 = v26;

  if (v22)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:&off_2A0C0]);
    id v25 = [[MechanismUI alloc] initWithNonUiMechanism:v22 eventProcessing:v24 policy:0 internalInfo:v15 request:v16];
    v17[2](v17, v25, 0LL);
  }

  else
  {
    ((void (**)(id, id, id))v17)[2](v17, 0LL, v23);
  }
}

- (id)_nonUiMechanismForACMRequirement:(const __ACMRequirement *)a3 acmContextRecord:(id)a4 policy:(int64_t)a5 internalInfo:(id)a6 request:(id)a7 state:(unsigned int *)a8 error:(id *)a9
{
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  if (v15)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"UserId"]);

    if (v14)
    {
      if (v17)
      {
        v79[0] = v14;
        v78[0] = @"AcmContextRecord";
        v78[1] = @"UserId";
        id v18 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"UserId"]);
        v79[1] = v18;
        v78[2] = @"EvaluationMode";
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[MechanismManagerACM _evaluationModeForPolicy:](self, "_evaluationModeForPolicy:", a5));
        v79[2] = v19;
        id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v79,  v78,  3LL));
        v64 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v20));

        uint64_t v21 = -[MechanismManagerACM _acmRequirementType:](self, "_acmRequirementType:", a3);
        unsigned int v22 = -[MechanismManagerACM _acmRequirementState:](self, "_acmRequirementState:", a3);
        if ((v21 & 0xFFFFFFFD) == 1
          && (unint64_t v63 = -[MechanismManagerACM _acmRequirementPropertyFlags:](self, "_acmRequirementPropertyFlags:", a3)) != 0)
        {
          objc_msgSend(v14, "setFlags:");
        }

        else
        {
          LODWORD(v63) = 0;
        }

        if ((int)v21 > 10)
        {
          if ((int)v21 <= 18)
          {
            if ((_DWORD)v21 != 11)
            {
              if ((_DWORD)v21 != 15) {
                goto LABEL_50;
              }
LABEL_37:
              id v26 = 0LL;
              id v43 = 0LL;
              id v23 = 0LL;
LABEL_56:
              if (a9)
              {
                if (v23) {
                  v52 = 0LL;
                }
                else {
                  v52 = v43;
                }
                *a9 = v52;
              }

              if (a8) {
                *a8 = v22;
              }
              v53 = (os_log_s *)objc_claimAutoreleasedReturnValue([v16 log]);
              if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
              {
                if (v23) {
                  v54 = v23;
                }
                else {
                  v54 = v26;
                }
                LODWORD(buf) = 67109890;
                DWORD1(buf) = v21;
                WORD4(buf) = 1024;
                *(_DWORD *)((char *)&buf + 10) = v22;
                HIWORD(buf) = 1024;
                LODWORD(v75) = v63;
                WORD2(v75) = 2114;
                *(void *)((char *)&v75 + 6) = v54;
                _os_log_impl( &dword_0,  v53,  OS_LOG_TYPE_DEFAULT,  "ACMRequirement of type:%u, state:%d, flags:%x -> %{public}@",  (uint8_t *)&buf,  0x1Eu);
              }

              goto LABEL_69;
            }

            goto LABEL_41;
          }

          if ((_DWORD)v21 == 19)
          {
            [v64 setObject:&__kCFBooleanTrue forKey:@"Secondary"];
LABEL_41:
            v45 = (void *)objc_claimAutoreleasedReturnValue( +[LAACMHelper BOOLEnvironmentVariable:]( &OBJC_CLASS___LAACMHelper,  "BOOLEnvironmentVariable:",  13LL));
            unsigned int v46 = [v45 BOOLValue];

            if (v46) {
              [v64 setObject:&__kCFBooleanTrue forKey:@"AXMode"];
            }
            v69 = 0LL;
            id v23 = (__CFString *)objc_claimAutoreleasedReturnValue( -[MechanismManagerACM loadMechanism:initParams:request:error:]( self,  "loadMechanism:initParams:request:error:",  2LL,  v64,  v16,  &v69));
            v44 = v69;
            goto LABEL_44;
          }

          if ((_DWORD)v21 == 25)
          {
            if (v22 != 1) {
              goto LABEL_37;
            }
            *(void *)&__int128 buf = 0LL;
            *((void *)&buf + 1) = &buf;
            *(void *)&__int128 v75 = 0x3032000000LL;
            *((void *)&v75 + 1) = sub_E3BC;
            v76 = sub_E3CC;
            id v77 = 0LL;
            v68[0] = _NSConcreteStackBlock;
            v68[1] = 3221225472LL;
            v68[2] = sub_E3D4;
            v68[3] = &unk_28B48;
            v68[4] = &buf;
            uint64_t Property = ACMRequirementGetProperty((int *)a3, 500, (uint64_t)v68);
            if ((_DWORD)Property)
            {
              v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to get ACM nonce. amcErr = %d",  Property));
              uint64_t v42 = objc_claimAutoreleasedReturnValue( +[LAErrorHelper internalErrorWithMessage:]( &OBJC_CLASS___LAErrorHelper,  "internalErrorWithMessage:",  v41));
            }

            else
            {
              uint64_t v51 = *(void *)(*((void *)&buf + 1) + 40LL);
              uint64_t v72 = LAErrorNonceKey;
              uint64_t v73 = v51;
              v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v73,  &v72,  1LL));
              uint64_t v42 = objc_claimAutoreleasedReturnValue( +[LAErrorHelper errorWithCode:message:moreInfo:]( &OBJC_CLASS___LAErrorHelper,  "errorWithCode:message:moreInfo:",  -1026LL,  @"Main key signature required",  v41));
            }

            id v26 = (__CFString *)v42;

            _Block_object_dispose(&buf, 8);
            id v23 = 0LL;
LABEL_55:
            id v43 = v26;
            goto LABEL_56;
          }

- (unsigned)_acmRequirementType:(__ACMRequirement *)a3
{
  return ACMRequirementGetType(a3, a2);
}

- (unsigned)_acmRequirementState:(__ACMRequirement *)a3
{
  return ACMRequirementGetState(a3, a2);
}

- (unint64_t)_acmRequirementPropertyFlags:(__ACMRequirement *)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[LAACMHelper requirement:uint32Property:]( &OBJC_CLASS___LAACMHelper,  "requirement:uint32Property:",  a3,  100LL));
  id v4 = [v3 unsignedIntegerValue];

  return (unint64_t)v4;
}

- (unsigned)_acmPurposeForPolicy:(int64_t)a3
{
  return +[LAUtils isApplePayPolicy:](&OBJC_CLASS___LAUtils, "isApplePayPolicy:", a3);
}

- (id)_evaluationModeForPolicy:(int64_t)a3
{
  return &off_2A0D8;
}

- (BOOL)_shouldDisregardUserIdForPolicy:(int64_t)a3
{
  return 0;
}

- (id)_preferedError:(id)a3
{
  id v3 = a3;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v4 = [&off_2A230 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      v7 = 0LL;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(&off_2A230);
        }
        uint64_t v8 = objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:*(void *)(*((void *)&v12 + 1) + 8 * (void)v7)]);
        if (v8)
        {
          v10 = (void *)v8;
          goto LABEL_11;
        }

        v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [&off_2A230 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue([v3 objectEnumerator]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 nextObject]);

LABEL_11:
  return v10;
}

- (id)_nonUiSubmechanismsForACMRequirement:(const __ACMRequirement *)a3 acmContextRecord:(id)a4 policy:(int64_t)a5 internalInfo:(id)a6 request:(id)a7 requiredCount:(unint64_t *)a8 error:(id *)a9
{
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  uint64_t v32 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  v17 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  uint64_t v50 = 0LL;
  v51[0] = &v50;
  v51[1] = 0x2020000000LL;
  v51[2] = 0LL;
  v48[0] = 0LL;
  v48[1] = v48;
  v48[2] = 0x2020000000LL;
  char v49 = 0;
  unint64_t v18 = *a8;
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472LL;
  v46[2] = sub_E904;
  v46[3] = &unk_287B8;
  v19 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v47 = v19;
  ACMRequirementGetSubrequirements((int *)a3, (uint64_t)v46);
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472LL;
  v34[2] = sub_E95C;
  v34[3] = &unk_28B70;
  v41 = &v50;
  v34[4] = self;
  id v20 = v14;
  id v35 = v20;
  int64_t v43 = a5;
  id v21 = v15;
  id v36 = v21;
  id v22 = v16;
  id v37 = v22;
  unint64_t v44 = v18;
  id v23 = v19;
  v38 = v23;
  v24 = v17;
  v45 = a8;
  v39 = v24;
  uint64_t v42 = v48;
  id v25 = v32;
  id v40 = v25;
  ACMRequirementGetSubrequirements((int *)a3, (uint64_t)v34);
  if ((unint64_t)-[NSMutableArray count](v24, "count") >= *a8)
  {
    if (*a8)
    {
      id v26 = 0LL;
      int v28 = 1;
      goto LABEL_10;
    }

    -[NSMutableArray removeAllObjects](v24, "removeAllObjects");
    id v26 = (void *)objc_claimAutoreleasedReturnValue( +[LAErrorHelper silentInternalErrorWithMessage:]( &OBJC_CLASS___LAErrorHelper,  "silentInternalErrorWithMessage:",  @"KofN is already satisfied."));
  }

  else
  {
    id v26 = (void *)objc_claimAutoreleasedReturnValue(-[MechanismManagerACM _preferedError:](self, "_preferedError:", v25));
    if (*a8 > *(void *)(v51[0] + 24LL))
    {
      id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue([v22 log]);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        sub_1FDC4((uint64_t *)a8, (uint64_t)v51, v27);
      }
    }
  }

  int v28 = 0;
LABEL_10:
  if (a9)
  {
    if (v28) {
      uint64_t v29 = 0LL;
    }
    else {
      uint64_t v29 = v26;
    }
    *a9 = v29;
  }

  if (v28) {
    unsigned __int8 v30 = (void *)objc_claimAutoreleasedReturnValue(-[MechanismManagerACM _sortedSubmechanisms:](self, "_sortedSubmechanisms:", v24));
  }
  else {
    unsigned __int8 v30 = 0LL;
  }

  _Block_object_dispose(v48, 8);
  _Block_object_dispose(&v50, 8);

  return v30;
}

- (id)_sortedSubmechanisms:(id)a3
{
  return a3;
}

- (BOOL)_deviceHasPearl
{
  return +[DaemonUtils deviceHasPearl](&OBJC_CLASS___DaemonUtils, "deviceHasPearl");
}

- (BOOL)_deviceHasLidClosedPreventingUseOfTouchID
{
  return 0;
}

- (id)_buildUiForMechanism:(id)a3 policy:(int64_t)a4 internalInfo:(id)a5 uiDelegate:(id)a6 request:(id)a7 error:(id *)a8
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (v15)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"Options"]);
    unint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:&off_2A0C0]);
    if (!v18)
    {
      v22[0] = &off_2A138;
      v22[1] = &off_2A150;
      v23[0] = &__NSDictionary0__struct;
      v23[1] = &__NSDictionary0__struct;
      v22[2] = &off_2A168;
      v22[3] = &off_2A180;
      v23[2] = &__NSDictionary0__struct;
      v23[3] = &__NSDictionary0__struct;
      unint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v23,  v22,  4LL));
    }
  }

  else
  {
    unint64_t v18 = 0LL;
  }

  if ([v13 requiresUiWithEventProcessing:v18]) {
    id v19 = [[MechanismUI alloc] initWithNonUiMechanism:v13 eventProcessing:v18 policy:a4 internalInfo:v14 request:v16];
  }
  else {
    id v19 = v13;
  }
  id v20 = v19;
  if (a8) {
    *a8 = 0LL;
  }

  return v20;
}

- (id)_restrictedNonUiMechanism:(id)a3 availabilityEvents:(id *)a4 policy:(int64_t)a5 internalInfo:(id)a6 request:(id)a7 error:(id *)a8
{
  id v9 = a3;
  if (a8) {
    *a8 = 0LL;
  }
  return v9;
}

- (id)_loadACMMechanismFromPlugin:(int64_t)a3 acmContextRecord:(id)a4 internalInfo:(id)a5 request:(id)a6 error:(id *)a7
{
  id v12 = a6;
  id v13 = (void *)objc_claimAutoreleasedReturnValue( -[MechanismManagerACM _prepareInitParamsUsingInternalInfo:acmContextRecord:]( self,  "_prepareInitParamsUsingInternalInfo:acmContextRecord:",  a5,  a4));
  id v14 = (void *)objc_claimAutoreleasedReturnValue( -[MechanismManagerACM _loadACMMechanism:initParams:request:error:]( self,  "_loadACMMechanism:initParams:request:error:",  a3,  v13,  v12,  a7));

  return v14;
}

- (id)_loadACMMechanism:(int64_t)a3 initParams:(id)a4 request:(id)a5 error:(id *)a6
{
  v7 = (void *)objc_claimAutoreleasedReturnValue( -[MechanismManagerACM loadMechanism:initParams:request:className:error:]( self,  "loadMechanism:initParams:request:className:error:",  a3,  a4,  a5,  0LL,  a6));
  if (v7)
  {
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___MechanismACM);
    if ((objc_opt_isKindOfClass(v7, v8) & 1) == 0)
    {
      if (a6)
      {
        id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unexpected mechanism class: %@",  v7));
        *a6 = (id)objc_claimAutoreleasedReturnValue( +[LAErrorHelper internalErrorWithMessage:]( &OBJC_CLASS___LAErrorHelper,  "internalErrorWithMessage:",  v9));
      }

      v7 = 0LL;
    }
  }

  return v7;
}

- (id)_prepareInitParamsUsingInternalInfo:(id)a3 acmContextRecord:(id)a4
{
  v10[0] = @"AcmContextRecord";
  v10[1] = @"UserId";
  v11[0] = a4;
  id v5 = a4;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:@"UserId"]);
  v11[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v11,  v10,  2LL));

  id v8 = [v7 mutableCopy];
  return v8;
}

@end