@interface ADSynchronizedIdItemPair
- (ADSynchronizedIdItem)current;
- (ADSynchronizedIdItem)next;
- (ADSynchronizedIdItemPair)initWithCurrent:(id)a3 andNext:(id)a4;
- (ADSynchronizedIdItemPair)initWithRemote:(id)a3;
- (BOOL)setCurrentIfNil:(id)a3 andCreationTime:(id)a4 andValidityDays:(unsigned int)a5;
- (id)adoptRemoteIfEarly:(id)a3;
- (id)description;
- (id)selectEarliest:(id)a3;
- (unint64_t)_populateNullsWithCreationTime:(id)a3 today:(id)a4 minValidityDays:(unsigned int)a5 maxValidityDays:(unsigned int)a6 currentOption:(unint64_t)a7 nextOption:(unint64_t)a8;
@end

@implementation ADSynchronizedIdItemPair

- (ADSynchronizedIdItemPair)initWithCurrent:(id)a3 andNext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___ADSynchronizedIdItemPair;
  v9 = -[ADSynchronizedIdItemPair init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_current, a3);
    objc_storeStrong((id *)&v10->_next, a4);
  }

  return v10;
}

- (ADSynchronizedIdItemPair)initWithRemote:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___ADSynchronizedIdItemPair;
  v5 = -[ADSynchronizedIdItemPair init](&v17, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 current]);

    if (v6)
    {
      id v7 = objc_alloc(&OBJC_CLASS___ADSynchronizedIdItem);
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 current]);
      v9 = -[ADSynchronizedIdItem initAndAdopt:](v7, "initAndAdopt:", v8);
      current = v5->_current;
      v5->_current = v9;
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue([v4 next]);

    if (v11)
    {
      objc_super v12 = objc_alloc(&OBJC_CLASS___ADSynchronizedIdItem);
      v13 = (void *)objc_claimAutoreleasedReturnValue([v4 next]);
      v14 = -[ADSynchronizedIdItem initAndAdopt:](v12, "initAndAdopt:", v13);
      next = v5->_next;
      v5->_next = v14;
    }
  }

  return v5;
}

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"current:(%@) next:(%@)",  self->_current,  self->_next);
}

- (id)selectEarliest:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    current = self->_current;
    id v7 = (ADSynchronizedIdItem *)objc_claimAutoreleasedReturnValue([v4 current]);
    id v8 = v7;
    if (current)
    {

      v9 = self->_current;
      if (v8)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue([v5 current]);
        id v8 = (ADSynchronizedIdItem *)objc_claimAutoreleasedReturnValue(-[ADSynchronizedIdItem selectEarliest:](v9, "selectEarliest:", v10));
      }

      else
      {
        id v8 = v9;
      }
    }

    next = self->_next;
    v13 = (ADSynchronizedIdItem *)objc_claimAutoreleasedReturnValue([v5 next]);
    v14 = v13;
    if (next)
    {

      v15 = self->_next;
      if (v14)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue([v5 next]);
        v14 = (ADSynchronizedIdItem *)objc_claimAutoreleasedReturnValue(-[ADSynchronizedIdItem selectEarliest:](v15, "selectEarliest:", v16));
      }

      else
      {
        v14 = v15;
      }
    }

    objc_super v17 = self->_next;
    if (v8 == self->_current)
    {
      if (v14 == v17)
      {
        v18 = self;
        goto LABEL_17;
      }
    }

    else if (v14 != v17)
    {
      v18 = v5;
LABEL_17:
      v11 = v18;

      goto LABEL_18;
    }

    v18 = -[ADSynchronizedIdItemPair initWithCurrent:andNext:]( objc_alloc(&OBJC_CLASS___ADSynchronizedIdItemPair),  "initWithCurrent:andNext:",  v8,  v14);
    goto LABEL_17;
  }

  v11 = self;
LABEL_18:

  return v11;
}

