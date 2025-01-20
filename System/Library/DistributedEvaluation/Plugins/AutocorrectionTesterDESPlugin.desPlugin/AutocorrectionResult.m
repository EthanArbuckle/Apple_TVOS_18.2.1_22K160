@interface AutocorrectionResult
+ (BOOL)supportsSecureCoding;
- (AutocorrectionResult)initWithCoder:(id)a3;
- (NSArray)corrected;
- (NSArray)documentStates;
- (NSArray)inlineCompletions;
- (NSArray)input;
- (NSArray)inserted;
- (NSArray)intended;
- (NSArray)intendedTransliteration;
- (NSArray)predicted;
- (NSArray)tags;
- (NSArray)touchEvents;
- (NSArray)touched;
- (NSDictionary)aggdStatistics;
- (NSDictionary)debugData;
- (NSDictionary)pathsForWords;
- (NSDictionary)sourceMetadata;
- (NSNumber)corpusId;
- (NSNumber)numberOfTouches;
- (NSNumber)rank;
- (NSString)context;
- (NSString)seed;
- (NSURL)typologyLogURL;
- (NSURL)typologyTraceLogURL;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)extractDataFromTypingLog:(id)a3;
- (void)setAggdStatistics:(id)a3;
- (void)setContext:(id)a3;
- (void)setCorpusId:(id)a3;
- (void)setCorrected:(id)a3;
- (void)setDebugData:(id)a3;
- (void)setDocumentStates:(id)a3;
- (void)setInlineCompletions:(id)a3;
- (void)setInput:(id)a3;
- (void)setInserted:(id)a3;
- (void)setIntended:(id)a3;
- (void)setIntendedTransliteration:(id)a3;
- (void)setNumberOfTouches:(id)a3;
- (void)setPathsForWords:(id)a3;
- (void)setPredicted:(id)a3;
- (void)setRank:(id)a3;
- (void)setSeed:(id)a3;
- (void)setSourceMetadata:(id)a3;
- (void)setTags:(id)a3;
- (void)setTagsFromClassifiers:(id)a3;
- (void)setTouchEvents:(id)a3;
- (void)setTouched:(id)a3;
- (void)setTypologyLogURL:(id)a3;
- (void)setTypologyTraceLogURL:(id)a3;
@end

@implementation AutocorrectionResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AutocorrectionResult context](self, "context"));
  [v3 appendFormat:@"context: [%@]\n", v4];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AutocorrectionResult touched](self, "touched"));
  [v3 appendFormat:@"        touched: [%@]\n", v5];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AutocorrectionResult inserted](self, "inserted"));
  [v3 appendFormat:@"       inserted: [%@]\n", v6];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AutocorrectionResult corrected](self, "corrected"));
  [v3 appendFormat:@"      corrected: [%@]\n", v7];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[AutocorrectionResult intended](self, "intended"));
  [v3 appendFormat:@"       expected: [%@]\n", v8];

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[AutocorrectionResult intendedTransliteration](self, "intendedTransliteration"));
  [v3 appendFormat:@" expected trans: [%@]\n", v9];

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[AutocorrectionResult input](self, "input"));
  [v3 appendFormat:@"          input: [%@]\n", v10];

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[AutocorrectionResult numberOfTouches](self, "numberOfTouches"));
  [v3 appendFormat:@"     numTouches: [%@]\n", v11];

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[AutocorrectionResult seed](self, "seed"));
  [v3 appendFormat:@"           seed: %@\n", v12];

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[AutocorrectionResult rank](self, "rank"));
  if ([v13 integerValue] == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    [v3 appendFormat:@"           rank: %@\n", @"NSNotFound"];
  }

  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[AutocorrectionResult rank](self, "rank"));
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 description]);
    [v3 appendFormat:@"           rank: %@\n", v15];
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[AutocorrectionResult aggdStatistics](self, "aggdStatistics"));
  [v3 appendFormat:@" aggdStatistics: %@\n", v16];

  [v3 appendString:@"       failures:"];
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[AutocorrectionResult tags](self, "tags"));
  id v18 = [v17 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v24;
    do
    {
      for (i = 0LL; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v24 != v20) {
          objc_enumerationMutation(v17);
        }
        [v3 appendFormat:@" %@", *(void *)(*((void *)&v23 + 1) + 8 * (void)i)];
      }

      id v19 = [v17 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }

    while (v19);
  }

  [v3 appendString:@"\n"];
  return v3;
}

- (void)setTagsFromClassifiers:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v4 count]));
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        if (objc_msgSend(v11, "doesMatchResult:", self, (void)v15))
        {
          v12 = (objc_class *)objc_opt_class(v11);
          v13 = NSStringFromClass(v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
          [v5 addObject:v14];
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v8);
  }

  -[AutocorrectionResult setTags:](self, "setTags:", v5);
}

