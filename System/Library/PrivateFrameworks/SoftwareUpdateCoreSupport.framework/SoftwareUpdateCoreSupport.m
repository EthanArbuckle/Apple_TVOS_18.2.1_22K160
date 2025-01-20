LABEL_11:
  v42 = 0LL;
  v18 = 0LL;
  if (!v15) {
    goto LABEL_10;
  }
LABEL_12:
  v53 = 0LL;
  v54 = 0LL;
  v51 = 0LL;
  v52 = 0LL;
  v49 = 0LL;
  v50 = 0LL;
  v47 = 0LL;
  v48 = 0LL;
  v24 = -[SUCoreSimulate _parseOptionalEntriesInLineFromWords:argStartAt:argEndAt:argDuration:argUntilStop:argAssetBuildVersions:argAssetProductVersions:argAssetAttributesPlist:argAssetState:argUpdateInfoPlist:argErrorDomain:argErrorCode:argErrorUserInfo:argErrorRecoverable:]( self,  "_parseOptionalEntriesInLineFromWords:argStartAt:argEndAt:argDuration:argUntilStop:argAssetBuildVersions:argAss etProductVersions:argAssetAttributesPlist:argAssetState:argUpdateInfoPlist:argErrorDomain:argErrorCode:argErro rUserInfo:argErrorRecoverable:",  v15,  v59,  &v58,  &v57,  &v54,  &v53,  &v52,  &v51,  &v50,  &v49,  &v48,  &v56,  &v47,  &v55);
  v20 = v54;
  v46 = v53;
  v45 = v52;
  v44 = v51;
  v21 = v50;
  v43 = v49;
  v22 = v48;
  v23 = v47;
  if (!v24) {
    goto LABEL_25;
  }
LABEL_13:
  if (!v18 || !v42) {
    goto LABEL_25;
  }
  if ([v10 count] == 4)
  {
    v39 = v18;
    v25 = v4;
    v26 = objc_alloc(&OBJC_CLASS___SUCoreSimulateEvent);
    [v10 objectAtIndexedSubscript:2];
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = [v10 objectAtIndexedSubscript:3];
    v29 = v20;
    v30 = (void *)v28;
    v41 = v29;
    LODWORD(v36) = v57;
    v31 = v26;
    v4 = v25;
    v32 = -[SUCoreSimulateEvent initWithAction:onTrigger:forModule:atFunction:startAt:endAt:duration:untilStop:assetBuildVersions:assetProductVersions:assetAttributesPlist:assetState:updateInfoPlist:errorDomain:errorCode:errorUserInfo:errorRecoverable:]( v31,  "initWithAction:onTrigger:forModule:atFunction:startAt:endAt:duration:untilStop:assetBuildVersions:assetProdu ctVersions:assetAttributesPlist:assetState:updateInfoPlist:errorDomain:errorCode:errorUserInfo:errorRecoverable:",  v39,  v42,  v27,  v30,  v59[0],  v58,  v36,  v29,  v46,  v45,  v44,  v21,  v43,  v22,  v56,  v23,  v55);
  }

  else
  {
    if ([v10 count] != 5 && objc_msgSend(v10, "count") != 6 || v42 != 3) {
      goto LABEL_25;
    }
    v38 = v4;
    v41 = v20;
    if ([v10 count] == 6)
    {
      [v10 objectAtIndexedSubscript:5];
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v27 = 0LL;
    }

    v40 = objc_alloc(&OBJC_CLASS___SUCoreSimulateEvent);
    [v10 objectAtIndexedSubscript:2];
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 objectAtIndexedSubscript:3];
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 objectAtIndexedSubscript:4];
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = -[SUCoreSimulateEvent initWithAction:onTrigger:forMachine:atEvent:inState:alteration:startAt:endAt:assetBuildVersions:assetProductVersions:assetAttributesPlist:assetState:updateInfoPlist:errorDomain:errorCode:errorUserInfo:errorRecoverable:]( v40,  "initWithAction:onTrigger:forMachine:atEvent:inState:alteration:startAt:endAt:assetBuildVersions:assetProduct Versions:assetAttributesPlist:assetState:updateInfoPlist:errorDomain:errorCode:errorUserInfo:errorRecoverable:",  v18,  3LL,  v30,  v33,  v37,  v27,  __PAIR64__(v58, v59[0]),  v46,  v45,  v44,  v21,  v43,  v22,  v56,  v23,  v55);

    v4 = v38;
  }

  v20 = v41;
  if (!v32)
  {
LABEL_25:
    v34 = +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
    [v34 trackAnomaly:@"[SIMULATE] SETUP" forReason:v4 withResult:8112 withError:0];

    v32 = 0LL;
  }

  return v32;
}
  }
}

