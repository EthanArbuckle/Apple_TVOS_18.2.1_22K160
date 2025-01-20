void sub_41A0(id a1)
{
  os_log_t v1;
  void *v2;
  BOOL v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  v1 = os_log_create("com.apple.PeopleSuggester", "general");
  v2 = (void *)qword_19B78;
  qword_19B78 = (uint64_t)v1;

  if (!qword_19B78)
  {
    v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_CEF8(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_4240(id a1)
{
  os_log_t v1 = os_log_create("com.apple.PeopleSuggester", "messagePinning");
  v2 = (void *)qword_19B88;
  qword_19B88 = (uint64_t)v1;

  if (!qword_19B88)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_CF2C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }

void sub_42E0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.PeopleSuggester", "family");
  v2 = (void *)qword_19B98;
  qword_19B98 = (uint64_t)v1;

  if (!qword_19B98)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_CF60(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }

void sub_4380(id a1)
{
  os_log_t v1 = os_log_create("com.apple.PeopleSuggester", "heuristic");
  v2 = (void *)qword_19BA8;
  qword_19BA8 = (uint64_t)v1;

  if (!qword_19BA8)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_CF94(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }

void sub_4420(id a1)
{
  os_log_t v1 = os_log_create("com.apple.PeopleSuggester", "CoreBehavior");
  v2 = (void *)qword_19BB8;
  qword_19BB8 = (uint64_t)v1;

  if (!qword_19BB8)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_CFC8(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }

void sub_44C0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.PeopleSuggester", "Knn");
  v2 = (void *)qword_19BC8;
  qword_19BC8 = (uint64_t)v1;

  if (!qword_19BC8)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_CFFC(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }

void sub_4560(id a1)
{
  os_log_t v1 = os_log_create("com.apple.PeopleSuggester", "feedback");
  v2 = (void *)qword_19BD8;
  qword_19BD8 = (uint64_t)v1;

  if (!qword_19BD8)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_D030(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }

void sub_4600(id a1)
{
  os_log_t v1 = os_log_create("com.apple.PeopleSuggester", "shareextension");
  v2 = (void *)qword_19BE8;
  qword_19BE8 = (uint64_t)v1;

  if (!qword_19BE8)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_D064(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }

void sub_46A0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.PeopleSuggester", "mediaanalysis");
  v2 = (void *)qword_19BF0;
  qword_19BF0 = (uint64_t)v1;

  if (!qword_19BF0)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_D098(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }

void sub_4740(id a1)
{
  os_log_t v1 = os_log_create("com.apple.PeopleSuggester", "contactEmbedding");
  v2 = (void *)qword_19C08;
  qword_19C08 = (uint64_t)v1;

  if (!qword_19C08)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_D0CC(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }

void sub_47E0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.PeopleSuggester", "featureGeneration");
  v2 = (void *)qword_19C18;
  qword_19C18 = (uint64_t)v1;

  if (!qword_19C18)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_D100(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }

void sub_4880(id a1)
{
  os_log_t v1 = os_log_create("com.apple.PeopleSuggester", "PeopleSuggesterRewrite");
  v2 = (void *)qword_19C28;
  qword_19C28 = (uint64_t)v1;

  if (!qword_19C28)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_D134(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }

void sub_4920(id a1)
{
  os_log_t v1 = os_log_create("com.apple.PeopleSuggester", "signpost");
  v2 = (void *)qword_19C38;
  qword_19C38 = (uint64_t)v1;
}

void sub_4950( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_4FB0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

id sub_4FD0()
{
  uint64_t v4 = 0LL;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000LL;
  v0 = (void *)qword_19C50;
  uint64_t v7 = qword_19C50;
  if (!qword_19C50)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_71DC;
    v3[3] = &unk_14520;
    v3[4] = &v4;
    sub_71DC((uint64_t)v3);
    v0 = (void *)v5[3];
  }

  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_506C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

id sub_5288()
{
  uint64_t v4 = 0LL;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000LL;
  v0 = (void *)qword_19C58;
  uint64_t v7 = qword_19C58;
  if (!qword_19C58)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_7290;
    v3[3] = &unk_14520;
    v3[4] = &v4;
    sub_7290((uint64_t)v3);
    v0 = (void *)v5[3];
  }

  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_5324( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

LABEL_12:
  v22 = -[NSMutableArray copy](v7, "copy");
LABEL_19:

  return v22;
}

    if (os_log_type_enabled((os_log_t)qword_19C78, OS_LOG_TYPE_ERROR)) {
      sub_D72C();
    }
    goto LABEL_17;
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue( +[_PSBehaviorRuleRankingUtilities getDeployedAdaptableCompiledMLModelPath]( &OBJC_CLASS____PSBehaviorRuleRankingUtilities,  "getDeployedAdaptableCompiledMLModelPath"));
  if (!-[NSFileManager fileExistsAtPath:](v7, "fileExistsAtPath:", v20))
  {
    if (os_log_type_enabled((os_log_t)qword_19C78, OS_LOG_TYPE_ERROR)) {
      sub_D758();
    }

    goto LABEL_17;
  }

  v21 = -[_PSPersonalizationEvaluation cloneAdaptableModel:toFilePath:originalXgboostModelName:clonedXgboostModelName:]( self,  "cloneAdaptableModel:toFilePath:originalXgboostModelName:clonedXgboostModelName:",  v20,  v8,  @"AdaptableRuleImportancePredictor.xgboost",  @"IntermediateAdaptableModel.xgboost");

  if ((v21 & 1) == 0) {
    goto LABEL_12;
  }
LABEL_3:
  uint64_t v10 = -[NSURL initFileURLWithPath:](objc_alloc(&OBJC_CLASS___NSURL), "initFileURLWithPath:", v8);
  -[_PSPersonalizationEvaluation setIntermediateCompiledModelURL:](self, "setIntermediateCompiledModelURL:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[_PSPersonalizationEvaluation intermediateCompiledModelURL](self, "intermediateCompiledModelURL"));
  if (!v11)
  {
LABEL_17:
    v19 = 0LL;
    goto LABEL_22;
  }

  v29 = 0LL;
  v30 = &v29;
  v31 = 0x2050000000LL;
  v12 = (void *)qword_19C98;
  v32 = qword_19C98;
  if (!qword_19C98)
  {
    *(void *)buf = _NSConcreteStackBlock;
    v25 = 3221225472LL;
    v26 = sub_C1B0;
    v27 = &unk_14520;
    v28 = &v29;
    sub_C1B0((uint64_t)buf);
    v12 = (void *)v30[3];
  }

  v13 = v12;
  _Block_object_dispose(&v29, 8);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[_PSPersonalizationEvaluation intermediateCompiledModelURL](self, "intermediateCompiledModelURL"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[_PSPersonalizationEvaluation adaptableModelConfiguration](self, "adaptableModelConfiguration"));
  v23 = 0LL;
  v16 = (void *)objc_claimAutoreleasedReturnValue([v13 modelWithContentsOfURL:v14 configuration:v15 error:&v23]);
  v17 = v23;

  v18 = (void *)qword_19C78;
  if (v17)
  {
    if (os_log_type_enabled((os_log_t)qword_19C78, OS_LOG_TYPE_ERROR)) {
      sub_D668(v18, self, (uint64_t)v17);
    }
    v19 = 0LL;
  }

  else
  {
    if (os_log_type_enabled((os_log_t)qword_19C78, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_0,  (os_log_t)v18,  OS_LOG_TYPE_INFO,  "Cloning adaptable ML model to intermediate model and loading it was successful",  buf,  2u);
    }

    v19 = v16;
  }

LABEL_22:
  return v19;
}

id sub_5B64()
{
  uint64_t v4 = 0LL;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000LL;
  v0 = (void *)qword_19C60;
  uint64_t v7 = qword_19C60;
  if (!qword_19C60)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_7344;
    v3[3] = &unk_14520;
    v3[4] = &v4;
    sub_7344((uint64_t)v3);
    v0 = (void *)v5[3];
  }

  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_5C00( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

id sub_5E0C()
{
  uint64_t v4 = 0LL;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000LL;
  v0 = (void *)qword_19C68;
  uint64_t v7 = qword_19C68;
  if (!qword_19C68)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_73F8;
    v3[3] = &unk_14520;
    v3[4] = &v4;
    sub_73F8((uint64_t)v3);
    v0 = (void *)v5[3];
  }

  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_5EA8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

LABEL_23:
  return v30;
}

  return v31;
}

id sub_6394()
{
  uint64_t v4 = 0LL;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000LL;
  v0 = (void *)qword_19C70;
  uint64_t v7 = qword_19C70;
  if (!qword_19C70)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_74AC;
    v3[3] = &unk_14520;
    v3[4] = &v4;
    sub_74AC((uint64_t)v3);
    v0 = (void *)v5[3];
  }

  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_6430( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

LABEL_24:
  return v10;
}

Class sub_7128(uint64_t a1)
{
  if (!qword_19C48)
  {
    __int128 v3 = off_14540;
    uint64_t v4 = 0LL;
    qword_19C48 = _sl_dlopen(&v3, 0LL);
  }

  Class result = objc_getClass("MLModelConfiguration");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  qword_19C40 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  return result;
}

Class sub_71DC(uint64_t a1)
{
  if (!qword_19C48)
  {
    __int128 v3 = off_14540;
    uint64_t v4 = 0LL;
    qword_19C48 = _sl_dlopen(&v3, 0LL);
  }

  Class result = objc_getClass("MLParameterKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  qword_19C50 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  return result;
}

Class sub_7290(uint64_t a1)
{
  if (!qword_19C48)
  {
    __int128 v3 = off_14540;
    uint64_t v4 = 0LL;
    qword_19C48 = _sl_dlopen(&v3, 0LL);
  }

  Class result = objc_getClass("MLModel");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  qword_19C58 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  return result;
}

Class sub_7344(uint64_t a1)
{
  if (!qword_19C48)
  {
    __int128 v3 = off_14540;
    uint64_t v4 = 0LL;
    qword_19C48 = _sl_dlopen(&v3, 0LL);
  }

  Class result = objc_getClass("MLDictionaryFeatureProvider");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  qword_19C60 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  return result;
}

Class sub_73F8(uint64_t a1)
{
  if (!qword_19C48)
  {
    __int128 v3 = off_14540;
    uint64_t v4 = 0LL;
    qword_19C48 = _sl_dlopen(&v3, 0LL);
  }

  Class result = objc_getClass("MLArrayBatchProvider");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  qword_19C68 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  return result;
}

Class sub_74AC(uint64_t a1)
{
  if (!qword_19C48)
  {
    __int128 v3 = off_14540;
    uint64_t v4 = 0LL;
    qword_19C48 = _sl_dlopen(&v3, 0LL);
  }

  Class result = objc_getClass("MLMultiArray");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  qword_19C70 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  return result;
}

void sub_7560(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void sub_756C(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

  ;
}

void sub_7598( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

void sub_9824( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
}

id sub_9844()
{
  uint64_t v4 = 0LL;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000LL;
  v0 = (void *)qword_19C90;
  uint64_t v7 = qword_19C90;
  if (!qword_19C90)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_C0FC;
    v3[3] = &unk_14520;
    v3[4] = &v4;
    sub_C0FC((uint64_t)v3);
    v0 = (void *)v5[3];
  }

  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_98E0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_9C24( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

LABEL_63:
                v80 = objc_alloc_init((Class)v4[6]);
                v162 = 0u;
                v163 = 0u;
                v164 = 0u;
                v165 = 0u;
                v81 = v144;
                v82 = [v81 countByEnumeratingWithState:&v162 objects:v186 count:16];
                if (v82)
                {
                  v83 = v82;
                  v84 = *(void *)v163;
                  do
                  {
                    for (k = 0LL; k != v83; k = (char *)k + 1)
                    {
                      if (*(void *)v163 != v84) {
                        objc_enumerationMutation(v81);
                      }
                      v86 = [*(id *)(*((void *)&v162 + 1) + 8 * (void)k) copy];
                      [v80 addObject:v86];
                    }

                    v83 = [v81 countByEnumeratingWithState:&v162 objects:v186 count:16];
                  }

                  while (v83);
                }

                [v143 shuffle];
                v87 = (char *)[v81 count];
                v88 = (void *)qword_19C78;
                if (os_log_type_enabled((os_log_t)qword_19C78, OS_LOG_TYPE_INFO))
                {
                  v89 = v88;
                  v90 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLong:",  v87));
                  *(_DWORD *)buf = 138412290;
                  v192 = v90;
                  _os_log_impl(&dword_0, v89, OS_LOG_TYPE_INFO, "posCount: %@", buf, 0xCu);
                }

                v160 = 0u;
                v161 = 0u;
                v158 = 0u;
                v159 = 0u;
                v91 = v143;
                v92 = (char *)[v91 countByEnumeratingWithState:&v158 objects:v185 count:16];
                if (v92)
                {
                  v93 = v92;
                  v94 = 0LL;
                  v95 = *(void *)v159;
LABEL_74:
                  v96 = 0LL;
                  else {
                    v97 = 0LL;
                  }
                  while (1)
                  {
                    if (*(void *)v159 != v95) {
                      objc_enumerationMutation(v91);
                    }
                    if (v97 == v96) {
                      break;
                    }
                    v98 = [*(id *)(*((void *)&v158 + 1) + 8 * (void)v96) copy];
                    [v80 addObject:v98];

                    if (v93 == ++v96)
                    {
                      v93 = (char *)[v91 countByEnumeratingWithState:&v158 objects:v185 count:16];
                      v94 += (unint64_t)v96;
                      if (v93) {
                        goto LABEL_74;
                      }
                      break;
                    }
                  }
                }

                -[NSMutableArray addObject:](v136, "addObject:", v80);
                v99 = v144;
              }

              else
              {
                if ([v148 count])
                {
                  v147 = 0LL;
                  do
                  {
                    v100 = objc_alloc_init((Class)v4[6]);
                    v154 = 0u;
                    v155 = 0u;
                    v156 = 0u;
                    v157 = 0u;
                    v101 = (void *)objc_claimAutoreleasedReturnValue(-[_PSPersonalizationEvaluation featureNameDict](self, "featureNameDict"));
                    v102 = [v101 countByEnumeratingWithState:&v154 objects:v184 count:16];
                    if (v102)
                    {
                      v103 = v102;
                      v104 = *(void *)v155;
                      do
                      {
                        for (m = 0LL; m != v103; m = (char *)m + 1)
                        {
                          if (*(void *)v155 != v104) {
                            objc_enumerationMutation(v101);
                          }
                          if (([*(id *)(*((void *)&v154 + 1) + 8 * (void)m) isEqualToString:@"predictedClass"] & 1) == 0)
                          {
                            v106 = objc_opt_new(&OBJC_CLASS___NSObject);
                            [v100 addObject:v106];
                          }
                        }

                        v103 = [v101 countByEnumeratingWithState:&v154 objects:v184 count:16];
                      }

                      while (v103);
                    }

                    v152 = 0u;
                    v153 = 0u;
                    v150 = 0u;
                    v151 = 0u;
                    v107 = (void *)objc_claimAutoreleasedReturnValue(-[_PSPersonalizationEvaluation featureNameDict](self, "featureNameDict"));
                    v108 = [v107 countByEnumeratingWithState:&v150 objects:v183 count:16];
                    if (v108)
                    {
                      v109 = v108;
                      v110 = *(void *)v151;
                      do
                      {
                        for (n = 0LL; n != v109; n = (char *)n + 1)
                        {
                          if (*(void *)v151 != v110) {
                            objc_enumerationMutation(v107);
                          }
                          v112 = *(void **)(*((void *)&v150 + 1) + 8LL * (void)n);
                          if (([v112 isEqualToString:@"predictedClass"] & 1) == 0)
                          {
                            v113 = (void *)objc_claimAutoreleasedReturnValue(-[_PSPersonalizationEvaluation featureNameDict](self, "featureNameDict"));
                            v114 = (void *)objc_claimAutoreleasedReturnValue([v113 objectForKeyedSubscript:v112]);
                            v115 = [v114 intValue];
                            v116 = [v100 count];

                            if ((unint64_t)v116 > v115)
                            {
                              v117 = (void *)objc_claimAutoreleasedReturnValue([v148 objectAtIndexedSubscript:v147]);
                              v118 = (void *)objc_claimAutoreleasedReturnValue([v117 objectForKeyedSubscript:v112]);
                              v119 = (void *)objc_claimAutoreleasedReturnValue(-[_PSPersonalizationEvaluation featureNameDict](self, "featureNameDict"));
                              v120 = (void *)objc_claimAutoreleasedReturnValue([v119 objectForKeyedSubscript:v112]);
                              objc_msgSend( v100,  "setObject:atIndexedSubscript:",  v118,  (int)objc_msgSend(v120, "intValue"));
                            }
                          }
                        }

                        v109 = [v107 countByEnumeratingWithState:&v150 objects:v183 count:16];
                      }

                      while (v109);
                    }

                    v121 = [v100 copy];
                    [v144 addObject:v121];

                    ++v147;
                    uint64_t v4 = &NSCocoaErrorDomain_ptr;
                  }

                  while ((unint64_t)[v148 count] > v147);
                }

                v99 = v144;
                -[NSMutableArray addObject:](v136, "addObject:", v144);
              }

              v122 = (void *)objc_claimAutoreleasedReturnValue([v141 startDate]);
              -[NSMutableArray addObject:](v135, "addObject:", v122);

              uint64_t v7 = v140;
              v17 = v137;
              v16 = v138;
            }

            v18 = v142;
          }

          v18 = (char *)v18 + 1;
        }

        while (v18 != v16);
        v16 = [obj countByEnumeratingWithState:&v178 objects:v190 count:16];
      }

      while (v16);
    }

    objc_autoreleasePoolPop(context);
    uint64_t v6 = v132 + 10;
    uint64_t v8 = v131 + 10;
    if (v131 >= 0x5B)
    {
      v123 = (void *)qword_19C78;
      if (os_log_type_enabled((os_log_t)qword_19C78, OS_LOG_TYPE_INFO))
      {
        v124 = v123;
        v125 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v7));
        *(_DWORD *)buf = 138412290;
        v192 = v125;
        _os_log_impl(&dword_0, v124, OS_LOG_TYPE_INFO, "knowledge store events with data: %@", buf, 0xCu);
      }

      v126 = v136;
      v127 = v136;
      goto LABEL_117;
    }
  }

  if (os_log_type_enabled((os_log_t)qword_19C78, OS_LOG_TYPE_ERROR)) {
    sub_D784((uint64_t)v11, (os_log_s *)v12, v128);
  }

  objc_autoreleasePoolPop(context);
  v127 = 0LL;
  v126 = v136;
LABEL_117:

  return v127;
}

LABEL_34:
        v59 = v28;
LABEL_35:

        objc_autoreleasePoolPop(context);
        uint64_t v8 = v57 + 1;
      }

      while ((id)(v57 + 1) != v55);
      v55 = [obj countByEnumeratingWithState:&v76 objects:v87 count:16];
      if (!v55) {
        goto LABEL_39;
      }
    }
  }

  v59 = 0LL;
