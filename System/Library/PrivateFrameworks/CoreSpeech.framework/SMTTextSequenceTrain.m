@interface SMTTextSequenceTrain
- (SMTTextSequenceTrain)init;
- (SMTTextSequenceTrain)initWithLength:(unint64_t)a3;
- (id)mask;
- (id)sequence;
- (id)target;
- (void)addWordWithInputId:(unint64_t)a3;
- (void)addWordWithInputId:(unint64_t)a3 target:(unint64_t)a4 mask:(unint64_t)a5;
@end

@implementation SMTTextSequenceTrain

- (SMTTextSequenceTrain)init
{
  return 0LL;
}

- (SMTTextSequenceTrain)initWithLength:(unint64_t)a3
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___SMTTextSequenceTrain;
  v4 = -[SMTTextSequenceTrain init](&v12, "init");
  if (v4)
  {
    v5 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", a3);
    sequence = v4->_sequence;
    v4->_sequence = v5;

    v7 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", a3);
    target = v4->_target;
    v4->_target = v7;

    v9 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", a3);
    mask = v4->_mask;
    v4->_mask = v9;
  }

  return v4;
}

- (void)addWordWithInputId:(unint64_t)a3
{
  sequence = self->_sequence;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLong:", a3));
  -[NSMutableArray addObject:](sequence, "addObject:", v4);
}

- (void)addWordWithInputId:(unint64_t)a3 target:(unint64_t)a4 mask:(unint64_t)a5
{
  target = self->_target;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLong:", a4));
  -[NSMutableArray addObject:](target, "addObject:", v9);

  mask = self->_mask;
  id v11 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLong:", a5));
  -[NSMutableArray addObject:](mask, "addObject:", v11);
}

- (id)sequence
{
  return self->_sequence;
}

- (id)target
{
  return self->_target;
}

- (id)mask
{
  return self->_mask;
}

- (void).cxx_destruct
{
}

@end