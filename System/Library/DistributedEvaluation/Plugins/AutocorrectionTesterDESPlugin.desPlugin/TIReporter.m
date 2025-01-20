@interface TIReporter
+ (id)fileURLForTrial:(unint64_t)a3 withOptions:(id)a4;
+ (id)languageForOptions:(id)a3;
+ (id)textCorpusForOptions:(id)a3;
- (BOOL)shouldConcatenateTokensAtBoundaryError;
- (NSDictionary)options;
- (NSMutableArray)resultLoggers;
- (NSString)buildVersion;
- (NSString)language;
- (NSString)localeIdentifierForLanguage;
- (NSString)textCorpus;
- (TIReporter)initWithBuildVersion:(id)a3;
- (id)alignedTypingSequenceForResult:(id)a3 keystrokeSegmentationMode:(unint64_t)a4;
- (id)alignedTypingSequenceForTransliteratedResult:(id)a3;
- (id)reportForAutocorrectionResults:(id)a3;
- (id)reportForTrial:(unint64_t)a3;
- (id)resultsForTrial:(unint64_t)a3;
- (void)beginLogTrial;
- (void)collectAggdStatisticsForResult:(id)a3;
- (void)logResult:(id)a3;
- (void)setOptions:(id)a3;
@end

@implementation TIReporter

- (TIReporter)initWithBuildVersion:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TIReporter;
  v6 = -[TIReporter init](&v10, "init");
  if (v6)
  {
    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    resultLoggers = v6->_resultLoggers;
    v6->_resultLoggers = v7;

    objc_storeStrong((id *)&v6->_buildVersion, a3);
  }

  return v6;
}

+ (id)languageForOptions:(id)a3
{
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue([a3 objectForKey:@"KEYBOARD_LANGUAGE"]);
  v4 = v3;
  if (!v3) {
    v3 = &stru_89E80;
  }
  id v5 = v3;

  return v5;
}

- (NSString)language
{
  v3 = (void *)objc_opt_class(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TIReporter options](self, "options"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 languageForOptions:v4]);

  return (NSString *)v5;
}

- (NSString)localeIdentifierForLanguage
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TIReporter language](self, "language"));
  id v3 = [v2 rangeOfString:@"-"];
  if (v3 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v4 = objc_claimAutoreleasedReturnValue([v2 substringToIndex:v3]);

    v2 = (void *)v4;
  }

  if ([v2 hasPrefix:@"zh"])
  {
    id v5 = [v2 rangeOfString:@"_"];
    if (v5 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v7 = objc_claimAutoreleasedReturnValue( objc_msgSend( v2,  "stringByReplacingOccurrencesOfString:withString:options:range:",  @"_",  @"-",  0,  v5,  v6));

      v2 = (void *)v7;
    }
  }

  return (NSString *)v2;
}

+ (id)textCorpusForOptions:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"TEXT"]);
  if (!v4)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"CANDIDATE_SENTENCES"]);
    if (!v4)
    {
      uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"CANDIDATE_PHRASES"]);
      if (!v4)
      {
        id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"TESTCASE"]);
        uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v5 lastPathComponent]);
      }
    }
  }

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 lastPathComponent]);

  id v7 = [v6 rangeOfString:@"." options:4];
  if (v7 && v7 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v6 substringToIndex:v7]);

    uint64_t v6 = (void *)v8;
  }

  return v6;
}

- (NSString)textCorpus
{
  id v3 = (void *)objc_opt_class(self);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[TIReporter options](self, "options"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 textCorpusForOptions:v4]);

  return (NSString *)v5;
}

