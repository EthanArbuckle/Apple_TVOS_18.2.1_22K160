@interface NSSet
- (BOOL)containsElementsNotIn:(id)a3;
- (BOOL)isEmpty;
- (id)shortDescription;
- (id)sortedElementsJoinedByString:(id)a3;
- (id)sortedElementsTruncated:(unint64_t)a3 JoinedByString:(id)a4;
@end

@implementation NSSet

- (id)shortDescription
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSSet allObjects](self, "allObjects"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 sortedArrayUsingSelector:"compare:"]);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "concatenateWithSeparator:", @", "));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"{[%@]}", v4));

  return v5;
}

- (id)sortedElementsJoinedByString:(id)a3
{
  return -[NSSet sortedElementsTruncated:JoinedByString:](self, "sortedElementsTruncated:JoinedByString:", 0LL, a3);
}

- (id)sortedElementsTruncated:(unint64_t)a3 JoinedByString:(id)a4
{
  id v6 = a4;
  v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472LL;
  v12 = sub_10001A9CC;
  v13 = &unk_100283708;
  id v14 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  unint64_t v15 = a3;
  id v7 = v14;
  -[NSSet enumerateObjectsUsingBlock:](self, "enumerateObjectsUsingBlock:", &v10);
  objc_msgSend(v7, "sortUsingSelector:", "compare:", v10, v11, v12, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 componentsJoinedByString:v6]);

  return v8;
}

- (BOOL)containsElementsNotIn:(id)a3
{
  uint64_t v9 = 0LL;
  v10 = &v9;
  uint64_t v11 = 0x2020000000LL;
  char v12 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10001AB4C;
  v6[3] = &unk_1002836E0;
  id v4 = a3;
  id v7 = v4;
  v8 = &v9;
  -[NSSet enumerateObjectsUsingBlock:](self, "enumerateObjectsUsingBlock:", v6);
  LOBYTE(self) = *((_BYTE *)v10 + 24);

  _Block_object_dispose(&v9, 8);
  return (char)self;
}

- (BOOL)isEmpty
{
  return -[NSSet count](self, "count") == 0;
}

@end