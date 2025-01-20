@interface SMTTextProcessorInference
- (SMTTextProcessorInference)init;
- (SMTTextProcessorInference)initWithLength:(unint64_t)a3 vocab:(id)a4 BOS:(unint64_t)a5;
- (SMTTextProcessorInference)initWithVocab:(id)a3;
- (id)textSequence;
- (void)addText:(id)a3;
- (void)resetWithBOS:(unint64_t)a3;
@end

@implementation SMTTextProcessorInference

- (SMTTextProcessorInference)init
{
  return 0LL;
}

- (SMTTextProcessorInference)initWithVocab:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___SMTTextProcessorInference;
  v6 = -[SMTTextProcessorInference init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_vocab, a3);
    v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    text = v7->_text;
    v7->_text = v8;
  }

  return v7;
}

- (SMTTextProcessorInference)initWithLength:(unint64_t)a3 vocab:(id)a4 BOS:(unint64_t)a5
{
  v7 = -[SMTTextProcessorInference initWithVocab:](self, "initWithVocab:", a4);
  if (v7)
  {
    v8 = -[SMTTextSequenceInference initWithLength:BOS:]( objc_alloc(&OBJC_CLASS___SMTTextSequenceInference),  "initWithLength:BOS:",  a3,  a5);
    -[NSMutableArray addObject:](v7->_text, "addObject:", v8);
  }

  return v7;
}

- (void)resetWithBOS:(unint64_t)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_text, "objectAtIndexedSubscript:", 0LL));
  [v4 resetWithBOS:a3];
}

- (void)addText:(id)a3
{
  unint64_t v4 = -[SMTKaldiVocab indexForWord:](self->_vocab, "indexForWord:", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_text, "objectAtIndexedSubscript:", 0LL));
  [v5 addWordWithInputId:v4];
}

- (id)textSequence
{
  return self->_text;
}

- (void).cxx_destruct
{
}

@end