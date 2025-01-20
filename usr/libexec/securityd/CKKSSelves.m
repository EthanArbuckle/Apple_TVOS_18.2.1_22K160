@interface CKKSSelves
- (CKKSSelfPeer)currentSelf;
- (CKKSSelves)initWithCurrent:(id)a3 allSelves:(id)a4;
- (NSSet)allSelves;
- (id)description;
- (void)setAllSelves:(id)a3;
- (void)setCurrentSelf:(id)a3;
@end

@implementation CKKSSelves

- (CKKSSelves)initWithCurrent:(id)a3 allSelves:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___CKKSSelves;
  v9 = -[CKKSSelves init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_currentSelf, a3);
    if (v8)
    {
      uint64_t v11 = objc_claimAutoreleasedReturnValue([v8 setByAddingObject:v7]);
    }

    else if (v7)
    {
      uint64_t v11 = objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v7));
    }

    else
    {
      uint64_t v11 = objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
    }

    allSelves = v10->_allSelves;
    v10->_allSelves = (NSSet *)v11;
  }

  return v10;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSelves allSelves](self, "allSelves"));
  v4 = (__CFString *)[v3 mutableCopy];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSelves currentSelf](self, "currentSelf"));
  -[__CFString removeObject:](v4, "removeObject:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSelves currentSelf](self, "currentSelf"));
  id v7 = -[__CFString count](v4, "count");
  id v8 = @"(no past selves)";
  if (v7) {
    id v8 = v4;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<CKKSSelves: %@ %@>",  v6,  v8));

  return v9;
}

- (CKKSSelfPeer)currentSelf
{
  return (CKKSSelfPeer *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setCurrentSelf:(id)a3
{
}

- (NSSet)allSelves
{
  return (NSSet *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setAllSelves:(id)a3
{
}

- (void).cxx_destruct
{
}

@end