LABEL_22:
    v6 = -1;
    goto LABEL_23;
  }

  v4 = v3;
  v5 = open(v3, 521, 420LL);
  if (v5 == -1)
  {
    v15 = +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
    [v15 oslog];
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v16 = *__error();
      *(_DWORD *)buf = 67109120;
      v33 = v16;
      v12 = "[SPLUNK_HISTORY] SETUP | failed opening log file, errno:%d";
      v13 = v11;
      v14 = 8;
      goto LABEL_10;
    }

    goto LABEL_11;
  }

  v6 = v5;
  memset(&v31, 0, sizeof(v31));
  if (fstat(v5, &v31))
  {
    v7 = +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
    [v7 oslog];
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *__error();
      *(_DWORD *)buf = 67109120;
      v33 = v9;
      _os_log_impl( &dword_187139000,  v8,  OS_LOG_TYPE_DEFAULT,  "[SPLUNK_HISTORY] SETUP | failed to get file stats, errno:%d",  buf,  8u);
    }

    goto LABEL_21;
  }

  if (v31.st_size >= 0x40000)
  {
    [NSString stringWithFormat:@"%@%@", v2, @".1"];
    v8 = (os_log_s *) objc_claimAutoreleasedReturnValue();
    v17 = -[os_log_s cStringUsingEncoding:](v8, "cStringUsingEncoding:", 4LL);
    if (v17)
    {
      v18 = (const char *)v17;
      close(v6);
      if (!rename(v4, v18))
      {
        v27 = open(v4, 521, 420LL);
        if (v27 != -1)
        {
          v6 = v27;

          goto LABEL_23;
        }
        v28 = +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
        [v28 oslog];
        v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          v30 = *__error();
          *(_DWORD *)buf = 67109120;
          v33 = v30;
          _os_log_impl( &dword_187139000,  v29,  OS_LOG_TYPE_DEFAULT,  "[SPLUNK_HISTORY] SETUP | failed opening new log file, errno:%d",  buf,  8u);
        }

        goto LABEL_22;
      }
      v19 = +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
      [v19 oslog];
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_20;
      }
      v21 = *__error();
      *(_DWORD *)buf = 67109120;
      v33 = v21;
      v22 = "[SPLUNK_HISTORY] SETUP | failed moving old file, errno:%d";
      v23 = v20;
      v24 = 8;
    }

    else
    {
      v25 = +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
      [v25 oslog];
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
LABEL_20:

LABEL_21:
        close(v6);
        goto LABEL_22;
      }

      *(_WORD *)buf = 0;
      v22 = "[SPLUNK_HISTORY] SETUP | failed creating file name";
      v23 = v20;
      v24 = 2;
    }

    _os_log_impl(&dword_187139000, v23, OS_LOG_TYPE_DEFAULT, v22, buf, v24);
    goto LABEL_20;
  }

LABEL_53:
            goto LABEL_17;
          }

          [v25 objectAtIndexedSubscript:0];
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v64 = [v63 isEqualToString:@"assetState"];

          if (a11 && v64)
          {
            [v25 objectAtIndexedSubscript:1];
            *a11 = (id)objc_claimAutoreleasedReturnValue();
            v65 = +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
            [v65 oslog];
            v59 = (os_log_s *)objc_claimAutoreleasedReturnValue();

            if (!os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_53;
            }
            v66 = *a11;
            *(_DWORD *)buf = 138412290;
            v122 = (uint64_t)v66;
            v61 = v59;
            v62 = "[SIMULATE] using assetState: '%@'";
LABEL_52:
            _os_log_impl(&dword_187139000, v61, OS_LOG_TYPE_DEFAULT, v62, buf, 0xCu);
            goto LABEL_53;
          }

          [v25 objectAtIndexedSubscript:0];
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          v68 = [v67 isEqualToString:@"updateInfoPlist"];

          if (a12 && v68)
          {
            [v25 objectAtIndexedSubscript:1];
            *a12 = (id)objc_claimAutoreleasedReturnValue();
            v69 = +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
            [v69 oslog];
            v59 = (os_log_s *)objc_claimAutoreleasedReturnValue();

            if (!os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_53;
            }
            v70 = *a12;
            *(_DWORD *)buf = 138412290;
            v122 = (uint64_t)v70;
            v61 = v59;
            v62 = "[SIMULATE] using updateInfoPlist: '%@'";
            goto LABEL_52;
          }

          [v25 objectAtIndexedSubscript:0];
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          v72 = [v71 isEqualToString:@"errorDomain"];

          if (a13 && v72)
          {
            [v25 objectAtIndexedSubscript:1];
            *a13 = (id)objc_claimAutoreleasedReturnValue();
            v73 = +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
            [v73 oslog];
            v59 = (os_log_s *)objc_claimAutoreleasedReturnValue();

            if (!os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_53;
            }
            v74 = *a13;
            *(_DWORD *)buf = 138412290;
            v122 = (uint64_t)v74;
            v61 = v59;
            v62 = "[SIMULATE] using errorDomain: '%@'";
            goto LABEL_52;
          }

          [v25 objectAtIndexedSubscript:0];
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          v76 = [v75 isEqualToString:@"errorCode"];

          if (a14 && v76)
          {
            [v25 objectAtIndexedSubscript:1];
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            v78 = -[SUCoreSimulate _parseErrorCodeFromString:destination:]( self,  "_parseErrorCodeFromString:destination:",  v77,  a14);

            if (!v78)
            {
              v79 = +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
              [v79 oslog];
              v80 = (os_log_s *)objc_claimAutoreleasedReturnValue();

              if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v122 = (uint64_t)v23;
                _os_log_impl( &dword_187139000,  v80,  OS_LOG_TYPE_DEFAULT,  "[SIMULATE] failed parsing 'errorCode' (expected SUCoreErrorCode) for: '%@'",  buf,  0xCu);
              }

              NSLog( (NSString *)@"[SIMULATE] failed parsing 'errorCode' (expected SUCoreErrorCode) for: '%@'",  v23);
              goto LABEL_16;
            }
          }

          else
          {
            [v25 objectAtIndexedSubscript:0];
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            v82 = [v81 isEqualToString:@"errorUserInfo"];

            if (a15 && v82)
            {
              [v25 objectAtIndexedSubscript:1];
              v83 = (void *)objc_claimAutoreleasedReturnValue();
              v84 = -[SUCoreSimulate _parseDictionaryFromString:destination:]( self,  "_parseDictionaryFromString:destination:",  v83,  a15);

              if (!v84)
              {
                v85 = +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
                [v85 oslog];
                v86 = (os_log_s *)objc_claimAutoreleasedReturnValue();

                if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v122 = (uint64_t)v23;
                  _os_log_impl( &dword_187139000,  v86,  OS_LOG_TYPE_DEFAULT,  "[SIMULATE] failed parsing 'errorUserInfo' (expected {k1=v1;k2=v2;}) for: '%@'",
                    buf,
                    0xCu);
                }

                NSLog( (NSString *)@"[SIMULATE] failed parsing 'errorUserInfo' (expected {k1=v1;k2=v2;}) for: '%@'",
                  v23);
                goto LABEL_16;
              }
            }

            else
            {
              [v25 objectAtIndexedSubscript:0];
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              v88 = [v87 isEqualToString:@"errorRecoverable"];

              if (!a16 || !v88)
              {
                v93 = +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
                [v93 oslog];
                v94 = (os_log_s *)objc_claimAutoreleasedReturnValue();

                if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v122 = (uint64_t)v23;
                  _os_log_impl( &dword_187139000,  v94,  OS_LOG_TYPE_DEFAULT,  "[SIMULATE] failed parsing option (unexpected/unsupported option key) for: '%@'",  buf,  0xCu);
                }

                NSLog( (NSString *)@"[SIMULATE] failed parsing option (unexpected/unsupported option key) for: '%@'",  v23);
                goto LABEL_16;
              }

              [v25 objectAtIndexedSubscript:1];
              v89 = (void *)objc_claimAutoreleasedReturnValue();
              v90 = -[SUCoreSimulate _parseEventBooleanFromString:destination:]( self,  "_parseEventBooleanFromString:destination:",  v89,  a16);

              if (!v90)
              {
                v91 = +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
                [v91 oslog];
                v92 = (os_log_s *)objc_claimAutoreleasedReturnValue();

                if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v122 = (uint64_t)v23;
                  _os_log_impl( &dword_187139000,  v92,  OS_LOG_TYPE_DEFAULT,  "[SIMULATE] failed parsing 'errorRecoverable' (expected SUCoreSimulateEventBoolean) for: '%@'",  buf,  0xCu);
                }

                NSLog( (NSString *)@"[SIMULATE] failed parsing 'errorRecoverable' (expected SUCoreSimulateEventBoolean) for: '%@'",  v23);
                goto LABEL_16;
              }
            }
          }
        }
      }

