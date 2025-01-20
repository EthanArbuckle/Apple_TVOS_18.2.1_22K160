@interface TITypingDESPlugin
+ (id)stringForConfiderence:(int)a3;
- (id)evaluateRecipe:(id)a3 recordInfo:(id)a4 recordData:(id)a5 attachments:(id)a6 error:(id *)a7;
- (id)getAlignmentStats:(id)a3;
- (id)getTopStatisticsFromResults:(double)a3[4];
- (id)runExperimentCPEvalForSession:(id)a3 forRecipe:(id)a4;
- (id)summaryStatisticsEvalResults:(const void *)a3 ofEntries:(id)a4;
- (vector<TI::CP::ContinuousPathTestCase,)convertAlignedEntriesFromSession:(TITypingDESPlugin *)self;
- (void)cpEvalResult:(void *)a3 fromAlignedSession:(id)a4 forRecipe:(id)a5;
@end

@implementation TITypingDESPlugin

- (id)evaluateRecipe:(id)a3 recordInfo:(id)a4 recordData:(id)a5 attachments:(id)a6 error:(id *)a7
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a4;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"type"]);

  LODWORD(v12) = [v14 isEqualToString:@"typingSession"];
  if ((_DWORD)v12)
  {
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"expName"]);
    id v27 = 0LL;
    id v16 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  objc_opt_class(&OBJC_CLASS___TITypingSessionAligned),  v11,  &v27);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    id v18 = v27;
    if (v18)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue([v18 description]);
        *(_DWORD *)buf = 136315394;
        v29 = "-[TITypingDESPlugin evaluateRecipe:recordInfo:recordData:attachments:error:]";
        __int16 v30 = 2112;
        v31 = v19;
        _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s  Couldn't decode dodML typing session record: %@",  buf,  0x16u);
      }

      v20 = (void *)objc_claimAutoreleasedReturnValue([v18 description]);
      v21 = @"error";
      v22 = v13;
      v23 = v20;
    }

    else
    {
      if (!v15) {
        goto LABEL_7;
      }
      if (-[__CFString isEqualToString:](v15, "isEqualToString:", @"alignmentStats"))
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[TITypingDESPlugin getAlignmentStats:](self, "getAlignmentStats:", v17));
        [v13 setObject:v25 forKeyedSubscript:v15];

        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v29 = "-[TITypingDESPlugin evaluateRecipe:recordInfo:recordData:attachments:error:]";
          __int16 v30 = 2112;
          v31 = v13;
          _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s  result: %@", buf, 0x16u);
        }

        goto LABEL_7;
      }

      uint64_t v26 = objc_claimAutoreleasedReturnValue( -[TITypingDESPlugin runExperimentCPEvalForSession:forRecipe:]( self,  "runExperimentCPEvalForSession:forRecipe:",  v17,  v10));
      v20 = (void *)v26;
      if (v26) {
        v23 = (void *)v26;
      }
      else {
        v23 = &__NSDictionary0__struct;
      }
      v22 = v13;
      v21 = v15;
    }

    [v22 setObject:v23 forKeyedSubscript:v21];

LABEL_7:
  }

  return v13;
}

- (id)getAlignmentStats:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id v27 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 alignedEntries]);
  id v7 = [v6 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v29;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = objc_msgSend( (id)objc_opt_class(self),  "stringForConfiderence:",  objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * (void)i), "inSessionAlignmentConfidence"));
        id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
        v13 = (char *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v12]);

        if (v13)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v12]);
          v13 = (char *)[v14 integerValue];
        }

        v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v13 + 1));
        [v5 setObject:v15 forKeyedSubscript:v12];
      }

      id v8 = [v6 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }

    while (v8);
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue([v27 alignedEntries]);
  id v17 = [v16 count];

  if (v17)
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v27 highConfAlignedSubSegment]);
    v19 = (void *)objc_claimAutoreleasedReturnValue([v18 componentsSeparatedByString:@" "]);
    float v20 = (float)(unint64_t)[v19 count];
    v21 = (void *)objc_claimAutoreleasedReturnValue([v27 alignedEntries]);
    float v22 = v20 / (float)(unint64_t)[v21 count];
  }

  else
  {
    float v22 = 0.0;
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v27 success]));
  [v5 setObject:v23 forKeyedSubscript:@"successEntireSession"];

  *(float *)&double v24 = v22;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v24));
  [v5 setObject:v25 forKeyedSubscript:@"ratioContiguousHighConfAlignment"];

  return v5;
}