- (id)adoptRemoteIfEarly:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    current = self->_current;
    id v7 = (ADSynchronizedIdItem *)objc_claimAutoreleasedReturnValue([v4 current]);
    id v8 = v7;
    if (current)
    {

      v9 = self->_current;
      if (v8)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue([v5 current]);
        id v8 = (ADSynchronizedIdItem *)objc_claimAutoreleasedReturnValue(-[ADSynchronizedIdItem selectEarliest:](v9, "selectEarliest:", v10));
      }

      else
      {
        id v8 = v9;
      }
    }

    next = self->_next;
    v13 = (ADSynchronizedIdItem *)objc_claimAutoreleasedReturnValue([v5 next]);
    v14 = v13;
    if (next)
    {

      v15 = self->_next;
      if (v14)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue([v5 next]);
        v14 = (ADSynchronizedIdItem *)objc_claimAutoreleasedReturnValue(-[ADSynchronizedIdItem selectEarliest:](v15, "selectEarliest:", v16));
      }

      else
      {
        v14 = v15;
      }
    }

    if (v8 == self->_current)
    {
      v18 = self->_next;
      if (v14 == v18)
      {
        v20 = self;
LABEL_17:
        v11 = v20;

        goto LABEL_18;
      }
    }

    else
    {
      objc_super v17 = -[ADSynchronizedIdItem initAndAdopt:andSwitchedCount:]( objc_alloc(&OBJC_CLASS___ADSynchronizedIdItem),  "initAndAdopt:andSwitchedCount:",  v8,  -[ADSynchronizedIdItem switchedCount](self->_current, "switchedCount") + 1);

      v18 = self->_next;
      id v8 = v17;
    }

    if (v14 != v18)
    {
      v19 = -[ADSynchronizedIdItem initAndAdopt:andSwitchedCount:]( objc_alloc(&OBJC_CLASS___ADSynchronizedIdItem),  "initAndAdopt:andSwitchedCount:",  v14,  -[ADSynchronizedIdItem switchedCount](self->_next, "switchedCount") + 1);

      v14 = v19;
    }

    v20 = -[ADSynchronizedIdItemPair initWithCurrent:andNext:]( objc_alloc(&OBJC_CLASS___ADSynchronizedIdItemPair),  "initWithCurrent:andNext:",  v8,  v14);
    goto LABEL_17;
  }

  v11 = self;
LABEL_18:

  return v11;
}

- (unint64_t)_populateNullsWithCreationTime:(id)a3 today:(id)a4 minValidityDays:(unsigned int)a5 maxValidityDays:(unsigned int)a6 currentOption:(unint64_t)a7 nextOption:(unint64_t)a8
{
  uint64_t v10 = *(void *)&a6;
  uint64_t v11 = *(void *)&a5;
  id v14 = a3;
  id v15 = a4;
  if (self->_current)
  {
    a7 = 0LL;
  }

  else
  {
    if ((_DWORD)v10 != (_DWORD)v11) {
      uint64_t v11 = arc4random_uniform(v10 - v11) + v11;
    }
    v16 = objc_alloc(&OBJC_CLASS___ADSynchronizedIdItem);
    objc_super v17 = objc_alloc_init(&OBJC_CLASS___NSUUID);
    v18 = -[ADSynchronizedIdItem initWithValue:andEffectiveFrom:andValidityDays:andCreatedOn:andAdoptedOn:andSwitchedCount:]( v16,  "initWithValue:andEffectiveFrom:andValidityDays:andCreatedOn:andAdoptedOn:andSwitchedCount:",  v17,  v15,  v11,  v14,  0LL,  0LL);
    current = self->_current;
    self->_current = v18;
  }

  if (!self->_next && -[ADSynchronizedIdItem expirationDaysFrom:](self->_current, "expirationDaysFrom:", v15) <= 14)
  {
    v20 = objc_alloc(&OBJC_CLASS___ADSynchronizedIdItem);
    v21 = objc_alloc_init(&OBJC_CLASS___NSUUID);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[ADSynchronizedIdItem expirationDate](self->_current, "expirationDate"));
    v23 = -[ADSynchronizedIdItem initWithValue:andEffectiveFrom:andValidityDays:andCreatedOn:andAdoptedOn:andSwitchedCount:]( v20,  "initWithValue:andEffectiveFrom:andValidityDays:andCreatedOn:andAdoptedOn:andSwitchedCount:",  v21,  v22,  v10,  v14,  0LL,  0LL);
    next = self->_next;
    self->_next = v23;

    a7 |= a8;
  }

  return a7;
}

- (BOOL)setCurrentIfNil:(id)a3 andCreationTime:(id)a4 andValidityDays:(unsigned int)a5
{
  current = self->_current;
  if (!current)
  {
    uint64_t v6 = *(void *)&a5;
    id v9 = a4;
    id v10 = a3;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[ADSynchronizedIdItem alignToMidnight:](&OBJC_CLASS___ADSynchronizedIdItem, "alignToMidnight:", v9));
    objc_super v12 = -[ADSynchronizedIdItem initWithValue:andEffectiveFrom:andValidityDays:andCreatedOn:andAdoptedOn:andSwitchedCount:]( objc_alloc(&OBJC_CLASS___ADSynchronizedIdItem),  "initWithValue:andEffectiveFrom:andValidityDays:andCreatedOn:andAdoptedOn:andSwitchedCount:",  v10,  v11,  v6,  v9,  0LL,  0LL);

    v13 = self->_current;
    self->_current = v12;
  }

  return current == 0LL;
}

- (ADSynchronizedIdItem)current
{
  return (ADSynchronizedIdItem *)objc_getProperty(self, a2, 8LL, 1);
}

- (ADSynchronizedIdItem)next
{
  return (ADSynchronizedIdItem *)objc_getProperty(self, a2, 16LL, 1);
}

- (void).cxx_destruct
{
}

@end