LABEL_39:

  return v52;
}

void sub_B3D4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,char a52)
{
}

id sub_B3F8()
{
  uint64_t v4 = 0LL;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000LL;
  v0 = (void *)qword_19CA8;
  uint64_t v7 = qword_19CA8;
  if (!qword_19CA8)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_C318;
    v3[3] = &unk_14520;
    v3[4] = &v4;
    sub_C318((uint64_t)v3);
    v0 = (void *)v5[3];
  }

  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_B494( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_BA70( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, char a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, char a29, uint64_t a30, uint64_t a31, uint64_t a32, char a33)
{
}

uint64_t sub_BAC0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_BAD0(uint64_t a1)
{
}

void sub_BAD8(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 task]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 error]);

  if (v5)
  {
    uint64_t v6 = (void *)qword_19C78;
    if (os_log_type_enabled((os_log_t)qword_19C78, OS_LOG_TYPE_ERROR)) {
      sub_D7F0(v6, v3);
    }
  }

  if (((*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 224LL) + 16LL))() & 1) == 0)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v3 task]);
    [v7 cancel];

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL));
  }
}

void sub_BB90(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (os_log_s *)qword_19C78;
  if (os_log_type_enabled((os_log_t)qword_19C78, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = a1[4];
    *(_DWORD *)buf = 138412290;
    uint64_t v14 = v5;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "Saving the adapted model at %@", buf, 0xCu);
  }

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 model]);
  uint64_t v7 = a1[4];
  uint64_t v8 = *(void *)(a1[5] + 8LL);
  id obj = *(id *)(v8 + 40);
  unsigned __int8 v9 = [v6 writeToURL:v7 error:&obj];
  objc_storeStrong((id *)(v8 + 40), obj);

  if (*(void *)(*(void *)(a1[5] + 8LL) + 40LL) || (v9 & 1) == 0)
  {
    uint64_t v10 = (os_log_s *)qword_19C78;
    if (os_log_type_enabled((os_log_t)qword_19C78, OS_LOG_TYPE_ERROR)) {
      sub_D898((uint64_t)(a1 + 5), v10, v11);
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1[6] + 8LL) + 40LL));
}