- (void)beginLogTrial
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TIReporter options](self, "options"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"USE_PARTFILE"]);
  unsigned int v5 = [v4 BOOLValue];

  if (v5)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[TIReporter options](self, "options"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 valueForKey:@"PARTFILE_FLUSH_THRESHOLD"]);

    uint64_t v8 = (void *)objc_opt_class(self);
    id v9 = -[NSMutableArray count](self->_resultLoggers, "count");
    objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(-[TIReporter options](self, "options"));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v8 fileURLForTrial:v9 withOptions:v10]);

    v14 = -[TISerializingResultLogger initWithOutputURL:flushThreshold:]( objc_alloc(&OBJC_CLASS___TISerializingResultLogger),  "initWithOutputURL:flushThreshold:",  v11,  v7);
  }

  else
  {
    v14 = objc_alloc_init(&OBJC_CLASS___TIInMemoryResultLogger);
  }

  -[NSMutableArray addObject:](self->_resultLoggers, "addObject:", v14);
  v12 = __stderrp;
  id v13 = objc_claimAutoreleasedReturnValue(-[TISerializingResultLogger description](v14, "description"));
  fprintf( v12,  "The following result logger will be used for this trial %s\n",  (const char *)[v13 cStringUsingEncoding:4]);
}

- (void)logResult:(id)a3
{
  id v9 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[TIReporter options](self, "options"));
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"REPORT_AGGD_STATISTICS"]);
  unsigned int v6 = [v5 BOOLValue];

  if (v6) {
    -[TIReporter collectAggdStatisticsForResult:](self, "collectAggdStatisticsForResult:", v9);
  }
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TIReporter resultLoggers](self, "resultLoggers"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 lastObject]);

  [v8 addResult:v9];
}

- (void)collectAggdStatisticsForResult:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  id v5 = _TIMockingAggdReporterDictionary();
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v6,  0LL,  0LL));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  v4,  v7,  0LL));
  [v3 setAggdStatistics:v8];

  _TIMockingAggdReporterClear();
}

- (id)resultsForTrial:(unint64_t)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[TIReporter resultLoggers](self, "resultLoggers"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndex:a3]);
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allResults]);

  return v6;
}

- (BOOL)shouldConcatenateTokensAtBoundaryError
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_2FDA4;
  v6[3] = &unk_896A8;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[TIReporter localeIdentifierForLanguage](self, "localeIdentifierForLanguage"));
  id v2 = v7;
  id v3 = (void *)objc_claimAutoreleasedReturnValue([&off_90490 indexesOfObjectsPassingTest:v6]);
  BOOL v4 = [v3 count] == 0;

  return v4;
}