LABEL_17:
      ++v22;
    }

    while (v19 != v22);
    v95 = [obj countByEnumeratingWithState:&v117 objects:v125 count:16];
    v19 = v95;
  }

  while (v95);
  v97 = v110;
  v96 = v111;
  v98 = v111 != 0LL;
  v99 = v110 != 0LL;
  if (v111 && v110)
  {
    v100 = [v111 count];
    if (v100 == [v110 count])
    {
      v96 = v111;
      *v109 = v96;
      v97 = v110;
      *a9 = v97;
      goto LABEL_90;
    }
    v103 = +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
    [v103 oslog];
    v104 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
    {
      v105 = [v111 count];
      v106 = [v110 count];
      *(_DWORD *)buf = 134218240;
      v122 = v105;
      v123 = 2048;
      v124 = v106;
      _os_log_impl( &dword_187139000,  v104,  OS_LOG_TYPE_DEFAULT,  "[SIMULATE] syntax error: assetBuildVersions (%lu) and assetProductVersions (%lu) must have the same count",  buf,  0x16u);
    }

    NSLog( (NSString *)@"[SIMULATE] syntax error: assetBuildVersions (%lu) and assetProductVersions (%lu) must have the same count",  [v111 count],  objc_msgSend(v110, "count"));
LABEL_89:
    v20 = 0;
    goto LABEL_90;
  }

  [MEMORY[0x189607870] errorWithDomain:v7 code:v8 userInfo:v12];
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

LABEL_81:
  if (v98 || v99)
  {
    v101 = +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
    [v101 oslog];
    v102 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_187139000,  v102,  OS_LOG_TYPE_DEFAULT,  "[SIMULATE] syntax error: assetBuildVersions and assetProductVersions must both be defined",  buf,  2u);
    }

    NSLog( (NSString *)@"[SIMULATE] syntax error: assetBuildVersions and assetProductVersions must both be defined",  v108);
    goto LABEL_89;
  }

LABEL_90:
  return v20 & 1;
}

void sub_18713DB84(_Unwind_Exception *a1)
{
}
}

void sub_18713E4D4(_Unwind_Exception *a1)
{
}

void sub_18713E678( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_18713E840( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_18713EA64( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_18713ECB4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

LABEL_31:
  return v33;
}

LABEL_29:
  v40 = 0LL;
  switch([v4 simAction])
  {
    case 0LL:
    case 2LL:
    case 4LL:
    case 11LL:
      +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
      v41 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue();
      v42 = objc_alloc(NSString);
      [v4 summary];
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = [v42 initWithFormat:@"action should never be indicated when handling off-queue: %@", v43];
      goto LABEL_35;
    case 1LL:
    case 3LL:
    case 9LL:
    case 10LL:
      v40 = v4;
      goto LABEL_38;
    case 5LL:
      while ([v4 simAction] == 5)
        ;
      break;
    case 6LL:
      v41 = dispatch_semaphore_create(0LL);
      dispatch_semaphore_wait(v41, 0xFFFFFFFFFFFFFFFFLL);
      goto LABEL_36;
    case 7LL:
      v48 = -[SUCoreSimulate registeredCallback](self, "registeredCallback");
      v41 = (dispatch_semaphore_s *)v48;
      if (v48)
      {
        (*(void (**)(uint64_t, id))(v48 + 16))(v48, v4);
      }

      else
      {
        v49 = +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
        v50 = objc_alloc(NSString);
        [v4 summary];
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = (void *)[v50 initWithFormat:@"no registered callback when handling off-queue: %@", v51];
        [v49 trackError:@"[SIMULATE] PERFORM(OFF_QUEUE)" forReason:v52 withResult:8101 withError:0];
      }

      goto LABEL_36;
    case 8LL:
      goto LABEL_38;
    default:
      +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
      v41 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue();
      v45 = objc_alloc(NSString);
      [v4 summary];
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = [v45 initWithFormat:@"unknown simulate action: %@", v43];
LABEL_35:
      v46 = (void *)v44;
      -[dispatch_semaphore_s trackError:forReason:withResult:withError:]( v41,  "trackError:forReason:withResult:withError:",  @"[SIMULATE] PERFORM(OFF_QUEUE)",  v44,  8113LL,  0LL);

LABEL_36:
      break;
  }

LABEL_37:
  v40 = 0LL;
LABEL_38:

  return v40;
}

void sub_187140E58( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

LABEL_4:
LABEL_8:
}

LABEL_8:
}

