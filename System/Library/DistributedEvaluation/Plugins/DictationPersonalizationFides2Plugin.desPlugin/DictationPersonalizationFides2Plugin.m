LABEL_10:
LABEL_11:
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = v8;
  v20 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
  if (v20)
  {
    v21 = v20;
    v38 = *(void *)v44;
    do
    {
      for (i = 0LL; i != v21; i = (char *)i + 1)
      {
        if (*(void *)v44 != v38) {
          objc_enumerationMutation(obj);
        }
        v23 = *(void *)(*((void *)&v43 + 1) + 8LL * (void)i);
        v24 = objc_alloc_init(&OBJC_CLASS___DODMLASRSchemaDODMLASRDecodingResult);
        -[NSMutableArray addObject:](v42, "addObject:", v24);
        [v24 setConfigName:v23];
        v25 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v23]);
        v26 = (void *)objc_claimAutoreleasedReturnValue( -[FidesSelfHelper _decodingMetricsFromMetricsDict:]( self,  "_decodingMetricsFromMetricsDict:",  v25));
        [v24 setDecodingMetrics:v26];

        v27 = (void *)objc_claimAutoreleasedReturnValue([v40 objectForKeyedSubscript:v23]);
        v28 = (void *)objc_claimAutoreleasedReturnValue( -[FidesSelfHelper _tokensFromTokenDict:privateTokens:]( self,  "_tokensFromTokenDict:privateTokens:",  v27,  v41));
        [v24 setTokens:v28];

        v29 = (void *)objc_claimAutoreleasedReturnValue([v39 objectForKeyedSubscript:v23]);
        v30 = (void *)objc_claimAutoreleasedReturnValue( -[FidesSelfHelper _utteranceInfosFromUtteranceInfoDict:privateTokens:]( self,  "_utteranceInfosFromUtteranceInfoDict:privateTokens:",  v29,  v41));
        [v24 setUtterances:v30];

        v31 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"DecodeDuration"]);
        [v31 doubleValue];
        v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v32 * 1000000000.0));
        objc_msgSend(v24, "setDecodeDurationInNs:", objc_msgSend(v33, "unsignedLongLongValue"));

        [v7 removeObjectForKey:@"DecodeDuration"];
      }

      v21 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
    }

    while (v21);
  }

  if (a4) {
    *a4 = v41;
  }

  return v42;
}

void sub_306C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, __int128 buf)
{
  if (a2 == 1)
  {
    id v33 = objc_begin_catch(a1);
    v34 = (os_log_s *)AFSiriLogContextFides;
    if (os_log_type_enabled(AFSiriLogContextFides, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 136315394;
      *(void *)((char *)&buf + 4) = "-[FidesSelfHelper _decodingMetricsFromMetricsDict:]";
      WORD6(buf) = 2112;
      *(void *)((char *)&buf + 14) = a11;
      _os_log_error_impl( &dword_0,  v34,  OS_LOG_TYPE_ERROR,  "%s Fides SELF: Encountered malformed string during SELF logging for interpolation weights in speech results from recognizer. String: %@",  (uint8_t *)&buf,  0x16u);
      v34 = (os_log_s *)AFSiriLogContextFides;
    }

    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[FidesSelfHelper _decodingMetricsFromMetricsDict:]";
      _os_log_error_impl( &dword_0,  v34,  OS_LOG_TYPE_ERROR,  "%s Fides SELF: Expected interpolation weight sets separated by delimter ';' - starting with a set of weights del"
        "imited by ',' and ending the with start/end times delimited by ':'. Ex: '0.999646,0.000354:0:4280;0.947514,0.000158:0:3859'",
        (uint8_t *)&buf,
        0xCu);
    }

    objc_end_catch();
    JUMPOUT(0x2FF8LL);
  }

  _Unwind_Resume(a1);
}

LABEL_12:
}

void sub_4ED8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v8 = objc_alloc_init(&OBJC_CLASS___DODMLASRSchemaDODMLASREntityCategoryCount);
  [v8 setEntityCategory:v6];

  id v7 = [v5 unsignedLongValue];
  [v8 setCount:v7];
  [*(id *)(a1 + 32) addPreprocessingEntityCategoryCounts:v8];
}

void sub_4F64(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v8 = objc_alloc_init(&OBJC_CLASS___DODMLASRSchemaDODMLASREntityCategoryCount);
  [v8 setEntityCategory:v6];

  id v7 = [v5 unsignedLongValue];
  [v8 setCount:v7];
  [*(id *)(a1 + 32) addPostprocessingEntityCategoryCounts:v8];
}

id objc_msgSend_valueForKeyPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForKeyPath:");
}