- (id)alignedTypingSequenceForResult:(id)a3 keystrokeSegmentationMode:(unint64_t)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 intended]);
  id v8 = TICharSequenceForTokenSequence(v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue([v6 corrected]);
  id v11 = TICharSequenceForTokenSequence(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[TIReporter language](self, "language"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale localeWithLocaleIdentifier:](&OBJC_CLASS___NSLocale, "localeWithLocaleIdentifier:", v13));

  v129[0] = _NSConcreteStackBlock;
  v129[1] = 3221225472LL;
  v129[2] = sub_3069C;
  v129[3] = &unk_896D0;
  id v15 = v14;
  id v130 = v15;
  v16 = objc_retainBlock(v129);
  id v17 = TIOptimalSequenceAlignment(v9, v12, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  id v19 = (id)objc_claimAutoreleasedReturnValue([v6 intended]);
  v94 = (void *)objc_claimAutoreleasedReturnValue([v6 corrected]);
  id v20 = TITokenAlignmentForKeyAlignment(v18, v9, v12, v19, v94);
  id v99 = v6;
  v100 = (void *)objc_claimAutoreleasedReturnValue(v20);
  id v97 = v15;
  id v98 = v9;
  id v95 = v18;
  id v96 = v16;
  if (a4 == 2)
  {
    v92 = self;
    v93 = v12;
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v125 = 0u;
    __int128 v126 = 0u;
    __int128 v127 = 0u;
    __int128 v128 = 0u;
    v31 = (void *)objc_claimAutoreleasedReturnValue([v6 inserted]);
    id v32 = [v31 countByEnumeratingWithState:&v125 objects:v135 count:16];
    if (v32)
    {
      id v33 = v32;
      uint64_t v34 = *(void *)v126;
      do
      {
        for (i = 0LL; i != v33; i = (char *)i + 1)
        {
          if (*(void *)v126 != v34) {
            objc_enumerationMutation(v31);
          }
          [v30 addObjectsFromArray:*(void *)(*((void *)&v125 + 1) + 8 * (void)i)];
        }

        id v33 = [v31 countByEnumeratingWithState:&v125 objects:v135 count:16];
      }

      while (v33);
    }

    id v36 = TICharSequenceForTokenSequence(v30);
    v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
    id v38 = TIOptimalSequenceAlignment(v9, v37, v16);
    v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
    v89 = &v87;
    id v90 = v37;
    id v91 = v39;
    v108 = &v87 - 2 * (void)[v19 count] - 2;
    TITargetKeyRangesForSourceTokens(v39, v9, v90, v19, v90, (uint64_t)v108);
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v121 = 0u;
    __int128 v122 = 0u;
    __int128 v123 = 0u;
    __int128 v124 = 0u;
    v41 = (void *)objc_claimAutoreleasedReturnValue([v6 touched]);
    id v42 = [v41 countByEnumeratingWithState:&v121 objects:v134 count:16];
    if (v42)
    {
      id v43 = v42;
      uint64_t v44 = *(void *)v122;
      do
      {
        for (j = 0LL; j != v43; j = (char *)j + 1)
        {
          if (*(void *)v122 != v44) {
            objc_enumerationMutation(v41);
          }
          [v40 addObjectsFromArray:*(void *)(*((void *)&v121 + 1) + 8 * (void)j)];
        }

        id v43 = [v41 countByEnumeratingWithState:&v121 objects:v134 count:16];
      }

      while (v43);
    }

    v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v117 = 0u;
    __int128 v118 = 0u;
    __int128 v119 = 0u;
    __int128 v120 = 0u;
    v47 = (void *)objc_claimAutoreleasedReturnValue([v6 predicted]);
    id v48 = [v47 countByEnumeratingWithState:&v117 objects:v133 count:16];
    if (v48)
    {
      id v49 = v48;
      uint64_t v50 = *(void *)v118;
      do
      {
        for (k = 0LL; k != v49; k = (char *)k + 1)
        {
          if (*(void *)v118 != v50) {
            objc_enumerationMutation(v47);
          }
          [v46 addObjectsFromArray:*(void *)(*((void *)&v117 + 1) + 8 * (void)k)];
        }

        id v49 = [v47 countByEnumeratingWithState:&v117 objects:v133 count:16];
      }

      while (v49);
    }

    id v101 = v19;

    v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v113 = 0u;
    __int128 v114 = 0u;
    __int128 v115 = 0u;
    __int128 v116 = 0u;
    v53 = (void *)objc_claimAutoreleasedReturnValue([v6 inlineCompletions]);
    id v54 = [v53 countByEnumeratingWithState:&v113 objects:v132 count:16];
    if (v54)
    {
      id v55 = v54;
      uint64_t v56 = *(void *)v114;
      do
      {
        for (m = 0LL; m != v55; m = (char *)m + 1)
        {
          if (*(void *)v114 != v56) {
            objc_enumerationMutation(v53);
          }
          [v52 addObjectsFromArray:*(void *)(*((void *)&v113 + 1) + 8 * (void)m)];
        }

        id v55 = [v53 countByEnumeratingWithState:&v113 objects:v132 count:16];
      }

      while (v55);
    }

    v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v109 = 0u;
    __int128 v110 = 0u;
    __int128 v111 = 0u;
    __int128 v112 = 0u;
    v59 = (void *)objc_claimAutoreleasedReturnValue([v99 documentStates]);
    id v60 = [v59 countByEnumeratingWithState:&v109 objects:v131 count:16];
    if (v60)
    {
      id v61 = v60;
      uint64_t v62 = *(void *)v110;
      do
      {
        for (n = 0LL; n != v61; n = (char *)n + 1)
        {
          if (*(void *)v110 != v62) {
            objc_enumerationMutation(v59);
          }
          [v58 addObjectsFromArray:*(void *)(*((void *)&v109 + 1) + 8 * (void)n)];
        }

        id v61 = [v59 countByEnumeratingWithState:&v109 objects:v131 count:16];
      }

      while (v61);
    }

    id v107 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    id v106 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    id v105 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    id v104 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    id v103 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    id v19 = v101;
    if ([v101 count])
    {
      unint64_t v64 = 0LL;
      v65 = (uint64_t **)(v108 + 1);
      do
      {
        uint64_t v66 = (uint64_t)*(v65 - 1);
        if (v66 == 0x7FFFFFFFFFFFFFFFLL)
        {
          [v107 addObject:&__NSArray0__struct];
          [v106 addObject:&__NSArray0__struct];
          [v105 addObject:&__NSArray0__struct];
          [v103 addObject:&__NSArray0__struct];
          [v104 addObject:&__NSArray0__struct];
        }

        else
        {
          v108 = *v65;
          v67 = (void *)objc_claimAutoreleasedReturnValue([v30 subarrayWithRange:v66]);
          [v107 addObject:v67];

          v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "subarrayWithRange:", v66, v108));
          [v106 addObject:v68];

          id v102 = (id)v64;
          v69 = v108;
          v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "subarrayWithRange:", v66, v108));
          [v105 addObject:v70];

          v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "subarrayWithRange:", v66, v69));
          [v104 addObject:v71];

          v72 = v69;
          id v19 = v101;
          unint64_t v64 = (unint64_t)v102;
          v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "subarrayWithRange:", v66, v72));
          [v103 addObject:v73];
        }

        ++v64;
        v65 += 2;
      }

      while (v64 < (unint64_t)[v19 count]);
    }

    v108 = (uint64_t *)[v107 copy];
    id v102 = [v106 copy];
    id v101 = [v105 copy];
    id v74 = v104;
    id v88 = [v104 copy];
    id v75 = v103;
    id v29 = [v103 copy];

    v76 = v90;
    v21 = v108;

    v26 = v88;
    id v27 = v101;
    v28 = v102;
    self = v92;
    v12 = v93;
  }

  else if (a4 == 1)
  {
    v21 = (uint64_t *)objc_claimAutoreleasedReturnValue([v6 inserted]);
    uint64_t v22 = objc_claimAutoreleasedReturnValue([v6 touched]);
    uint64_t v23 = objc_claimAutoreleasedReturnValue([v6 predicted]);
    uint64_t v24 = objc_claimAutoreleasedReturnValue([v6 inlineCompletions]);
    uint64_t v25 = objc_claimAutoreleasedReturnValue([v6 documentStates]);
    v26 = (void *)v24;
    id v27 = (id)v23;
    v28 = (void *)v22;
    id v29 = (id)v25;
  }

  else
  {
    id v29 = &__NSArray0__struct;
    v26 = &__NSArray0__struct;
    id v27 = &__NSArray0__struct;
    v28 = &__NSArray0__struct;
    v21 = (uint64_t *)&__NSArray0__struct;
  }

  v77 = v21;
  v78 = v28;
  v79 = v27;
  v80 = v26;
  id v81 = TIAlignedTypingSequenceForAlignedTokenSequence(v100, v21, v28, v27, v26, v29);
  v82 = (void *)objc_claimAutoreleasedReturnValue(v81);
  if (v82 && -[TIReporter shouldConcatenateTokensAtBoundaryError](self, "shouldConcatenateTokensAtBoundaryError"))
  {
    id v83 = TIConcatenateAlignedTypingAtBoundaryErrors(v82);
    id v84 = v19;
    uint64_t v85 = objc_claimAutoreleasedReturnValue(v83);

    v82 = (void *)v85;
    id v19 = v84;
  }

  return v82;
}

