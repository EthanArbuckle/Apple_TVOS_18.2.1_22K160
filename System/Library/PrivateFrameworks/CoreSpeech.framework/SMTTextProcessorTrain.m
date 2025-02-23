@interface SMTTextProcessorTrain
- (SMTTextProcessorTrain)init;
- (SMTTextProcessorTrain)initWithVocab:(id)a3;
- (id)textSequence;
- (int64_t)numberTokens;
- (unint64_t)numberSamples;
- (void)addText:(id)a3;
- (void)addText:(id)a3 length:(unint64_t)a4;
- (void)addTokenizedText:(id)a3 length:(unint64_t)a4;
- (void)shuffleSamples;
@end

@implementation SMTTextProcessorTrain

- (SMTTextProcessorTrain)init
{
  return 0LL;
}

- (SMTTextProcessorTrain)initWithVocab:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___SMTTextProcessorTrain;
  v6 = -[SMTTextProcessorTrain init](&v10, "init");
  if (v6)
  {
    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    text = v6->_text;
    v6->_text = v7;

    objc_storeStrong((id *)&v6->_vocab, a3);
    v6->_numValidTokens = 0LL;
  }

  return v6;
}

- (void)addText:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceCharacterSet](&OBJC_CLASS___NSCharacterSet, "whitespaceCharacterSet"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 componentsSeparatedByCharactersInSet:v5]);

  v7 = objc_alloc_init(&OBJC_CLASS___SMTTextSequenceTrain);
  unint64_t v8 = -[SMTKaldiVocab endOfSentenceIndex](self->_vocab, "endOfSentenceIndex");
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      v13 = 0LL;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        -[SMTTextSequenceTrain addWordWithInputId:]( v7,  "addWordWithInputId:",  -[SMTKaldiVocab indexForWord:]( self->_vocab,  "indexForWord:",  *(void *)(*((void *)&v14 + 1) + 8LL * (void)v13),  (void)v14));
        ++self->_numValidTokens;
        v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v11);
  }

  -[SMTTextSequenceTrain addWordWithInputId:](v7, "addWordWithInputId:", v8);
  -[NSMutableArray addObject:](self->_text, "addObject:", v7);
}

- (void)addText:(id)a3 length:(unint64_t)a4
{
  id v24 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceCharacterSet](&OBJC_CLASS___NSCharacterSet, "whitespaceCharacterSet"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v24 componentsSeparatedByCharactersInSet:v6]);

  unint64_t v8 = -[SMTKaldiVocab endOfSentenceIndex](self->_vocab, "endOfSentenceIndex");
  unint64_t v9 = -[SMTKaldiVocab beginOfSentenceIndex](self->_vocab, "beginOfSentenceIndex");
  id v10 = [v7 count];
  if (a4 && v10)
  {
    text = self->_text;
    uint64_t v12 = -[SMTTextSequenceTrain initWithLength:](objc_alloc(&OBJC_CLASS___SMTTextSequenceTrain), "initWithLength:", a4);
    -[NSMutableArray addObject:](text, "addObject:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableArray objectAtIndexedSubscript:]( self->_text,  "objectAtIndexedSubscript:",  (char *)-[NSMutableArray count](self->_text, "count") - 1));
    [v13 addWordWithInputId:v9];

    if ([v7 count])
    {
      __int128 v14 = 0LL;
      unint64_t v15 = 1LL;
      do
      {
        vocab = self->_vocab;
        __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndexedSubscript:v14]);
        id v18 = -[SMTKaldiVocab indexForWord:](vocab, "indexForWord:", v17);

        v19 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableArray objectAtIndexedSubscript:]( self->_text,  "objectAtIndexedSubscript:",  (char *)-[NSMutableArray count](self->_text, "count") - 1));
        [v19 addWordWithInputId:v18];

        ++self->_numValidTokens;
        if (++v15 == a4)
        {
          unint64_t v15 = a4;
          if (v14 != (char *)[v7 count] - 1)
          {
            v20 = self->_text;
            v21 = -[SMTTextSequenceTrain initWithLength:]( objc_alloc(&OBJC_CLASS___SMTTextSequenceTrain),  "initWithLength:",  a4);
            -[NSMutableArray addObject:](v20, "addObject:", v21);

            unint64_t v15 = 0LL;
          }
        }

        ++v14;
      }

      while (v14 < [v7 count]);
    }

    else
    {
      unint64_t v15 = 1LL;
    }

    unint64_t v22 = a4 - v15;
    if (a4 > v15)
    {
      do
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableArray objectAtIndexedSubscript:]( self->_text,  "objectAtIndexedSubscript:",  (char *)-[NSMutableArray count](self->_text, "count") - 1));
        [v23 addWordWithInputId:v8];

        --v22;
      }

      while (v22);
    }
  }
}

