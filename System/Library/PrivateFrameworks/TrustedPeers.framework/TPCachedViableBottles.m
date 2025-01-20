@interface TPCachedViableBottles
- (NSArray)partialBottles;
- (NSArray)viableBottles;
- (TPCachedViableBottles)initWithViableBottles:(id)a3 partialBottles:(id)a4;
@end

@implementation TPCachedViableBottles

- (TPCachedViableBottles)initWithViableBottles:(id)a3 partialBottles:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___TPCachedViableBottles;
  v9 = -[TPCachedViableBottles init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_viableBottles, a3);
    objc_storeStrong((id *)&v10->_partialBottles, a4);
  }

  return v10;
}

- (NSArray)viableBottles
{
  return (NSArray *)objc_getProperty(self, a2, 8LL, 1);
}

- (NSArray)partialBottles
{
  return (NSArray *)objc_getProperty(self, a2, 16LL, 1);
}

- (void).cxx_destruct
{
}

@end