- (id)alignedTypingSequenceForTransliteratedResult:(id)a3
{
  id v3 = a3;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 intended]);
  id v6 = [v5 count];

  if (v6)
  {
    unint64_t v7 = 0LL;
    do
    {
      id v8 = objc_alloc_init(&OBJC_CLASS___TIAlignedTyping);
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v3 intendedTransliteration]);
      objc_super v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndex:v7]);
      -[TIAlignedTokens setSource:](v8, "setSource:", v10);

      id v11 = (void *)objc_claimAutoreleasedReturnValue([v3 intended]);
      v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndex:v7]);
      -[TIAlignedTokens setSourceTransliteration:](v8, "setSourceTransliteration:", v12);

      id v13 = (void *)objc_claimAutoreleasedReturnValue([v3 touched]);
      v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectAtIndex:v7]);
      -[TIAlignedTyping setTouched:](v8, "setTouched:", v14);

      id v15 = (void *)objc_claimAutoreleasedReturnValue([v3 inserted]);
      v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectAtIndex:v7]);
      -[TIAlignedTyping setInserted:](v8, "setInserted:", v16);

      id v17 = (void *)objc_claimAutoreleasedReturnValue([v3 corrected]);
      v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectAtIndex:v7]);
      -[TIAlignedTokens setTarget:](v8, "setTarget:", v18);

      id v19 = (void *)objc_claimAutoreleasedReturnValue([v3 predicted]);
      id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 objectAtIndex:v7]);
      -[TIAlignedTyping setPredicted:](v8, "setPredicted:", v20);

      v21 = (void *)objc_claimAutoreleasedReturnValue([v3 inlineCompletions]);
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v21 objectAtIndex:v7]);
      -[TIAlignedTyping setInlineCompletions:](v8, "setInlineCompletions:", v22);

      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v7));
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v3 pathsForWords]);
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v24 objectForKey:v23]);

      if (v25)
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue([v3 pathsForWords]);
        id v27 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:v23]);

        -[TIAlignedTyping setPath:](v8, "setPath:", v27);
      }

      [v4 addObject:v8];

      ++v7;
      v28 = (void *)objc_claimAutoreleasedReturnValue([v3 intended]);
      id v29 = [v28 count];
    }

    while (v7 < (unint64_t)v29);
  }

  return v4;
}

