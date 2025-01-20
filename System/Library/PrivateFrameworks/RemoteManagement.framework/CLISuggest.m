@interface CLISuggest
+ (id)correctionForWord:(id)a3 fromCorpus:(id)a4;
- (CLISuggest)init;
- (CLISuggest)initWithDistanceFunction:(unint64_t)a3;
- (NSSet)corpus;
- (id)correctionForWord:(id)a3;
- (unint64_t)distanceFunction;
- (void)addCorpusWordsFromArray:(id)a3;
@end

@implementation CLISuggest

+ (id)correctionForWord:(id)a3 fromCorpus:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_opt_new(a1);
  [v8 addCorpusWordsFromArray:v6];

  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 correctionForWord:v7]);
  return v9;
}

- (CLISuggest)init
{
  return -[CLISuggest initWithDistanceFunction:](self, "initWithDistanceFunction:", 0LL);
}

- (CLISuggest)initWithDistanceFunction:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CLISuggest;
  v4 = -[CLISuggest init](&v8, "init");
  if (v4)
  {
    v5 = objc_opt_new(&OBJC_CLASS___NSSet);
    corpus = v4->_corpus;
    v4->_corpus = v5;

    v4->_distanceFunction = a3;
  }

  return v4;
}

- (void)addCorpusWordsFromArray:(id)a3
{
  v4 = (NSSet *)objc_claimAutoreleasedReturnValue(-[NSSet setByAddingObjectsFromArray:](self->_corpus, "setByAddingObjectsFromArray:", a3));
  corpus = self->_corpus;
  self->_corpus = v4;
}

- (id)correctionForWord:(id)a3
{
  id v4 = a3;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  v5 = self->_corpus;
  id v6 = -[NSSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v20,  v24,  16LL);
  if (!v6)
  {

    id v8 = 0LL;
LABEL_15:
    v17 = 0LL;
    goto LABEL_16;
  }

  id v7 = v6;
  id v8 = 0LL;
  uint64_t v9 = *(void *)v21;
  uint64_t v10 = 0x7FFFFFFFLL;
  obj = v5;
  do
  {
    for (i = 0LL; i != v7; i = (char *)i + 1)
    {
      if (*(void *)v21 != v9) {
        objc_enumerationMutation(obj);
      }
      v12 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
      unint64_t v13 = sub_10001179C((unint64_t)self, v12, v4);
      int64_t v14 = v13 - [v12 hasPrefix:v4];
      if (v14 >= v10)
      {
        if (v10 != v14) {
          continue;
        }
        id v16 = [v12 length];
        int64_t v14 = v10;
        if (v16 >= [v8 length]) {
          continue;
        }
      }

      id v15 = v12;

      uint64_t v10 = v14;
      id v8 = v15;
    }

    id v7 = -[NSSet countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v20,  v24,  16LL);
  }

  while (v7);

  if (v10 > 2) {
    goto LABEL_15;
  }
  id v8 = v8;
  v17 = v8;
LABEL_16:

  return v17;
}

- (unint64_t)distanceFunction
{
  return self->_distanceFunction;
}

- (NSSet)corpus
{
  return self->_corpus;
}

- (void).cxx_destruct
{
}

@end