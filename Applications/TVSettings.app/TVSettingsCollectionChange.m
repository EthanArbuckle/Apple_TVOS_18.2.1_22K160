@interface TVSettingsCollectionChange
- (NSIndexSet)destinationIndexes;
- (NSIndexSet)sourceIndexes;
- (TVSettingsCollectionChange)init;
- (TVSettingsCollectionChange)initWithChangeKind:(unint64_t)a3 sourceIndexes:(id)a4 destinationIndexes:(id)a5;
- (id)description;
- (unint64_t)changeKind;
@end

@implementation TVSettingsCollectionChange

- (TVSettingsCollectionChange)initWithChangeKind:(unint64_t)a3 sourceIndexes:(id)a4 destinationIndexes:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___TVSettingsCollectionChange;
  v10 = -[TVSettingsCollectionChange init](&v17, "init");
  v11 = v10;
  if (v10)
  {
    v10->_changeKind = a3;
    v12 = (NSIndexSet *)[v8 copy];
    sourceIndexes = v11->_sourceIndexes;
    v11->_sourceIndexes = v12;

    v14 = (NSIndexSet *)[v9 copy];
    destinationIndexes = v11->_destinationIndexes;
    v11->_destinationIndexes = v14;
  }

  return v11;
}

- (TVSettingsCollectionChange)init
{
  return -[TVSettingsCollectionChange initWithChangeKind:sourceIndexes:destinationIndexes:]( self,  "initWithChangeKind:sourceIndexes:destinationIndexes:",  0LL,  0LL,  0LL);
}

- (id)description
{
  unint64_t v3 = -[TVSettingsCollectionChange changeKind](self, "changeKind");
  if (v3 > 3) {
    uint64_t v4 = 0LL;
  }
  else {
    uint64_t v4 = (uint64_t)*(&off_1001902B0 + v3);
  }
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TVSettingsCollectionChange;
  id v5 = -[TVSettingsCollectionChange description](&v11, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsCollectionChange sourceIndexes](self, "sourceIndexes"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsCollectionChange destinationIndexes](self, "destinationIndexes"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %@; source indexes [%@]; destination indexes [%@]>",
                   v6,
                   v4,
                   v7,
                   v8));

  return v9;
}

- (unint64_t)changeKind
{
  return self->_changeKind;
}

- (NSIndexSet)sourceIndexes
{
  return self->_sourceIndexes;
}

- (NSIndexSet)destinationIndexes
{
  return self->_destinationIndexes;
}

- (void).cxx_destruct
{
}

@end