- (AutocorrectionResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS___AutocorrectionResult;
  v5 = -[AutocorrectionResult init](&v32, "init");
  if (v5)
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSArray);
    id v7 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v6,  objc_opt_class(&OBJC_CLASS___NSString),  0LL);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    id v9 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"ARContext"];
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    -[AutocorrectionResult setContext:](v5, "setContext:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v8 forKey:@"ARTouched"]);
    -[AutocorrectionResult setTouched:](v5, "setTouched:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v8 forKey:@"ARPredicted"]);
    -[AutocorrectionResult setPredicted:](v5, "setPredicted:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v8 forKey:@"ARInlineCompletions"]);
    -[AutocorrectionResult setInlineCompletions:](v5, "setInlineCompletions:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v8 forKey:@"ARDocumentStates"]);
    -[AutocorrectionResult setDocumentStates:](v5, "setDocumentStates:", v14);

    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v8 forKey:@"ARInserted"]);
    -[AutocorrectionResult setInserted:](v5, "setInserted:", v15);

    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v8 forKey:@"ARCorrected"]);
    -[AutocorrectionResult setCorrected:](v5, "setCorrected:", v16);

    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v8 forKey:@"ARIntended"]);
    -[AutocorrectionResult setIntended:](v5, "setIntended:", v17);

    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v8 forKey:@"ARIntendedTransliteration"]);
    -[AutocorrectionResult setIntendedTransliteration:](v5, "setIntendedTransliteration:", v18);

    id v19 = (void *)objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v8 forKey:@"ARInput"]);
    -[AutocorrectionResult setInput:](v5, "setInput:", v19);

    id v20 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"ARNumberOfTouches"];
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    -[AutocorrectionResult setNumberOfTouches:](v5, "setNumberOfTouches:", v21);

    id v22 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"ARSeed"];
    __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    -[AutocorrectionResult setSeed:](v5, "setSeed:", v23);

    __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v8 forKey:@"ARTags"]);
    -[AutocorrectionResult setTags:](v5, "setTags:", v24);

    id v25 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"ARRank"];
    __int128 v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    -[AutocorrectionResult setRank:](v5, "setRank:", v26);

    -[AutocorrectionResult setAggdStatistics:](v5, "setAggdStatistics:", 0LL);
    id v27 = [v4 decodeObjectOfClass:objc_opt_class(NSData) forKey:@"ARDebug"];
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    uint64_t v31 = 0LL;
    v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v28,  0LL,  &v31));
    if ([v29 count]) {
      -[AutocorrectionResult setDebugData:](v5, "setDebugData:", v29);
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AutocorrectionResult context](self, "context"));
  [v4 encodeObject:v5 forKey:@"ARContext"];

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[AutocorrectionResult touched](self, "touched"));
  [v4 encodeObject:v6 forKey:@"ARTouched"];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[AutocorrectionResult predicted](self, "predicted"));
  [v4 encodeObject:v7 forKey:@"ARPredicted"];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[AutocorrectionResult inlineCompletions](self, "inlineCompletions"));
  [v4 encodeObject:v8 forKey:@"ARInlineCompletions"];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[AutocorrectionResult documentStates](self, "documentStates"));
  [v4 encodeObject:v9 forKey:@"ARDocumentStates"];

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[AutocorrectionResult inserted](self, "inserted"));
  [v4 encodeObject:v10 forKey:@"ARInserted"];

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[AutocorrectionResult corrected](self, "corrected"));
  [v4 encodeObject:v11 forKey:@"ARCorrected"];

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[AutocorrectionResult intended](self, "intended"));
  [v4 encodeObject:v12 forKey:@"ARIntended"];

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[AutocorrectionResult intendedTransliteration](self, "intendedTransliteration"));
  [v4 encodeObject:v13 forKey:@"ARIntendedTransliteration"];

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[AutocorrectionResult input](self, "input"));
  [v4 encodeObject:v14 forKey:@"ARInput"];

  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(-[AutocorrectionResult numberOfTouches](self, "numberOfTouches"));
  [v4 encodeObject:v15 forKey:@"ARNumberOfTouches"];

  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[AutocorrectionResult seed](self, "seed"));
  [v4 encodeObject:v16 forKey:@"ARSeed"];

  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(-[AutocorrectionResult tags](self, "tags"));
  [v4 encodeObject:v17 forKey:@"ARTags"];

  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(-[AutocorrectionResult rank](self, "rank"));
  [v4 encodeObject:v18 forKey:@"ARRank"];

  uint64_t v19 = objc_claimAutoreleasedReturnValue(-[AutocorrectionResult debugData](self, "debugData"));
  id v20 = (void *)v19;
  if (v19) {
    v21 = (void *)v19;
  }
  else {
    v21 = &__NSDictionary0__struct;
  }
  uint64_t v23 = 0LL;
  id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v21,  0LL,  &v23));

  [v4 encodeObject:v22 forKey:@"ARDebug"];
}