void sub_187141134( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

LABEL_12:
}

        goto LABEL_13;
      }
    }
  }
  v19 = +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
  [v19 oslog];
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
  {
    v20 = *(void *)(a1 + 48);
    v21 = [*(id *)(a1 + 32) fsmName];
    v13 = (os_log_s *)v21;
    v22 = *(void *)(a1 + 40);
    v23 = @"NONE";
    v24 = 138413314;
    if (v6) {
      v23 = v6;
    }
    v25 = v20;
    v26 = 2112;
    v27 = v21;
    v28 = 2112;
    v29 = v22;
    v30 = 2112;
    v31 = v5;
    v32 = 2112;
    v33 = v23;
    _os_log_impl( &dword_187139000,  (os_log_t)v10,  OS_LOG_TYPE_DEFAULT,  "[FSM] DUMP_EVENT_IN_STATE | %@:FSM(%@) | STATE(%@) EVENT(%@) ACTION(%@) | occurrences:0",  (uint8_t *)&v24,  0x34u);
    goto LABEL_12;
  }

void sub_1871418C4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_187142328( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_187142494( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

LABEL_15:
    _Block_object_dispose(&v31, 8);
    _Block_object_dispose(&v37, 8);

    _Block_object_dispose(&v43, 8);
  }
}

  -[SUCoreRestoreVersion setParsedVersion:](self, "setParsedVersion:", v8);
  if (+[SUCoreRestoreVersion _enableVerboseLogging](&OBJC_CLASS___SUCoreRestoreVersion, "_enableVerboseLogging"))
  {
    v16 = +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
    [v16 oslog];
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = -[SUCoreRestoreVersion summary](self, "summary");
      v19 = -[SUCoreRestoreVersion description](self, "description");
      *(_DWORD *)buf = 138543618;
      v32 = v18;
      v33 = 2114;
      v34 = v19;
      _os_log_impl( &dword_187139000,  v17,  OS_LOG_TYPE_DEFAULT,  "[RestoreVersion] (%{public}@) Parse: completed with result: %{public}@",  buf,  0x16u);
    }
  }

        goto LABEL_16;
      }

      if (!v18) {
        goto LABEL_15;
      }
      v25 = (objc_class *)objc_opt_class();
      NSStringFromClass(v25);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138544130;
      v28 = v14;
      v29 = 2114;
      v30 = v12;
      v31 = 2114;
      v32 = v20;
      v33 = 2114;
      v34 = v13;
      v21 = "[SUCoreDictionary] [%{public}@] key '%{public}@' references value of the incorrect class (%{public}@), retur"
            "ning %{public}@ value: nil";
    }

    else
    {
      if (!v15)
      {
        if (v18)
        {
          v26 = (objc_class *)objc_opt_class();
          NSStringFromClass(v26);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = 138543874;
          v28 = v12;
          v29 = 2114;
          v30 = v20;
          v31 = 2114;
          v32 = v13;
          v21 = "[SUCoreDictionary] key '%{public}@' references value of the incorrect class (%{public}@), returning %{pu"
                "blic}@ value: nil";
          v22 = v17;
          v23 = 32;
          goto LABEL_14;
        }

        goto LABEL_15;
      }

      if (!v18) {
        goto LABEL_15;
      }
      v24 = (objc_class *)objc_opt_class();
      NSStringFromClass(v24);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138544130;
      v28 = v12;
      v29 = 2114;
      v30 = v15;
      v31 = 2114;
      v32 = v20;
      v33 = 2114;
      v34 = v13;
      v21 = "[SUCoreDictionary] key '%{public}@' (%{public}@) references value of the incorrect class (%{public}@), retur"
            "ning %{public}@ value: nil";
    }

    v22 = v17;
    v23 = 42;
    goto LABEL_14;
  }

LABEL_16:
  v20 = +[SUCoreSimulate sharedSimulator]( &OBJC_CLASS___SUCoreSimulate,  "sharedSimulator",  *(_OWORD *)v24,  *(void *)&v24[16],  v25);
  v21 = v20;
  if (*(void *)(a1 + 56)) {
    v22 = *(const __CFString **)(a1 + 56);
  }
  else {
    v22 = @"!";
  }
  v23 = (id)[v20 begin:v22 atFunction:*(void *)(a1 + 32)];
}

void sub_1871427D0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
}

void sub_187143770( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
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

void sub_187143A38( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_187143FA8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

LABEL_9:
  return v10;
}
}

    [a1 _logReturningNil:v5 forKey:v4 valueType:@"date"];
    v6 = 0LL;
    goto LABEL_10;
  }

  v6 = v5;
