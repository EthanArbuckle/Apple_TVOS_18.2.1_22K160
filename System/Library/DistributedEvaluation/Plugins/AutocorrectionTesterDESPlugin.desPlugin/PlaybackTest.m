@interface PlaybackTest
+ (id)loadFromPlaybackFile:(id)a3;
+ (id)loadFromSentence:(id)a3 withCatenation:(BOOL)a4;
+ (id)loadFromTextInputFile:(id)a3 withCatenation:(BOOL)a4 addWordSpacing:(BOOL)a5;
+ (id)sentenceToTransliteratedPlaybackTest:(id)a3 withCatenation:(BOOL)a4 addWordSpacing:(BOOL)a5;
+ (id)testsWithIntendedOutput:(id)a3 expectedOutput:(id)a4;
+ (id)testsWithIntendedOutput:(id)a3 expectedOutput:(id)a4 corpusId:(id)a5;
- (id)expected;
- (id)intended;
@end

@implementation PlaybackTest

+ (id)testsWithIntendedOutput:(id)a3 expectedOutput:(id)a4 corpusId:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = objc_alloc_init(&OBJC_CLASS___PlaybackTest);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_intended, a3);
    objc_storeStrong((id *)&v10->_expected, a4);
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v7 componentsJoinedByString:&stru_89E80]);
    input = v10->super._input;
    v10->super._input = (NSString *)v11;
  }

  return v10;
}

+ (id)testsWithIntendedOutput:(id)a3 expectedOutput:(id)a4
{
  return _[a1 testsWithIntendedOutput:a3 expectedOutput:a4 corpusId:0];
}

+ (id)loadFromPlaybackFile:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[TTKTestCaseReader loadFromPath:](&OBJC_CLASS___TTKTestCaseReader, "loadFromPath:", v3));
  if (v4)
  {
    id v24 = v3;
    id v27 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    v23 = v4;
    id obj = v4;
    id v5 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v26 = *(void *)v33;
      do
      {
        for (i = 0LL; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v33 != v26) {
            objc_enumerationMutation(obj);
          }
          id v8 = *(void **)(*((void *)&v32 + 1) + 8LL * (void)i);
          v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
          v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
          __int128 v28 = 0u;
          __int128 v29 = 0u;
          __int128 v30 = 0u;
          __int128 v31 = 0u;
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 records]);
          id v12 = [v11 countByEnumeratingWithState:&v28 objects:v36 count:16];
          if (v12)
          {
            id v13 = v12;
            uint64_t v14 = *(void *)v29;
            do
            {
              for (j = 0LL; j != v13; j = (char *)j + 1)
              {
                if (*(void *)v29 != v14) {
                  objc_enumerationMutation(v11);
                }
                v16 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)j);
                v17 = (void *)objc_claimAutoreleasedReturnValue([v16 inputText]);
                [v9 addObject:v17];

                v18 = (void *)objc_claimAutoreleasedReturnValue([v16 primaryIntendedText]);
                [v10 addObject:v18];
              }

              id v13 = [v11 countByEnumeratingWithState:&v28 objects:v36 count:16];
            }

            while (v13);
          }

          id v19 = [v9 copy];
          id v20 = [v10 copy];
          v21 = (void *)objc_claimAutoreleasedReturnValue( +[PlaybackTest testsWithIntendedOutput:expectedOutput:]( &OBJC_CLASS___PlaybackTest,  "testsWithIntendedOutput:expectedOutput:",  v19,  v20));

          [v27 addObject:v21];
        }

        id v6 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
      }

      while (v6);
    }

    v4 = v23;
    id v3 = v24;
  }

  else
  {
    NSLog(@"Input path for playback not found: %@", v3);
    id v27 = 0LL;
  }

  return v27;
}