- (id)runExperimentCPEvalForSession:(id)a3 forRecipe:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"expName"]);
  uint64_t v14 = 0LL;
  uint64_t v15 = 0LL;
  uint64_t v16 = 0LL;
  unsigned int v17 = -1;
  -[TITypingDESPlugin cpEvalResult:fromAlignedSession:forRecipe:]( self,  "cpEvalResult:fromAlignedSession:forRecipe:",  &v14,  v7,  v6);

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 alignedEntries]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[TITypingDESPlugin summaryStatisticsEvalResults:ofEntries:]( self,  "summaryStatisticsEvalResults:ofEntries:",  &v14,  v9));

  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v17));
  [v10 setObject:v11 forKeyedSubscript:@"db_records_size"];

  [v10 setObject:v8 forKeyedSubscript:@"algorithm"];
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLong:",  0x34F72C234F72C235LL * ((v15 - v14) >> 3)));
  [v10 setObject:v12 forKeyedSubscript:@"num_evaluated_entries"];

  id v18 = (void **)&v14;
  sub_91C0(&v18);

  return v10;
}

- (void)cpEvalResult:(void *)a3 fromAlignedSession:(id)a4 forRecipe:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"expName"]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"sources"]);
  int v30 = 4;
  uint64_t v32 = 0LL;
  __int128 v31 = xmmword_ED70;
  __int128 v33 = xmmword_ED88;
  uint64_t v34 = 0x3FF0000000000000LL;
  uint64_t v36 = 0LL;
  __int128 v35 = xmmword_EDA0;
  int v37 = 1056964608;
  uint64_t v38 = 0x200000001LL;
  char v39 = 1;
  unsigned int v40 = 3;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  memset(v43, 0, sizeof(v43));
  KB::String::String((KB::String *)v44);
  v44[8] = 1050253722;
  char v54 = 1;
  __int128 v45 = xmmword_ECF0;
  __int128 v46 = xmmword_ED00;
  __int128 v47 = xmmword_ED10;
  __int128 v48 = xmmword_ED20;
  uint64_t v49 = 0x4010000000000000LL;
  __int128 v50 = xmmword_ED30;
  __int128 v51 = xmmword_ED40;
  __int128 v52 = xmmword_ECE0;
  __int128 v53 = xmmword_ED50;
  uint64_t v55 = 0x404B30CB295E9E1BLL;
  uint64_t v56 = 0x4019D81D7DBF4880LL;
  sub_A568((uint64_t)v27);
  -[TITypingDESPlugin convertAlignedEntriesFromSession:](self, "convertAlignedEntriesFromSession:", v8);
  if ([v10 isEqualToString:@"shapeMatching"])
  {
    int v28 = 1;
    int v12 = 2;
    goto LABEL_14;
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue([v8 locale]);
  uint64_t v14 = (NSString *)objc_claimAutoreleasedReturnValue([v13 localeIdentifier]);
  TI::CP::CPEval::load_language_resources((TI::CP::CPEval *)v27, v14, 0LL, 0.4);

  if (![v10 isEqualToString:@"cp-ensemble"])
  {
    int v12 = [v10 isEqualToString:@"cp-ml"];
    goto LABEL_14;
  }

  if (!v11)
  {
    int v12 = 3;
    goto LABEL_14;
  }

  float v22 = v11;
  unsigned int v40 = [v11 integerValue];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"sourceWeights"]);
  if ((unint64_t)[v15 count] > 2)
  {
    int v16 = 3;
LABEL_11:
    uint64_t v17 = 0LL;
    uint64_t v18 = v16;
    do
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue([v15 objectAtIndexedSubscript:v17]);
      [v19 floatValue];
      *((double *)&v31 + v17) = v20;

      ++v17;
    }

    while (v18 != v17);
    goto LABEL_13;
  }

  int v16 = [v15 count];
  if (v16 >= 1) {
    goto LABEL_11;
  }
LABEL_13:

  int v12 = 3;
  id v11 = v22;
LABEL_14:
  v21 = objc_autoreleasePoolPush();
  TI::CP::CPEval::evaluate_records(v27, v26, v12, (uint64_t)&v30, (uint64_t)&v23);
  sub_A6B0((void **)a3);
  *(_OWORD *)a3 = v23;
  *((void *)a3 + 2) = v24;
  uint64_t v24 = 0LL;
  __int128 v23 = 0uLL;
  *((_DWORD *)a3 + 6) = v25;
  __int128 v29 = (void **)&v23;
  sub_91C0(&v29);
  objc_autoreleasePoolPop(v21);
  *(void *)&__int128 v23 = v26;
  sub_A714((void ***)&v23);
  sub_A784((uint64_t)v27);
  KB::String::~String((KB::String *)v44);
  if ((v43[15] & 0x80000000) != 0) {
    operator delete(*((void **)&v42 + 1));
  }
  if (SBYTE7(v42) < 0) {
    operator delete((void *)v41);
  }
}