- (void)addTokenizedText:(id)a3 length:(unint64_t)a4
{
  id v29 = a3;
  id v6 = [v29 count];
  if (a4 && v6)
  {
    unint64_t v7 = -[SMTKaldiVocab endOfSentenceIndex](self->_vocab, "endOfSentenceIndex");
    unint64_t v8 = -[SMTKaldiVocab beginOfSentenceIndex](self->_vocab, "beginOfSentenceIndex");
    text = self->_text;
    id v10 = -[SMTTextSequenceTrain initWithLength:](objc_alloc(&OBJC_CLASS___SMTTextSequenceTrain), "initWithLength:", a4);
    -[NSMutableArray addObject:](text, "addObject:", v10);

    vocab = self->_vocab;
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v29 objectAtIndexedSubscript:0]);
    id v13 = -[SMTKaldiVocab indexForWord:](vocab, "indexForWord:", v12);

    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableArray objectAtIndexedSubscript:]( self->_text,  "objectAtIndexedSubscript:",  (char *)-[NSMutableArray count](self->_text, "count") - 1));
    unint64_t v15 = 1LL;
    [v14 addWordWithInputId:v8 target:v13 mask:1];

    if ([v29 count])
    {
      unint64_t v16 = 1LL;
      unint64_t v15 = 1LL;
      do
      {
        __int128 v17 = self->_vocab;
        id v18 = (void *)objc_claimAutoreleasedReturnValue([v29 objectAtIndexedSubscript:v16 - 1]);
        id v19 = -[SMTKaldiVocab indexForWord:](v17, "indexForWord:", v18);

        id v20 = (id)v7;
        if ((char *)(v16 - 1) < (char *)[v29 count] - 1)
        {
          v21 = self->_vocab;
          unint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v29 objectAtIndexedSubscript:v16]);
          id v20 = -[SMTKaldiVocab indexForWord:](v21, "indexForWord:", v22);
        }

        v23 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableArray objectAtIndexedSubscript:]( self->_text,  "objectAtIndexedSubscript:",  (char *)-[NSMutableArray count](self->_text, "count") - 1));
        [v23 addWordWithInputId:v19 target:v20 mask:1];

        ++self->_numValidTokens;
        if (++v15 == a4)
        {
          unint64_t v15 = a4;
          if ((_BYTE *)(v16 - 1) != (char *)[v29 count] - 1)
          {
            id v24 = self->_text;
            v25 = -[SMTTextSequenceTrain initWithLength:]( objc_alloc(&OBJC_CLASS___SMTTextSequenceTrain),  "initWithLength:",  a4);
            -[NSMutableArray addObject:](v24, "addObject:", v25);

            unint64_t v15 = 0LL;
          }
        }
      }

      while (v16++ < (unint64_t)[v29 count]);
    }

    unint64_t v27 = a4 - v15;
    if (a4 > v15)
    {
      do
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableArray objectAtIndexedSubscript:]( self->_text,  "objectAtIndexedSubscript:",  (char *)-[NSMutableArray count](self->_text, "count") - 1));
        [v28 addWordWithInputId:v7 target:v7 mask:0];

        --v27;
      }

      while (v27);
    }
  }
}

- (void)shuffleSamples
{
  if (-[NSMutableArray count](self->_text, "count"))
  {
    uint64_t v3 = 0LL;
    unint64_t v4 = 0LL;
    do
    {
      -[NSMutableArray exchangeObjectAtIndex:withObjectAtIndex:]( self->_text,  "exchangeObjectAtIndex:withObjectAtIndex:",  v4,  arc4random() % ((unint64_t)-[NSMutableArray count](self->_text, "count") + v3) + v4);
      ++v4;
      --v3;
    }

    while (v4 < (unint64_t)-[NSMutableArray count](self->_text, "count"));
  }

- (id)textSequence
{
  return self->_text;
}

- (unint64_t)numberSamples
{
  return (unint64_t)-[NSMutableArray count](self->_text, "count");
}

- (int64_t)numberTokens
{
  return *self->_numValidTokens;
}

- (void).cxx_destruct
{
}

@end