LABEL_10:

  return v6;
}

  if ((-[SUCoreDiagPoint trackType](self, "trackType") & 8) != 0)
  {
    if (v5)
    {
      -[__CFString stringByAppendingString:](v5, "stringByAppendingString:", @"|ANOMALY");
    }

    else
    {
      v5 = @"ANOMALY";
    }
  }

  if ((-[SUCoreDiagPoint trackType](self, "trackType") & 0x10) != 0)
  {
    if (v5)
    {
      -[__CFString stringByAppendingString:](v5, "stringByAppendingString:", @"|FAILURE");
    }

    else
    {
      v5 = @"FAILURE";
    }
  }

  if ((-[SUCoreDiagPoint trackType](self, "trackType") & 0x20) != 0)
  {
    if (v5)
    {
      -[__CFString stringByAppendingString:](v5, "stringByAppendingString:", @"|FAULT");
    }

    else
    {
      v5 = @"FAULT";
    }
  }

  if ((-[SUCoreDiagPoint trackType](self, "trackType") & 0x40) != 0)
  {
    if (v5)
    {
      -[__CFString stringByAppendingString:](v5, "stringByAppendingString:", @"|FSM");
    }

    else
    {
      return @"FSM";
    }
  }

  return v5;
}

LABEL_16:
  return v4;
}
}

void OUTLINED_FUNCTION_0(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void sub_187149FE8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void sub_18714A3E8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_18714A558( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_18714A6D0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void OUTLINED_FUNCTION_0_0( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

uint64_t OUTLINED_FUNCTION_3()
{
  return objc_opt_class();
}

LABEL_21:
    goto LABEL_22;
  }

  v30 = open(v29, 521, 420LL);
  v3->_lockFD = v30;
  if (v30 == -1)
  {
    v36 = +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
    [v36 oslog];
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v37 = *__error();
      *(_DWORD *)buf = 67109120;
      LODWORD(v44) = v37;
      v33 = "[SPLUNK_HISTORY] INIT | failed opening lock file, errno:%d";
      v34 = v22;
      v35 = 8;
      goto LABEL_20;
    }

    goto LABEL_21;
  }

LABEL_15:
  v31 = v3;
LABEL_23:

  return v31;
}

LABEL_23:
  return v6;
}

__CFString *_ensureNSString(void *a1)
{
  uint64_t v1 = a1;
  if (!v1 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    uint64_t v1 = @"Unknown";
  }

  return v1;
}

__CFString *_ensureNSNumber(void *a1)
{
  uint64_t v1 = a1;
  if (!v1 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    uint64_t v1 = @"Unknown";
  }

  return v1;
}

uint64_t _ensureNSNumberFromDictionary(uint64_t a1, void *a2)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 longLongValue];

  return [MEMORY[0x189607968] numberWithLongLong:v3 / 0x100000];
}

id _currentTimeInMilliseconds()
{
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  [v0 timeIntervalSince1970];
  double v2 = v1;

  return (id)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"%llu",  (unint64_t)(v2 * 1000.0));
}

LABEL_13:
    return 0;
  }

  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 oslog];
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      v9 = "[EVENT_REPORTER] UMUserManager class does not respond to selector 'sharedManager'";
      v10 = v15;
      goto LABEL_12;
    }

    goto LABEL_13;
  }

  double v2 = (void *)MEMORY[0x1895A17D4]();
  [MEMORY[0x189612BC0] sharedManager];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v12 = +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
    [v12 oslog];
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl( &dword_187139000,  v13,  OS_LOG_TYPE_DEFAULT,  "[EVENT_REPORTER] UMUserManager instance does not respond to selector 'isSharedIPad'",  v16,  2u);
    }

    goto LABEL_17;
  }

  if (![v3 isSharedIPad])
  {
LABEL_17:

    objc_autoreleasePoolPop(v2);
    return 0;
  }
  v4 = +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
  [v4 oslog];
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_187139000, v5, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] Detected shared iPad", buf, 2u);
  }

  objc_autoreleasePoolPop(v2);
  return 1;
}
}
}

LABEL_6:
  self = self;
  v13 = self;
LABEL_12:

  return v13;
}

LABEL_30:
LABEL_31:
LABEL_32:
}

void OUTLINED_FUNCTION_0_1( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

  ;
}

void sub_1871515B8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_187151874( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_1871519A4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_187151B1C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_187151CD4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void OUTLINED_FUNCTION_0_2(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

LABEL_7:
  return v6;
}

  return v13;
}

    if ((v3 & 8) == 0) {
      return v4;
    }
LABEL_8:
    -[__CFString stringByAppendingString:](v4, "stringByAppendingString:", @"|EVENT_REPORTER");

    return v4;
  }

  if ((a3 & 4) != 0)
  {
    v4 = @"FILE";
    if ((a3 & 8) == 0) {
      return v4;
    }
    goto LABEL_8;
  }

  return (id)((unint64_t)@"EVENT_REPORTER" & (a3 << 60 >> 63));
}

void sub_187152BDC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, char a30)
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