- (vector<TI::CP::ContinuousPathTestCase,)convertAlignedEntriesFromSession:(TITypingDESPlugin *)self
{
  id v5 = a4;
  retstr->var1 = 0LL;
  retstr->var2.var0 = 0LL;
  retstr->var0 = 0LL;
  id v6 = objc_autoreleasePoolPush();
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 locale]);
  id v8 = (TI::CP::TestCaseConverter *)objc_claimAutoreleasedReturnValue([v7 localeIdentifier]);
  TI::CP::TestCaseConverter::create_testcase_converter(v8, 0LL, (char **)&v22);

  id v9 = (char *)v22;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 layouts]);
  TI::CP::TestCaseConverter::set_layouts((uint64_t)v9, v10);

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v5 alignedEntries]);
  id v12 = [v11 count];

  if (v12)
  {
    unint64_t v13 = 0LL;
    do
    {
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v5 alignedEntries]);
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectAtIndexedSubscript:v13]);

      if ([v15 isContinuousPathConversion])
      {
        int v16 = (void *)objc_claimAutoreleasedReturnValue([v15 alignedTouches]);
        id v17 = [v16 count];

        if (v17)
        {
          TI::CP::TestCaseConverter::convert(v22, v15, (uint64_t)v23);
          int v24 = v13;
          sub_A030((uint64_t *)retstr, (uint64_t)v23);
          sub_AAB8((uint64_t)v23);
        }
      }

      ++v13;
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v5 alignedEntries]);
      id v19 = [v18 count];
    }

    while ((unint64_t)v19 > v13);
  }

  float v20 = (char *)v22;
  float v22 = 0LL;
  if (v20) {
    sub_AB58((uint64_t)&v22, (uint64_t)v20);
  }
  objc_autoreleasePoolPop(v6);

  return result;
}

- (id)summaryStatisticsEvalResults:(const void *)a3 ofEntries:(id)a4
{
  int v24 = self;
  id v5 = a4;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  int v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v6 = *(unsigned int **)a3;
  id v7 = (unsigned int *)*((void *)a3 + 1);
  if (*(unsigned int **)a3 != v7)
  {
    while (1)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", *v6, v24));
      id v9 = v8;
      unsigned int v10 = v6[36];
      int v27 = 0;
      uint64_t v26 = 0LL;
      if ((v10 & 0x80000000) == 0) {
        break;
      }
LABEL_10:
      unsigned int v11 = [v8 inSessionAlignmentConfidence];
      int v12 = *((unsigned __int8 *)v6 + 220);
      if (v11 == 3)
      {
        for (uint64_t i = 0LL; i != 3; ++i)
        {
          while (1)
          {
            int v14 = *((_DWORD *)&v26 + i);
            *((double *)&v34 + i) = *((double *)&v34 + i) + (double)v14;
            if (!v12) {
              break;
            }
            *((double *)&v30 + i) = *((double *)&v30 + i) + (double)v14;
            if (++i == 3)
            {
              *((double *)&v35 + 1) = *((double *)&v35 + 1) + 1.0;
              int v12 = 1;
              uint64_t v15 = (double *)&v31 + 1;
              goto LABEL_17;
            }
          }
        }

        int v12 = 0;
        uint64_t v15 = (double *)&v35 + 1;
LABEL_17:
        double *v15 = *v15 + 1.0;
      }

      for (uint64_t j = 0LL; j != 3; ++j)
      {
        while (1)
        {
          int v17 = *((_DWORD *)&v26 + j);
          *((double *)&v32 + j) = *((double *)&v32 + j) + (double)v17;
          if (v12) {
            break;
          }
          if (++j == 3) {
            goto LABEL_23;
          }
        }

        *((double *)&v28 + j) = *((double *)&v28 + j) + (double)v17;
      }

      *((double *)&v29 + 1) = *((double *)&v29 + 1) + 1.0;
LABEL_23:
      *((double *)&v33 + 1) = *((double *)&v33 + 1) + 1.0;

      v6 += 58;
      if (v6 == v7) {
        goto LABEL_24;
      }
    }

    if (v10)
    {
      if (v10 > 3)
      {
        if (v10 > 0x27) {
          goto LABEL_10;
        }
        goto LABEL_9;
      }
    }

    else
    {
      LODWORD(v26) = 1;
    }

    HIDWORD(v26) = 1;
LABEL_9:
    int v27 = 1;
    goto LABEL_10;
  }

- (id)getTopStatisticsFromResults:(double)a3[4]
{
  if (a3[3] > 0.0)
  {
    for (uint64_t i = 0LL; i != 3; ++i)
      a3[i] = a3[i] * 100.0 / a3[3];
  }

  v10[0] = @"top1";
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", *a3));
  v11[0] = v5;
  v10[1] = @"top4";
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a3[1]));
  v11[1] = v6;
  v10[2] = @"top40";
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a3[2]));
  v11[2] = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v11,  v10,  3LL));

  return v8;
}

+ (id)stringForConfiderence:(int)a3
{
  else {
    return off_10628[a3 - 1];
  }
}

@end