@interface NSArray
- (id)shuffledArrayWithCount:(int64_t)a3;
- (id)tvm_mutableDeepCopy;
@end

@implementation NSArray

- (id)shuffledArrayWithCount:(int64_t)a3
{
  int64_t v5 = -[NSArray count](self, "count");
  int64_t v6 = v5;
  if (v5 < a3) {
    a3 = v5;
  }
  id v7 = -[NSArray mutableCopy](self, "mutableCopy");
  if (a3 >= 1)
  {
    uint64_t v8 = 0LL;
    do
    {
      [v7 exchangeObjectAtIndex:v8 + arc4random() % v6 withObjectAtIndex:v8];
      ++v8;
      --v6;
    }

    while (a3 != v8);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "subarrayWithRange:", 0, a3));

  return v9;
}

- (id)tvm_mutableDeepCopy
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10009AC88;
  v5[3] = &unk_10026CB80;
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  int64_t v6 = v3;
  -[NSArray enumerateObjectsUsingBlock:](self, "enumerateObjectsUsingBlock:", v5);

  return v3;
}

@end