- (id)reportForTrial:(unint64_t)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TIReporter resultLoggers](self, "resultLoggers"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndex:a3]);

  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allResults]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TIReporter reportForAutocorrectionResults:](self, "reportForAutocorrectionResults:", v7));
  v12 = @"TrialIndex";
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  id v13 = v9;
  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v13,  &v12,  1LL));
  [v8 addEntriesFromDictionary:v10];

  return v8;
}

- (id)reportForAutocorrectionResults:(id)a3
{
  id v205 = a3;
  v197 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v256 = objc_opt_new(&OBJC_CLASS___NSCountedSet);
  v203 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[TIReporter options](self, "options"));
  id v5 = (__CFString *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"MAX_PREDICTIONS_REPORTED"]);
  id v6 = v5;
  if (!v5) {
    id v5 = @"0";
  }
  signed int v202 = -[__CFString intValue](v5, "intValue");

  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[TIReporter options](self, "options"));
  id v8 = (__CFString *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"MAX_INLINE_COMPLETIONS_REPORTED"]);
  id v9 = v8;
  if (!v8) {
    id v8 = @"0";
  }
  signed int v201 = -[__CFString intValue](v8, "intValue");

  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(-[TIReporter options](self, "options"));
  id v11 = (__CFString *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"REPORT_AGGD_STATISTICS"]);
  v12 = v11;
  if (!v11) {
    id v11 = @"0";
  }
  unsigned int v200 = -[__CFString BOOLValue](v11, "BOOLValue");

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[TIReporter options](self, "options"));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:@"LOG_DOCUMENT_CONTEXT"]);
  id v15 = v14;
  if (!v14) {
    v14 = &__kCFBooleanFalse;
  }
  char v199 = [v14 BOOLValue];

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[TIReporter options](self, "options"));
  id v17 = (__CFString *)objc_claimAutoreleasedReturnValue([v16 objectForKey:@"PREFERS_TRANSLITERATION"]);
  v18 = v17;
  if (!v17) {
    id v17 = @"0";
  }
  self->_isTransliterating = -[__CFString BOOLValue](v17, "BOOLValue");

  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[TIReporter options](self, "options"));
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKey:@"KEYSTROKE_SEGMENTATION_MODE"]);

  if (v20)
  {
    v21 = self;
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[TIReporter options](self, "options"));
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKey:@"KEYSTROKE_SEGMENTATION_MODE"]);

    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v23 lowercaseString]);
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceCharacterSet](&OBJC_CLASS___NSCharacterSet, "whitespaceCharacterSet"));
    v26 = (void *)objc_claimAutoreleasedReturnValue([v24 stringByTrimmingCharactersInSet:v25]);

    if ([v26 isEqualToString:@"none"])
    {
      uint64_t v198 = 0LL;
    }

    else
    {
      if ([v26 isEqualToString:@"typinglog"])
      {
        uint64_t v27 = 1LL;
      }

      else
      {
        unsigned int v28 = [v26 isEqualToString:@"alignment"];
        uint64_t v27 = 1LL;
        if (v28) {
          uint64_t v27 = 2LL;
        }
      }

      uint64_t v198 = v27;
    }

    self = v21;
  }

  else
  {
    uint64_t v198 = 1LL;
  }

  id v29 = (char *)[v205 count];
  v30 = v29;
  if (!v29)
  {
    fputc(10, __stderrp);
    uint64_t v218 = 0LL;
    uint64_t v219 = 0LL;
    uint64_t v217 = 0LL;
    uint64_t v31 = 0LL;
    uint64_t v162 = 0LL;
    uint64_t v163 = 0LL;
    v164 = 0LL;
    uint64_t v247 = 0LL;
    uint64_t v242 = 0LL;
    uint64_t v165 = 0LL;
    float v166 = 1.0;
    float v167 = 0.0;
    float v159 = 1.0;
    float v161 = 0.0;
    float v168 = 0.0;
    float v169 = 0.0;
    goto LABEL_154;
  }

  v233 = 0LL;
  uint64_t v261 = 0LL;
  uint64_t v266 = 0LL;
  uint64_t v242 = 0LL;
  uint64_t v247 = 0LL;
  uint64_t v230 = 0LL;
  uint64_t v231 = 0LL;
  uint64_t v31 = 0LL;
  uint64_t v217 = 0LL;
  uint64_t v218 = 0LL;
  uint64_t v219 = 0LL;
  id v32 = 0LL;
  v204 = v29;
  do
  {
    context = objc_autoreleasePoolPush();
    v229 = v32 + 1;
    fprintf(__stderrp, "Processing result %lu/%lu\r", v32 + 1, v30);
    id v33 = (void *)objc_claimAutoreleasedReturnValue([v205 objectAtIndexedSubscript:v32]);
    v236 = (void *)objc_claimAutoreleasedReturnValue([v33 intendedTransliteration]);

    uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v33 numberOfTouches]);
    id v227 = [v34 integerValue];

    v35 = (void *)objc_claimAutoreleasedReturnValue(-[TIReporter localeIdentifierForLanguage](self, "localeIdentifierForLanguage"));
    if ([v35 isEqualToString:@"ko_KR"])
    {
      id v36 = (void *)objc_claimAutoreleasedReturnValue([v33 intended]);
      id v37 = (id)objc_claimAutoreleasedReturnValue([v36 componentsJoinedByString:&stru_89E80]);
      id v38 = (id)objc_claimAutoreleasedReturnValue( +[TITesterUtils decomposeHangulSequence:]( &OBJC_CLASS___TITesterUtils,  "decomposeHangulSequence:",  v37));
    }

    else
    {
      id v36 = (void *)objc_claimAutoreleasedReturnValue([v33 intended]);
      id v37 = (id)objc_claimAutoreleasedReturnValue([v36 componentsJoinedByString:&stru_89E80]);
      id v38 = v37;
    }

    id v232 = v38;
    id v226 = [v38 length];
    v240 = (void *)objc_claimAutoreleasedReturnValue(+[NSString string](&OBJC_CLASS___NSString, "string"));
    __int128 v307 = 0u;
    __int128 v308 = 0u;
    __int128 v309 = 0u;
    __int128 v310 = 0u;
    v234 = v33;
    v39 = (void *)objc_claimAutoreleasedReturnValue([v33 inserted]);
    id v40 = [v39 countByEnumeratingWithState:&v307 objects:v322 count:16];
    if (v40)
    {
      id v41 = v40;
      uint64_t v42 = *(void *)v308;
      do
      {
        id v43 = 0LL;
        uint64_t v44 = v240;
        do
        {
          if (*(void *)v308 != v42) {
            objc_enumerationMutation(v39);
          }
          v45 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*((void *)&v307 + 1) + 8 * (void)v43) componentsJoinedByString:&stru_89E80]);
          uint64_t v46 = objc_claimAutoreleasedReturnValue([v44 stringByAppendingString:v45]);

          id v43 = (char *)v43 + 1;
          uint64_t v44 = (void *)v46;
        }

        while (v41 != v43);
        v240 = (void *)v46;
        id v41 = [v39 countByEnumeratingWithState:&v307 objects:v322 count:16];
      }

      while (v41);
    }

    v47 = (void *)objc_claimAutoreleasedReturnValue([v240 stringByReplacingOccurrencesOfString:@"\\b" withString:@"\b"]);
    id v48 = (void *)objc_claimAutoreleasedReturnValue([v47 stringByReplacingOccurrencesOfString:@"\\B" withString:@"\b"]);
    id v225 = [v48 length];

    id v49 = (void *)objc_claimAutoreleasedReturnValue([v234 intended]);
    __int128 v303 = 0u;
    __int128 v304 = 0u;
    __int128 v305 = 0u;
    __int128 v306 = 0u;
    id obj = v49;
    id v50 = [obj countByEnumeratingWithState:&v303 objects:v321 count:16];
    if (!v50)
    {
      uint64_t v268 = 0LL;
      uint64_t v263 = 0LL;
      v52 = &CFAbsoluteTimeGetCurrent_ptr;
      goto LABEL_47;
    }

    id v51 = v50;
    uint64_t v263 = 0LL;
    uint64_t v268 = 0LL;
    id v271 = *(id *)v304;
    v52 = &CFAbsoluteTimeGetCurrent_ptr;
    do
    {
      for (i = 0LL; i != v51; i = (char *)i + 1)
      {
        if (*(id *)v304 != v271) {
          objc_enumerationMutation(obj);
        }
        id v54 = *(void **)(*((void *)&v303 + 1) + 8LL * (void)i);
        id v55 = (void *)objc_claimAutoreleasedReturnValue([v52[43] whitespaceAndNewlineCharacterSet]);
        uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue([v54 stringByTrimmingCharactersInSet:v55]);
        if ([v56 length])
        {
          v57 = (void *)objc_claimAutoreleasedReturnValue([v52[43] punctuationCharacterSet]);
          v58 = (void *)objc_claimAutoreleasedReturnValue([v54 stringByTrimmingCharactersInSet:v57]);
          id v59 = [v58 length];

          if (v59)
          {
            ++v261;
            ++v263;
            goto LABEL_43;
          }
        }

        else
        {
        }

        v266 += (uint64_t)[v54 length];
        v268 += (uint64_t)[v54 length];
LABEL_43:
        v52 = &CFAbsoluteTimeGetCurrent_ptr;
      }

      id v51 = [obj countByEnumeratingWithState:&v303 objects:v321 count:16];
    }

    while (v51);