void sub_18715301C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_187153600( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void OUTLINED_FUNCTION_0_3(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void sub_187155740( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_187155FAC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
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

LABEL_18:
      goto LABEL_19;
    }

    v26 = (void *)NSString;
    -[SUCoreDiagPoint typeName](self, "typeName");
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[SUCoreDiagPoint location](self, "location");
    v27 = -[SUCoreDiagPoint code](self, "code");
    v28 = -[SUCoreDiagPoint errorDesc](self, "errorDesc");
    [v26 stringWithFormat:@"[%@(%@)] code:%ld error:%@", v7, v8, v27, v28];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v21 = (void *)NSString;
    -[SUCoreDiagPoint typeName](self, "typeName");
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[SUCoreDiagPoint location](self, "location");
    [v21 stringWithFormat:@"[%@(%@)] code:%ld", v7, v8, -[SUCoreDiagPoint code](self, "code")];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

    goto LABEL_19;
  }
  v20 = +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
  v21 = (void *)[objc_alloc(NSString) initWithFormat:@"unable to persist string for key with value: %@=%@", v11, v10];
  [v20 trackError:@"[PERSISTED_STATE]" forReason:v21 withResult:8250 withError:0];

LABEL_19:
}

    goto LABEL_19;
  }
  v20 = +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
  v21 = (void *)[objc_alloc(NSString) initWithFormat:@"unable to persist dictionary for key with value: %@=%@", v11, v10];
  [v20 trackError:@"[PERSISTED_STATE]" forReason:v21 withResult:8250 withError:0];

LABEL_19:
}

    goto LABEL_19;
  }
  v20 = +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
  v21 = (void *)[objc_alloc(NSString) initWithFormat:@"unable to persist data for key with value: %@=%@", v11, v10];
  [v20 trackError:@"[PERSISTED_STATE]" forReason:v21 withResult:8250 withError:0];

LABEL_19:
}

    goto LABEL_19;
  }
  v20 = +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
  v21 = (void *)[objc_alloc(NSString) initWithFormat:@"unable to persist date for key with value: %@=%@", v11, v10];
  [v20 trackError:@"[PERSISTED_STATE]" forReason:v21 withResult:8250 withError:0];

LABEL_19:
}

    goto LABEL_19;
  }
  v20 = +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
  v21 = (void *)[objc_alloc(NSString) initWithFormat:@"unable to persist object for key with value: %@=%@", v11, v10];
  [v20 trackError:@"[PERSISTED_STATE]" forReason:v21 withResult:8250 withError:0];

LABEL_19:
}

LABEL_19:
  return v12;
}

void sub_18715D3B4(_Unwind_Exception *a1)
{
}

void sub_18715D440(_Unwind_Exception *a1)
{
}

void sub_18715D4CC(_Unwind_Exception *a1)
{
}

void sub_18715D558(_Unwind_Exception *a1)
{
}

void sub_18715D5C4(_Unwind_Exception *a1)
{
}

void sub_18715D630(_Unwind_Exception *a1)
{
}

void sub_18715D69C(_Unwind_Exception *a1)
{
}

void sub_18715D708(_Unwind_Exception *a1)
{
}

void sub_18715D774(_Unwind_Exception *a1)
{
}

void sub_18715DE38(_Unwind_Exception *a1)
{
}

void sub_18715DEA4(_Unwind_Exception *a1)
{
}

void sub_18715DF10(_Unwind_Exception *a1)
{
}

void sub_18715DF7C(_Unwind_Exception *a1)
{
}

void sub_18715DFE8(_Unwind_Exception *a1)
{
}

void sub_18715E054(_Unwind_Exception *a1)
{
}

void sub_18715E0C0(_Unwind_Exception *a1)
{
}

void sub_18715E12C(_Unwind_Exception *a1)
{
}

void sub_18715E198(_Unwind_Exception *a1)
{
}

void sub_18715E204(_Unwind_Exception *a1)
{
}

void sub_18715E270(_Unwind_Exception *a1)
{
}

LABEL_27:
}

void OUTLINED_FUNCTION_5( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void OUTLINED_FUNCTION_6( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void OUTLINED_FUNCTION_7(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

  ;
}

  ;
}

  ;
}

  ;
}

LABEL_33:
        goto LABEL_34;
      }

      if (!v10) {
        goto LABEL_33;
      }
      v33 = *(void *)(a1 + 32);
      v34 = *(void *)(a1 + 64);
      v35 = *(void **)(a1 + 72);
      [*(id *)(a1 + 48) checkedDescription];
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v47 = 138544130;
      *(void *)&v47[4] = v34;
      *(_WORD *)&v47[12] = 2114;
      *(void *)&v47[14] = v33;
      *(_WORD *)&v47[22] = 2048;
      v48 = v35;
      *(_WORD *)v49 = 2114;
      *(void *)&v49[2] = v15;
      v16 = "[DIAG_END] ...[%{public}@]%{public}@ | result=%ld error:%{public}@";
    }

    else
    {
      if (!v7)
      {
        if (v10)
        {
          v36 = *(void *)(a1 + 32);
          v37 = *(void *)(a1 + 72);
          [*(id *)(a1 + 48) checkedDescription];
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v47 = 138543874;
          *(void *)&v47[4] = v36;
          *(_WORD *)&v47[12] = 2048;
          *(void *)&v47[14] = v37;
          *(_WORD *)&v47[22] = 2114;
          v48 = v15;
          v16 = "[DIAG_END] ...%{public}@ | result=%ld error:%{public}@";
          uint64_t v17 = v9;
          v18 = 32;
          goto LABEL_23;
        }

        goto LABEL_33;
      }

      if (!v10) {
        goto LABEL_33;
      }
      v19 = *(void *)(a1 + 32);
      v20 = *(void *)(a1 + 40);
      v21 = *(void **)(a1 + 72);
      [*(id *)(a1 + 48) checkedDescription];
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v47 = 138544130;
      *(void *)&v47[4] = v19;
      *(_WORD *)&v47[12] = 2114;
      *(void *)&v47[14] = v20;
      *(_WORD *)&v47[22] = 2048;
      v48 = v21;
      *(_WORD *)v49 = 2114;
      *(void *)&v49[2] = v15;
      v16 = "[DIAG_END] ...%{public}@ (%{public}@) | result=%ld error:%{public}@";
    }

    uint64_t v17 = v9;
    v18 = 42;
    goto LABEL_23;
  }