+ (id)sentenceToTransliteratedPlaybackTest:(id)a3 withCatenation:(BOOL)a4 addWordSpacing:(BOOL)a5
{
  BOOL v5 = a5;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 componentsSeparatedByString:@"|"]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndex:1]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndex:0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v8 componentsSeparatedByString:@" "]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:", v10));

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 componentsSeparatedByString:@" "]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:", v12));

  [v11 removeObjectsInArray:&off_904A8];
  [v13 removeObjectsInArray:&off_904C0];
  if (v5)
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v11 arrayInterspersingSpaceStringsBetweenObjects]);
    id v15 = [v14 mutableCopy];

    v16 = (void *)objc_claimAutoreleasedReturnValue([v13 arrayInterspersingSpaceStringsBetweenObjects]);
    id v17 = [v16 mutableCopy];

    id v13 = v17;
    uint64_t v11 = v15;
  }

  id v18 = [v13 count];
  if (v18 == [v11 count])
  {
    v60 = v9;
    v55 = v8;
    v56 = v7;
    id v57 = v6;
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndex:0]);
    uint64_t v20 = objc_claimAutoreleasedReturnValue([v13 objectAtIndex:0]);
    if ((unint64_t)[v11 count] >= 2 && objc_msgSend(v19, "length") == (char *)&dword_0 + 1)
    {
      if ([v19 caseInsensitiveCompare:v20])
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndex:1]);
        v22 = (void *)objc_claimAutoreleasedReturnValue([v13 objectAtIndex:1]);
        id v23 = [v21 caseInsensitiveCompare:v22];

        if (v23)
        {
          id v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](&OBJC_CLASS___NSMutableString, "stringWithString:", v19));
          v25 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndex:1]);
          [v24 appendString:v25];

          uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](&OBJC_CLASS___NSMutableString, "stringWithString:", v20));
          id v27 = (void *)objc_claimAutoreleasedReturnValue([v13 objectAtIndex:1]);
          [v26 appendString:v27];

          [v11 replaceObjectAtIndex:0 withObject:v24];
          [v11 removeObjectAtIndex:1];
          [v13 replaceObjectAtIndex:0 withObject:v26];
          [v13 removeObjectAtIndex:1];
        }
      }
    }

    v58 = (void *)v20;
    v59 = v19;
    if ([v11 count])
    {
      unint64_t v28 = 0LL;
      __int128 v29 = &CFAbsoluteTimeGetCurrent_ptr;
      do
      {
        __int128 v30 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndex:v28]);
        __int128 v31 = (void *)objc_claimAutoreleasedReturnValue([v13 objectAtIndex:v28]);
        __int128 v32 = (char *)[v30 length] - 1;
        __int128 v33 = (char *)[v31 length];
        if ((uint64_t)v32 >= 1)
        {
          __int128 v34 = v33;
          __int128 v35 = (void *)objc_claimAutoreleasedReturnValue([v29[43] punctuationCharacterSet]);
          if (objc_msgSend(v35, "characterIsMember:", objc_msgSend(v30, "characterAtIndex:", v32)))
          {
            v36 = v34 - 1;
            v37 = (void *)objc_claimAutoreleasedReturnValue([v29[43] punctuationCharacterSet]);
            unsigned int v38 = objc_msgSend(v37, "characterIsMember:", objc_msgSend(v31, "characterAtIndex:", v36));

            if (!v38)
            {
              __int128 v29 = &CFAbsoluteTimeGetCurrent_ptr;
              goto LABEL_17;
            }

            __int128 v35 = (void *)objc_claimAutoreleasedReturnValue([v30 substringToIndex:v32]);
            v39 = (void *)objc_claimAutoreleasedReturnValue([v30 substringFromIndex:v32]);
            v40 = (void *)objc_claimAutoreleasedReturnValue([v31 substringToIndex:v36]);
            v41 = (void *)objc_claimAutoreleasedReturnValue([v31 substringFromIndex:v36]);
            [v11 replaceObjectAtIndex:v28 withObject:v39];
            [v11 insertObject:v35 atIndex:v28];
            [v13 replaceObjectAtIndex:v28 withObject:v41];
            [v13 insertObject:v40 atIndex:v28++];

            __int128 v29 = &CFAbsoluteTimeGetCurrent_ptr;
          }
        }

+ (id)loadFromSentence:(id)a3 withCatenation:(BOOL)a4
{
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[PlaybackTest sentenceToTransliteratedPlaybackTest:withCatenation:addWordSpacing:]( &OBJC_CLASS___PlaybackTest,  "sentenceToTransliteratedPlaybackTest:withCatenation:addWordSpacing:",  a3,  a4,  0LL));
  if (v4) {
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", v4));
  }
  else {
    BOOL v5 = 0LL;
  }

  return v5;
}

+ (id)loadFromTextInputFile:(id)a3 withCatenation:(BOOL)a4 addWordSpacing:(BOOL)a5
{
  id v15 = 0LL;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithContentsOfFile:encoding:error:]( &OBJC_CLASS___NSString,  "stringWithContentsOfFile:encoding:error:",  a3,  4LL,  &v15));
  id v8 = v15;
  if (v7)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_3D124;
    v11[3] = &unk_89770;
    BOOL v13 = a4;
    BOOL v14 = a5;
    id v9 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    id v12 = v9;
    [v7 enumerateLinesUsingBlock:v11];
  }

  else
  {
    id v9 = 0LL;
  }

  return v9;
}

- (id)intended
{
  return self->_intended;
}

- (id)expected
{
  return self->_expected;
}

- (void).cxx_destruct
{
}

@end