LABEL_47:

    if (v236) {
      id v60 = (void *)objc_claimAutoreleasedReturnValue( -[TIReporter alignedTypingSequenceForTransliteratedResult:]( self,  "alignedTypingSequenceForTransliteratedResult:",  v234));
    }
    else {
      id v60 = (void *)objc_claimAutoreleasedReturnValue( -[TIReporter alignedTypingSequenceForResult:keystrokeSegmentationMode:]( self,  "alignedTypingSequenceForResult:keystrokeSegmentationMode:",  v234,  v198));
    }
    uint64_t v62 = v232;
    id v61 = v233;
    id v63 = v60;

    if (!v63) {
      goto LABEL_134;
    }
    __int128 v301 = 0u;
    __int128 v302 = 0u;
    __int128 v299 = 0u;
    __int128 v300 = 0u;
    id v216 = v63;
    id v251 = v63;
    id v64 = [v251 countByEnumeratingWithState:&v299 objects:v320 count:16];
    if (!v64)
    {
      uint64_t v244 = 0LL;
      uint64_t v248 = 0LL;
      goto LABEL_68;
    }

    id v65 = v64;
    uint64_t v244 = 0LL;
    uint64_t v248 = 0LL;
    uint64_t v66 = *(void *)v300;
    uint64_t v258 = *(void *)v300;
    while (2)
    {
      uint64_t v67 = 0LL;
      id v272 = v65;
      while (2)
      {
        if (*(void *)v300 != v66) {
          objc_enumerationMutation(v251);
        }
        v68 = *(void **)(*((void *)&v299 + 1) + 8 * v67);
        v69 = (void *)objc_claimAutoreleasedReturnValue([v68 source]);
        v70 = (void *)objc_claimAutoreleasedReturnValue([v68 target]);
        if ([v69 length] && objc_msgSend(v70, "isEqualToString:", v69))
        {
          v71 = (void *)objc_claimAutoreleasedReturnValue([v52[43] whitespaceAndNewlineCharacterSet]);
          v72 = (void *)objc_claimAutoreleasedReturnValue([v69 stringByTrimmingCharactersInSet:v71]);
          if ([v72 length])
          {
            v73 = (void *)objc_claimAutoreleasedReturnValue([v52[43] punctuationCharacterSet]);
            id v74 = (void *)objc_claimAutoreleasedReturnValue([v69 stringByTrimmingCharactersInSet:v73]);
            id v75 = [v74 length];

            v52 = &CFAbsoluteTimeGetCurrent_ptr;
            if (v75)
            {
              ++v242;
              ++v244;
              goto LABEL_63;
            }
          }

          else
          {
          }

          v247 += (uint64_t)[v69 length];
          v248 += (uint64_t)[v69 length];
LABEL_63:
          uint64_t v66 = v258;
          id v65 = v272;
        }

        if (v65 != (id)++v67) {
          continue;
        }
        break;
      }

      id v65 = [v251 countByEnumeratingWithState:&v299 objects:v320 count:16];
      if (v65) {
        continue;
      }
      break;
    }

+ (id)fileURLForTrial:(unint64_t)a3 withOptions:(id)a4
{
  id v6 = a4;
  id v7 = [(id)objc_opt_class(a1) languageForOptions:v6];
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = [(id)objc_opt_class(a1) textCorpusForOptions:v6];
  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  id v11 = (__CFString *)objc_claimAutoreleasedReturnValue([v6 valueForKey:@"OUTPATH"]);

  v12 = @"./";
  if (v11) {
    v12 = v11;
  }
  id v13 = v12;

  v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"test-typer-%@-%@-trial%03lu.json",  v8,  v10,  a3));
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingPathComponent:](v13, "stringByAppendingPathComponent:", v14));

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v15));
  return v16;
}

- (NSMutableArray)resultLoggers
{
  return self->_resultLoggers;
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (void).cxx_destruct
{
}

@end