LABEL_34:
  v43 = +[SUCoreSimulate sharedSimulator]( &OBJC_CLASS___SUCoreSimulate,  "sharedSimulator",  *(_OWORD *)v47,  *(void *)&v47[16],  v48,  *(_OWORD *)v49,  *(void *)&v49[16],  v50);
  v44 = v43;
  if (*(void *)(a1 + 64)) {
    v45 = *(const __CFString **)(a1 + 64);
  }
  else {
    v45 = @"!";
  }
  v46 = (id)[v43 end:v45 atFunction:*(void *)(a1 + 32)];
}

void sub_1871633D4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void OUTLINED_FUNCTION_2_1( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

uint64_t BIDeviceInfoGetMacBoardID()
{
  return 0LL;
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return MEMORY[0x1895F8298](md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return MEMORY[0x1895F82A0](c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1895F82A8](c, data, *(void *)&len);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x189608398](*(void *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty( io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x189608470](*(void *)&entry, key, allocator, *(void *)&options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return MEMORY[0x189608488](*(void *)&mainPort, path);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1896136F0]();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x189607700](aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1895F8898]();
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

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x1895F9710](__count, __size);
}

int close(int a1)
{
  return MEMORY[0x1895FA590](*(void *)&a1);
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

dispatch_queue_t dispatch_get_current_queue(void)
{
  return (dispatch_queue_t)MEMORY[0x1895FAC38]();
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

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x1895FAD98](queue);
}

dispatch_semaphore_t dispatch_semaphore_create(uint64_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1895FADF0](value);
}

uint64_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1895FAE08](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void exit(int a1)
{
}

int flock(int a1, int a2)
{
  return MEMORY[0x1895FB2F0](*(void *)&a1, *(void *)&a2);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1895FB448](*(void *)&a1, a2);
}

pid_t getpid(void)
{
  return MEMORY[0x1895FB628]();
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1895FB708](path, name, value, size, *(void *)&position, *(void *)&options);
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1896165F8](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x189616600]();
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1895FC440](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1895FC640]();
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1895FC6C0]();
}

uint64_t remote_device_copy_bridge_version_string()
{
  return MEMORY[0x189611EA0]();
}

uint64_t remote_device_copy_internal_build()
{
  return MEMORY[0x189611EB0]();
}

uint64_t remote_device_copy_os_build()
{
  return MEMORY[0x189611EB8]();
}

uint64_t remote_device_copy_unique_of_type()
{
  return MEMORY[0x189611EE8]();
}

int rename(const char *__old, const char *__new)
{
  return MEMORY[0x1895FCD50](__old, __new);
}

int setxattr( const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1895FCEE0](path, name, value, size, *(void *)&position, *(void *)&options);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1895FCF88](*(void *)&a1);
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

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1895FD750](*(void *)&__fd, __buf, __nbyte);
}

uint64_t objc_msgSend__associateLayer_withDomain_minCode_maxCode_indicating_ifKeyTrue_keyMatchTrueMap_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__associateLayer_withDomain_minCode_maxCode_indicating_ifKeyTrue_keyMatchTrueMap_);
}

uint64_t objc_msgSend__attributesOfErrorForDomain_withCode_codeName_indicating_ifKeyTrue_keyMatchTrueMap_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel__attributesOfErrorForDomain_withCode_codeName_indicating_ifKeyTrue_keyMatchTrueMap_);
}

uint64_t objc_msgSend__dumpTracked_dumpingTo_usingFilename_clearingStatistics_clearingHistory_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__dumpTracked_dumpingTo_usingFilename_clearingStatistics_clearingHistory_);
}

uint64_t objc_msgSend__initFullySpecified_fromLocation_forReason_withCode_withError_previous_next_activity_param_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel__initFullySpecified_fromLocation_forReason_withCode_withError_previous_next_activity_param_);
}

uint64_t objc_msgSend__initMachine_ofInstance_withTable_startingIn_usingDelegate_registeringAllInfoClass_registeringAndActivating_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel__initMachine_ofInstance_withTable_startingIn_usingDelegate_registeringAllInfoClass_registeringAndActivating_);
}

uint64_t objc_msgSend__initWithAction_onTrigger_forModule_atIdentity_atEvent_inState_alteration_startAt_endAt_duration_untilStop_assetBuildVersions_assetProductVersions_assetAttributesPlist_assetState_updateInfoPlist_errorDomain_errorCode_errorUserInfo_errorRecoverable_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel__initWithAction_onTrigger_forModule_atIdentity_atEvent_inState_alteration_startAt_endAt_duration_untilStop_assetBuildVersions_assetProductVersions_assetAttributesPlist_assetState_updateInfoPlist_errorDomain_errorCode_errorUserInfo_errorRecoverable_);
}

uint64_t objc_msgSend__parseOptionalEntriesInLineFromWords_argStartAt_argEndAt_argDuration_argUntilStop_argAssetBuildVersions_argAssetProductVersions_argAssetAttributesPlist_argAssetState_argUpdateInfoPlist_argErrorDomain_argErrorCode_argErrorUserInfo_argErrorRecoverable_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel__parseOptionalEntriesInLineFromWords_argStartAt_argEndAt_argDuration_argUntilStop_argAssetBuildVersions_argAssetProductVersions_argAssetAttributesPlist_argAssetState_argUpdateInfoPlist_argErrorDomain_argErrorCode_argErrorUserInfo_argErrorRecoverable_);
}