- (void)extractDataFromTypingLog:(id)a3
{
  id v4 = a3;
  uint64_t v41 = 0LL;
  v42 = &v41;
  uint64_t v43 = 0x2020000000LL;
  uint64_t v44 = 0LL;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v29 = _NSConcreteStackBlock;
  uint64_t v30 = 3221225472LL;
  uint64_t v31 = sub_9344;
  objc_super v32 = &unk_88D28;
  v40 = &v41;
  id v12 = v5;
  id v33 = v12;
  id v13 = v9;
  id v34 = v13;
  id v14 = v7;
  id v35 = v14;
  id v15 = v8;
  id v36 = v15;
  id v16 = v10;
  id v37 = v16;
  id v17 = v6;
  id v38 = v17;
  id v18 = v11;
  id v39 = v18;
  [v4 enumerateKeystrokesAndPathsForTokensWithBlock:&v29];
  id v19 = objc_msgSend(v12, "copy", v29, v30, v31, v32);
  -[AutocorrectionResult setTouched:](self, "setTouched:", v19);

  id v20 = [v14 copy];
  -[AutocorrectionResult setPredicted:](self, "setPredicted:", v20);

  id v21 = [v15 copy];
  -[AutocorrectionResult setInlineCompletions:](self, "setInlineCompletions:", v21);

  id v22 = [v13 copy];
  -[AutocorrectionResult setInserted:](self, "setInserted:", v22);

  id v23 = [v16 copy];
  -[AutocorrectionResult setDocumentStates:](self, "setDocumentStates:", v23);

  __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v42[3]));
  -[AutocorrectionResult setNumberOfTouches:](self, "setNumberOfTouches:", v24);

  id v25 = (void *)objc_claimAutoreleasedReturnValue([v4 getDebugData]);
  -[AutocorrectionResult setDebugData:](self, "setDebugData:", v25);

  id v26 = [v17 copy];
  -[AutocorrectionResult setTouchEvents:](self, "setTouchEvents:", v26);

  id v27 = [v18 copy];
  -[AutocorrectionResult setPathsForWords:](self, "setPathsForWords:", v27);

  v28 = (void *)objc_claimAutoreleasedReturnValue([v4 intendedTransliterationSequence]);
  if (v28) {
    -[AutocorrectionResult setIntendedTransliteration:](self, "setIntendedTransliteration:", v28);
  }

  _Block_object_dispose(&v41, 8);
}

- (NSString)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (NSDictionary)sourceMetadata
{
  return self->_sourceMetadata;
}

- (void)setSourceMetadata:(id)a3
{
}

- (NSArray)touched
{
  return self->_touched;
}

- (void)setTouched:(id)a3
{
}

- (NSArray)touchEvents
{
  return self->_touchEvents;
}

- (void)setTouchEvents:(id)a3
{
}

- (NSDictionary)pathsForWords
{
  return self->_pathsForWords;
}

- (void)setPathsForWords:(id)a3
{
}

- (NSArray)inserted
{
  return self->_inserted;
}

- (void)setInserted:(id)a3
{
}

- (NSArray)predicted
{
  return self->_predicted;
}

- (void)setPredicted:(id)a3
{
}

- (NSArray)inlineCompletions
{
  return self->_inlineCompletions;
}

- (void)setInlineCompletions:(id)a3
{
}

- (NSArray)corrected
{
  return self->_corrected;
}

- (void)setCorrected:(id)a3
{
}

- (NSArray)intended
{
  return self->_intended;
}

- (void)setIntended:(id)a3
{
}

- (NSArray)intendedTransliteration
{
  return self->_intendedTransliteration;
}

- (void)setIntendedTransliteration:(id)a3
{
}

- (NSArray)input
{
  return self->_input;
}

- (void)setInput:(id)a3
{
}

- (NSArray)documentStates
{
  return self->_documentStates;
}

- (void)setDocumentStates:(id)a3
{
}

- (NSNumber)numberOfTouches
{
  return self->_numberOfTouches;
}

- (void)setNumberOfTouches:(id)a3
{
}

- (NSNumber)corpusId
{
  return self->_corpusId;
}

- (void)setCorpusId:(id)a3
{
}

- (NSURL)typologyLogURL
{
  return self->_typologyLogURL;
}

- (void)setTypologyLogURL:(id)a3
{
}

- (NSURL)typologyTraceLogURL
{
  return self->_typologyTraceLogURL;
}

- (void)setTypologyTraceLogURL:(id)a3
{
}

- (NSString)seed
{
  return self->_seed;
}

- (void)setSeed:(id)a3
{
}

- (NSDictionary)debugData
{
  return self->_debugData;
}

- (void)setDebugData:(id)a3
{
}

- (NSArray)tags
{
  return self->_tags;
}

- (void)setTags:(id)a3
{
}

- (NSNumber)rank
{
  return self->_rank;
}

- (void)setRank:(id)a3
{
}

- (NSDictionary)aggdStatistics
{
  return self->_aggdStatistics;
}

- (void)setAggdStatistics:(id)a3
{
}

- (void).cxx_destruct
{
}

@end