Class sub_C048(uint64_t a1)
{
  if (!qword_19C88)
  {
    __int128 v3 = off_145D0;
    uint64_t v4 = 0LL;
    qword_19C88 = _sl_dlopen(&v3, 0LL);
  }

  Class result = objc_getClass("MLModelConfiguration");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  qword_19C80 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  return result;
}

Class sub_C0FC(uint64_t a1)
{
  if (!qword_19C88)
  {
    __int128 v3 = off_145D0;
    uint64_t v4 = 0LL;
    qword_19C88 = _sl_dlopen(&v3, 0LL);
  }

  Class result = objc_getClass("MLParameterKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  qword_19C90 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  return result;
}

Class sub_C1B0(uint64_t a1)
{
  if (!qword_19C88)
  {
    __int128 v3 = off_145D0;
    uint64_t v4 = 0LL;
    qword_19C88 = _sl_dlopen(&v3, 0LL);
  }

  Class result = objc_getClass("MLModel");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  qword_19C98 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  return result;
}

Class sub_C264(uint64_t a1)
{
  if (!qword_19C88)
  {
    __int128 v3 = off_145D0;
    uint64_t v4 = 0LL;
    qword_19C88 = _sl_dlopen(&v3, 0LL);
  }

  Class result = objc_getClass("MLFeatureValue");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  qword_19CA0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  return result;
}

Class sub_C318(uint64_t a1)
{
  if (!qword_19C88)
  {
    __int128 v3 = off_145D0;
    uint64_t v4 = 0LL;
    qword_19C88 = _sl_dlopen(&v3, 0LL);
  }

  Class result = objc_getClass("MLDictionaryFeatureProvider");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  qword_19CA8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  return result;
}

Class sub_C3CC(uint64_t a1)
{
  if (!qword_19C88)
  {
    __int128 v3 = off_145D0;
    uint64_t v4 = 0LL;
    qword_19C88 = _sl_dlopen(&v3, 0LL);
  }

  Class result = objc_getClass("MLMultiArray");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  qword_19CB0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  return result;
}

Class sub_C480(uint64_t a1)
{
  if (!qword_19C88)
  {
    __int128 v3 = off_145D0;
    uint64_t v4 = 0LL;
    qword_19C88 = _sl_dlopen(&v3, 0LL);
  }

  Class result = objc_getClass("MLUpdateProgressHandlers");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  qword_19CB8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  return result;
}

Class sub_C534(uint64_t a1)
{
  if (!qword_19C88)
  {
    __int128 v3 = off_145D0;
    uint64_t v4 = 0LL;
    qword_19C88 = _sl_dlopen(&v3, 0LL);
  }

  Class result = objc_getClass("MLUpdateTask");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  qword_19CC0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  return result;
}

void sub_C5E8(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

uint64_t _PSUnarchiverZip(const void *a1, uint64_t a2, NSURL *a3)
{
  uint64_t v5 = a3;
  os_log_t v6 = os_log_create("com.apple.PeopleSuggester.unarchiver", "general");
  uint64_t v7 = (void *)qword_19CC8;
  qword_19CC8 = (uint64_t)v6;

  uint64_t v8 = 0LL;
  if (!a1 || !v5) {
    goto LABEL_11;
  }
  uint64_t v9 = archive_read_new();
  if (!v9)
  {
LABEL_10:
    uint64_t v8 = 0LL;
    goto LABEL_11;
  }

  uint64_t v10 = v9;
  if (archive_read_support_format_zip())
  {
    uint64_t v11 = (void *)qword_19CC8;
    if (os_log_type_enabled((os_log_t)qword_19CC8, OS_LOG_TYPE_INFO))
    {
      v12 = v11;
      *(_DWORD *)buf = 136446210;
      *(void *)&uint8_t buf[4] = archive_error_string(v10);
      _os_log_impl( &dword_0,  v12,  OS_LOG_TYPE_INFO,  "_PSUnarchiver: archive_read unable to set supported formats - %{public}s.",  buf,  0xCu);
    }

LABEL_7:
    if (archive_read_free(v10))
    {
      v13 = (void *)qword_19CC8;
      if (os_log_type_enabled((os_log_t)qword_19CC8, OS_LOG_TYPE_ERROR)) {
        sub_D910(v13);
      }
    }

    goto LABEL_10;
  }

  int support_filter_all = archive_read_support_filter_all(v10);
  if (support_filter_all != -20 && support_filter_all)
  {
    v16 = (void *)qword_19CC8;
    if (os_log_type_enabled((os_log_t)qword_19CC8, OS_LOG_TYPE_ERROR)) {
      sub_DEE8(v16);
    }
    goto LABEL_7;
  }

  if (!archive_read_open_memory(v10, a1, a2))
  {
    v18 = v5;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    NSFileAttributeKey v97 = NSFilePosixPermissions;
    v98 = &off_14E78;
    v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v98,  &v97,  1LL));
    id v91 = 0LL;
    unsigned __int8 v21 = [v19 createDirectoryAtURL:v18 withIntermediateDirectories:0 attributes:v20 error:&v91];
    id v22 = v91;

    if ((v21 & 1) != 0) {
      goto LABEL_22;
    }
    v26 = (void *)objc_claimAutoreleasedReturnValue([v22 domain]);
    if ([v26 isEqualToString:NSCocoaErrorDomain])
    {
      v27 = (char *)[v22 code];

      if (v27 == &stru_1F8.sectname[12])
      {
LABEL_22:

        uint64_t v23 = archive_write_disk_new();
        if (v23)
        {
          uint64_t v24 = v23;
          if (archive_write_disk_set_standard_lookup())
          {
            v25 = (void *)qword_19CC8;
            if (os_log_type_enabled((os_log_t)qword_19CC8, OS_LOG_TYPE_ERROR)) {
              sub_DD90(v25);
            }
          }

          else
          {
            if (!archive_write_disk_set_options(v24, 788LL))
            {
              v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL path](v18, "path"));
              if (v32)
              {
                v34 = v32;
                v35 = realpath_DARWIN_EXTSN(-[NSString fileSystemRepresentation](v34, "fileSystemRepresentation"), 0LL);
                if (v35)
                {
                  v36 = v35;
                  v37 = -[NSString initWithUTF8String:](objc_alloc(&OBJC_CLASS___NSString), "initWithUTF8String:", v35);
                  v38 = v34;
                  v34 = v37;

                  free(v36);
                }

                else
                {
                  v39 = (void *)qword_19CC8;
                  if (os_log_type_enabled((os_log_t)qword_19CC8, OS_LOG_TYPE_ERROR)) {
                    sub_DC88((uint64_t)v34, v39);
                  }
                }
              }

              else
              {
                v34 = 0LL;
              }

              *(void *)&__int128 v33 = 134218240LL;
              __int128 v88 = v33;
              v89 = v34;
              while (1)
              {
                uint64_t v90 = 0LL;
                int v40 = archive_read_next_header(v10, &v90);
                if (v40)
                {
                  if (v40 == 1)
                  {
                    uint64_t v8 = 1LL;
                    goto LABEL_90;
                  }

                  v62 = (void *)qword_19CC8;
                  if (os_log_type_enabled((os_log_t)qword_19CC8, OS_LOG_TYPE_ERROR)) {
                    sub_DAD0(v62);
                  }
                  goto LABEL_89;
                }

                int v41 = archive_entry_filetype(v90);
                v42 = objc_autoreleasePoolPush();
                uint64_t v43 = archive_entry_pathname_utf8(v90);
                if (!v43)
                {
                  v63 = (os_log_s *)qword_19CC8;
                  if (os_log_type_enabled((os_log_t)qword_19CC8, OS_LOG_TYPE_ERROR)) {
                    sub_DB40(v63, v64, v65, v66, v67, v68, v69, v70);
                  }
                  goto LABEL_88;
                }

                v44 = (const char *)v43;
                uint64_t v45 = 0LL;
                do
                  int v46 = *(unsigned __int8 *)(v43 + v45++);
                while (v46 == 47);
                uint64_t v47 = v45 - 1;
                if (v45 != 1)
                {
                  v48 = (os_log_s *)qword_19CC8;
                  if (os_log_type_enabled((os_log_t)qword_19CC8, OS_LOG_TYPE_ERROR))
                  {
                    size_t v58 = strlen(v44);
                    *(_DWORD *)buf = v88;
                    *(void *)&uint8_t buf[4] = v47;
                    __int16 v95 = 2048;
                    size_t v96 = v58;
                    _os_log_error_impl( &dword_0,  v48,  OS_LOG_TYPE_ERROR,  "_PSUnarchiver: archive_entry with absolute path encountered...ignoring leading %zu of %zu bytes.",  buf,  0x16u);
                  }
                }

                v49 = -[NSString initWithUTF8String:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithUTF8String:",  &v44[v47]);
                NSUInteger v50 = -[NSString length](v49, "length");
                if (!v50 && v41 != 0x4000)
                {
                  v71 = (os_log_s *)qword_19CC8;
                  if (os_log_type_enabled((os_log_t)qword_19CC8, OS_LOG_TYPE_ERROR)) {
                    sub_DC54(v71, v72, v73, v74, v75, v76, v77, v78);
                  }

LABEL_88:
                  objc_autoreleasePoolPop(v42);
                  goto LABEL_89;
                }

                v51 = (void *)objc_claimAutoreleasedReturnValue( -[NSString stringByAppendingPathComponent:]( v89,  "stringByAppendingPathComponent:",  v49,  v88));

                uint64_t v52 = v90;
                id v53 = v51;
                archive_entry_update_pathname_utf8(v52, [v53 fileSystemRepresentation]);

                objc_autoreleasePoolPop(v42);
                if (v41 == 0x4000) {
                  int v54 = 448;
                }
                else {
                  int v54 = 384;
                }
                uint64_t v55 = v90;
                int v56 = archive_entry_perm(v90);
                archive_entry_set_perm(v55, v56 & v54);
                if (v50)
                {
                  if (archive_write_header(v24, v90))
                  {
                    v81 = (void *)qword_19CC8;
                    if (!os_log_type_enabled((os_log_t)qword_19CC8, OS_LOG_TYPE_INFO)) {
                      goto LABEL_89;
                    }
                    v82 = v81;
                    uint64_t v83 = archive_error_string(v24);
                    *(_DWORD *)buf = 136446210;
                    *(void *)&uint8_t buf[4] = v83;
                    v84 = "_PSUnarchiver: archive_write_header failed - %{public}s.";
                    goto LABEL_102;
                  }

                  if (!archive_entry_size_is_set(v90) || archive_entry_size(v90) >= 1)
                  {
                    while (1)
                    {
                      int v57 = archive_read_data_block(v10, buf, &v93, &v92);
                      if (v57) {
                        break;
                      }
                      if (archive_write_data_block(v24, *(void *)buf, v93, v92) < 0)
                      {
                        v60 = (void *)qword_19CC8;
                        if (os_log_type_enabled((os_log_t)qword_19CC8, OS_LOG_TYPE_ERROR)) {
                          sub_DBE4(v60);
                        }
                        goto LABEL_89;
                      }
                    }

                    if (v57 == 1) {
                      goto LABEL_73;
                    }
                    v59 = (void *)qword_19CC8;
                    if (os_log_type_enabled((os_log_t)qword_19CC8, OS_LOG_TYPE_ERROR)) {
                      sub_DB74(v59);
                    }
                    goto LABEL_89;
                  }

LABEL_73:
                }
              }

              v85 = (void *)qword_19CC8;
              if (os_log_type_enabled((os_log_t)qword_19CC8, OS_LOG_TYPE_INFO))
              {
                v82 = v85;
                uint64_t v87 = archive_error_string(v24);
                *(_DWORD *)buf = 136446210;
                *(void *)&uint8_t buf[4] = v87;
                v84 = "_PSUnarchiver: archive_write_finish_entry failed - %{public}s.";
LABEL_102:
                _os_log_impl(&dword_0, v82, OS_LOG_TYPE_INFO, v84, buf, 0xCu);
              }

LABEL_89:
              uint64_t v8 = 0LL;
LABEL_90:
              if (archive_write_close(v24))
              {
                v79 = (void *)qword_19CC8;
                if (os_log_type_enabled((os_log_t)qword_19CC8, OS_LOG_TYPE_ERROR)) {
                  sub_DA60(v79);
                }
                uint64_t v8 = 0LL;
              }

              if (archive_write_free(v24))
              {
                v80 = (void *)qword_19CC8;
                if (os_log_type_enabled((os_log_t)qword_19CC8, OS_LOG_TYPE_ERROR)) {
                  sub_D9F0(v80);
                }
              }

              goto LABEL_40;
            }

            v28 = (void *)qword_19CC8;
            if (os_log_type_enabled((os_log_t)qword_19CC8, OS_LOG_TYPE_ERROR)) {
              sub_DD20(v28);
            }
          }

          if (archive_write_free(v24))
          {
            v29 = (void *)qword_19CC8;
            if (os_log_type_enabled((os_log_t)qword_19CC8, OS_LOG_TYPE_ERROR)) {
              sub_D9F0(v29);
            }
          }
        }

LABEL_39:
        uint64_t v8 = 0LL;
LABEL_40:

        if (archive_read_close(v10))
        {
          v30 = (void *)qword_19CC8;
          if (os_log_type_enabled((os_log_t)qword_19CC8, OS_LOG_TYPE_ERROR)) {
            sub_D980(v30);
          }
        }

        goto LABEL_43;
      }
    }

    else
    {
    }

    if (os_log_type_enabled((os_log_t)qword_19CC8, OS_LOG_TYPE_ERROR)) {
      sub_DE00();
    }

    goto LABEL_39;
  }

  v17 = (void *)qword_19CC8;
  if (os_log_type_enabled((os_log_t)qword_19CC8, OS_LOG_TYPE_ERROR)) {
    sub_DE78(v17);
  }
  uint64_t v8 = 0LL;