uint64_t objc_msgSend__performEvent_withInfo_issueType_forCell_attachedAction_checkingAttached_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__performEvent_withInfo_issueType_forCell_attachedAction_checkingAttached_);
}

uint64_t objc_msgSend__registerAction_ForEvent_inState_usingDelegate_withInfoClass_actionTable_loggingRegistration_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel__registerAction_ForEvent_inState_usingDelegate_withInfoClass_actionTable_loggingRegistration_);
}

uint64_t objc_msgSend__registerAllActions_withInfoClass_stateTable_actionTable_loggingRegistration_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__registerAllActions_withInfoClass_stateTable_actionTable_loggingRegistration_);
}

uint64_t objc_msgSend__safeDescriptionWithName_atNestedLevel_maxNestedLevel_showingSubLevelName_withMaxValueLength_providingSubstitutionMap_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel__safeDescriptionWithName_atNestedLevel_maxNestedLevel_showingSubLevelName_withMaxValueLength_providingSubstitutionMap_);
}

uint64_t objc_msgSend_associateLayer_withDomain_minCode_maxCode_indicating_ifKeyTrue_keyMatchTrueMap_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_associateLayer_withDomain_minCode_maxCode_indicating_ifKeyTrue_keyMatchTrueMap_);
}

uint64_t objc_msgSend_attributesOfErrorForDomain_withCode_codeName_indicating_ifKeyTrue_keyMatchTrueMap_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_attributesOfErrorForDomain_withCode_codeName_indicating_ifKeyTrue_keyMatchTrueMap_);
}

uint64_t objc_msgSend_collectTrackedStatsClearingAfter_droppingMatchedIndications_completion_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_collectTrackedStatsClearingAfter_droppingMatchedIndications_completion_);
}

uint64_t objc_msgSend_handleSendFinishedWithFileUUID_sendSucceeded_withStatusCode_withError_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_handleSendFinishedWithFileUUID_sendSucceeded_withStatusCode_withError_);
}

uint64_t objc_msgSend_initForDomain_withCode_ofCodeName_indicating_ifKeyTrue_keyMatchTrueMap_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_initForDomain_withCode_ofCodeName_indicating_ifKeyTrue_keyMatchTrueMap_);
}

uint64_t objc_msgSend_initForLayer_withDomain_minCode_maxCode_indicating_ifKeyTrue_keyMatchTrueMap_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_initForLayer_withDomain_minCode_maxCode_indicating_ifKeyTrue_keyMatchTrueMap_);
}

uint64_t objc_msgSend_initStateEventForFSM_previousState_fsmEvent_nextState_fsmAction_eventInfo_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_initStateEventForFSM_previousState_fsmEvent_nextState_fsmAction_eventInfo_);
}

uint64_t objc_msgSend_initWithAction_onTrigger_forMachine_atEvent_inState_alteration_startAt_endAt_assetBuildVersions_assetProductVersions_assetAttributesPlist_assetState_updateInfoPlist_errorDomain_errorCode_errorUserInfo_errorRecoverable_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_initWithAction_onTrigger_forMachine_atEvent_inState_alteration_startAt_endAt_assetBuildVersions_assetProductVersions_assetAttributesPlist_assetState_updateInfoPlist_errorDomain_errorCode_errorUserInfo_errorRecoverable_);
}

uint64_t objc_msgSend_initWithAction_onTrigger_forModule_atFunction_startAt_endAt_duration_untilStop_assetBuildVersions_assetProductVersions_assetAttributesPlist_assetState_updateInfoPlist_errorDomain_errorCode_errorUserInfo_errorRecoverable_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_initWithAction_onTrigger_forModule_atFunction_startAt_endAt_duration_untilStop_assetBuildVersions_assetProductVersions_assetAttributesPlist_assetState_updateInfoPlist_errorDomain_errorCode_errorUserInfo_errorRecoverable_);
}

uint64_t objc_msgSend_initWithBeginCount_withEndSuccessCount_withEndFailCount_withEndFailIndicationsCount_withEndFailAllIndications_withErrorCount_withErrorIndicationsCount_withErrorAllIndications_withAnomalyCount_withAnomalyIndicationsCount_withAnomalyAllIndications_withFailureCount_withFailureIndicationsCount_withFailureAllIndications_withFaultCount_withFaultIndicationsCount_withFaultAllIndications_withStateEventCount_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_initWithBeginCount_withEndSuccessCount_withEndFailCount_withEndFailIndicationsCount_withEndFailAllIndications_withErrorCount_withErrorIndicationsCount_withErrorAllIndications_withAnomalyCount_withAnomalyIndicationsCount_withAnomalyAllIndications_withFailureCount_withFailureIndicationsCount_withFailureAllIndications_withFaultCount_withFaultIndicationsCount_withFaultAllIndications_withStateEventCount_);
}

uint64_t objc_msgSend_initWithDispatchQueue_withPersistencePath_forPolicyVersion_issuingDefaultLevelLogging_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_initWithDispatchQueue_withPersistencePath_forPolicyVersion_issuingDefaultLevelLogging_);
}

uint64_t objc_msgSend_initWithPhase_isStalled_portionComplete_totalWrittenBytes_totalExpectedBytes_remaining_actionText_taskDescription_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_initWithPhase_isStalled_portionComplete_totalWrittenBytes_totalExpectedBytes_remaining_actionText_taskDescription_);
}

uint64_t objc_msgSend_trackStateEvent_previousState_handlingEvent_nextState_performingAction_withInfo_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_trackStateEvent_previousState_handlingEvent_nextState_performingAction_withInfo_);
}