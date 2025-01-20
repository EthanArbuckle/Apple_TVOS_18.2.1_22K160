@interface SMTTextSequenceInference
- (SMTTextSequenceInference)init;
- (SMTTextSequenceInference)initWithLength:(unint64_t)a3;
- (SMTTextSequenceInference)initWithLength:(unint64_t)a3 BOS:(unint64_t)a4;
- (id)sequence;
- (id)target;
- (void)addWordWithInputId:(unint64_t)a3;
- (void)resetWithBOS:(unint64_t)a3;
@end

@implementation SMTTextSequenceInference

- (SMTTextSequenceInference)init
{
  return 0LL;
}

- (SMTTextSequenceInference)initWithLength:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SMTTextSequenceInference;
  v4 = -[SMTTextSequenceInference init](&v8, "init");
  if (v4)
  {
    v5 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", a3);
    sequence = v4->_sequence;
    v4->_sequence = v5;
  }

  return v4;
}

- (SMTTextSequenceInference)initWithLength:(unint64_t)a3 BOS:(unint64_t)a4
{
  v6 = -[SMTTextSequenceInference initWithLength:](self, "initWithLength:");
  if (v6)
  {
    for (; a3; --a3)
    {
      sequence = v6->_sequence;
      objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLong:", a4));
      -[NSMutableArray addObject:](sequence, "addObject:", v8);
    }

    uint64_t v9 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLong:", a4));
    target = v6->_target;
    v6->_target = (NSNumber *)v9;
  }

  return v6;
}

- (void)resetWithBOS:(unint64_t)a3
{
  if (-[NSMutableArray count](self->_sequence, "count"))
  {
    unint64_t v5 = 0LL;
    do
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLong:", a3));
      -[NSMutableArray setObject:atIndexedSubscript:](self->_sequence, "setObject:atIndexedSubscript:", v6, v5);

      ++v5;
    }

    while (v5 < (unint64_t)-[NSMutableArray count](self->_sequence, "count"));
  }

  v7 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLong:", a3));
  target = self->_target;
  self->_target = v7;
}

- (void)addWordWithInputId:(unint64_t)a3
{
  if (-[NSMutableArray count](self->_sequence, "count"))
  {
    -[NSMutableArray addObject:](self->_sequence, "addObject:", self->_target);
    -[NSMutableArray removeObjectAtIndex:](self->_sequence, "removeObjectAtIndex:", 0LL);
    unint64_t v5 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLong:", a3));
    target = self->_target;
    self->_target = v5;
  }

- (id)sequence
{
  return self->_sequence;
}

- (id)target
{
  return self->_target;
}

- (void).cxx_destruct
{
}

@end