LABEL_43:
  if (archive_read_free(v10))
  {
    v31 = (void *)qword_19CC8;
    if (os_log_type_enabled((os_log_t)qword_19CC8, OS_LOG_TYPE_ERROR)) {
      sub_D910(v31);
    }
  }

LABEL_11:
  return v8;
}

void sub_CE24( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

uint64_t sub_CE44()
{
  return archive_error_string(v0);
}

id sub_CE50(id a1)
{
  return a1;
}

  ;
}

void sub_CE64(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void sub_CEF8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_CF2C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_CF60( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_CF94( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_CFC8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_CFFC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_D030( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_D064( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_D098( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_D0CC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_D100( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_D134( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_D168()
{
}

void sub_D1C8()
{
}

void sub_D228()
{
}

void sub_D254()
{
}

void sub_D280()
{
}

void sub_D2AC()
{
}

void sub_D2D8()
{
}

void sub_D304(uint8_t *a1, _BYTE *a2, os_log_s *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_7560( &dword_0,  a3,  (uint64_t)a3,  "_PSRuleRankingMLModel - People Suggester feature extraction MLDictionaryFeatureProvider:initWithDictionary failure",  a1);
}

void sub_D338()
{
}

void sub_D364()
{
}

void sub_D3C4()
{
}

void sub_D424( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_D48C()
{
}

void sub_D4B8()
{
}

void sub_D4E4( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_D548( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_D5AC( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_D610()
{
}

void sub_D63C()
{
}

void sub_D668(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = a1;
  uint8_t v6 = (void *)objc_claimAutoreleasedReturnValue([a2 intermediateCompiledModelURL]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 absoluteString]);
  int v8 = 138412546;
  uint64_t v9 = v7;
  __int16 v10 = 2112;
  uint64_t v11 = a3;
  _os_log_error_impl( &dword_0,  v5,  OS_LOG_TYPE_ERROR,  "Adaptable ML model at path %@ load failed with error：%@",  (uint8_t *)&v8,  0x16u);

  sub_C5F4();
}

void sub_D72C()
{
}

void sub_D758()
{
}

void sub_D784(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  int v3 = 138412290;
  uint64_t v4 = a1;
  sub_C5E8(&dword_0, a2, a3, "knowledgeStore executeQuery failed with error: %@", (uint8_t *)&v3);
}

void sub_D7F0(void *a1, void *a2)
{
  int v3 = a1;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a2 task]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 error]);
  int v7 = 138412290;
  int v8 = v5;
  sub_C5E8(&dword_0, v3, v6, "context.task.error: %@", (uint8_t *)&v7);

  sub_C5F4();
}

void sub_D898(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(*(void *)(*(void *)a1 + 8LL) + 40LL);
  int v4 = 138412290;
  uint64_t v5 = v3;
  sub_C5E8(&dword_0, a2, a3, "Saving the adapted model failed with error: %@", (uint8_t *)&v4);
}

void sub_D910(void *a1)
{
  sub_CE38();
}

void sub_D980(void *a1)
{
  sub_CE38();
}

void sub_D9F0(void *a1)
{
  sub_CE38();
}

void sub_DA60(void *a1)
{
  sub_CE38();
}

void sub_DAD0(void *a1)
{
  sub_CE38();
}

void sub_DB40( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_DB74(void *a1)
{
  sub_CE38();
}

void sub_DBE4(void *a1)
{
  sub_CE38();
}

void sub_DC54( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_DC88(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  uint64_t v4 = __error();
  uint64_t v5 = strerror(*v4);
  int v7 = 138412546;
  uint64_t v8 = a1;
  __int16 v9 = 2080;
  __int16 v10 = v5;
  sub_CE64( &dword_0,  v3,  v6,  "_PSUnarchiver: unable to resolve physical path for destination path %@ - %s.",  (uint8_t *)&v7);

  sub_CE38();
}

void sub_DD20(void *a1)
{
  sub_CE38();
}

void sub_DD90(void *a1)
{
  sub_CE38();
}

void sub_DE00()
{
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  sub_CE64(&dword_0, v1, (uint64_t)v1, "_PSUnarchiver: failed to create directory at %@ - %@.", v2);
}

void sub_DE78(void *a1)
{
  sub_CE38();
}

void sub_DEE8(void *a1)
{
  sub_CE38();
}

id objc_msgSend_cloneAdaptableModel_toFilePath_originalXgboostModelName_clonedXgboostModelName_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cloneAdaptableModel:toFilePath:originalXgboostModelName:clonedXgboostModelName:");
}

id objc_msgSend_updateTaskForModelAtURL_trainingData_configuration_progressHandlers_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateTaskForModelAtURL:trainingData:configuration:progressHandlers:error:");
}

id objc_msgSend_writeToURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:error:");
}