@interface SCATSimpleElementManager
- (BOOL)containsElement:(id)a3;
- (NSArray)allElements;
- (id)elementAfter:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5;
- (id)elementBefore:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5;
- (id)firstElementWithOptions:(int *)a3;
- (id)identifier;
- (id)lastElementWithOptions:(int *)a3;
- (id)numberOfItemsInCurrentScanCycle;
@end

@implementation SCATSimpleElementManager

- (id)identifier
{
  v2 = (objc_class *)objc_opt_class(self, a2);
  return NSStringFromClass(v2);
}

- (id)numberOfItemsInCurrentScanCycle
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SCATSimpleElementManager allElements](self, "allElements"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v2 count]));

  return v3;
}

- (id)firstElementWithOptions:(int *)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATSimpleElementManager allElements](self, "allElements", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 firstObject]);

  return v4;
}

- (id)lastElementWithOptions:(int *)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATSimpleElementManager allElements](self, "allElements", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 lastObject]);

  return v4;
}

- (id)elementBefore:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5
{
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SCATSimpleElementManager allElements](self, "allElements"));
  v9 = (char *)[v8 indexOfObject:v7];

  if (v9 == (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v12 = 0;
    v11 = 0LL;
    if (!a4) {
      return v11;
    }
    goto LABEL_8;
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SCATSimpleElementManager allElements](self, "allElements"));
  if (v9)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndex:v9 - 1]);
    BOOL v12 = 0;
  }

  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 lastObject]);
    BOOL v12 = 1;
  }

  if (a4) {
LABEL_8:
  }
    *a4 = v12;
  return v11;
}

- (id)elementAfter:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5
{
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SCATSimpleElementManager allElements](self, "allElements"));
  v9 = (char *)[v8 indexOfObject:v7];

  if (v9 == (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v10 = 0;
    v11 = 0LL;
    if (!a4) {
      return v11;
    }
    goto LABEL_8;
  }

  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(-[SCATSimpleElementManager allElements](self, "allElements"));
  v13 = (char *)[v12 count] - 1;

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SCATSimpleElementManager allElements](self, "allElements"));
  v15 = v14;
  BOOL v10 = v9 == v13;
  if (v10) {
    v16 = 0LL;
  }
  else {
    v16 = v9 + 1;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue([v14 objectAtIndex:v16]);

  if (a4) {
LABEL_8:
  }
    *a4 = v10;
  return v11;
}

- (BOOL)containsElement:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATSimpleElementManager allElements](self, "allElements"));
  unsigned __int8 v6 = [v5 containsObject:v4];

  return v6;
}

- (NSArray)allElements
{
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___SCATSimpleElementManager, a2);
  NSRequestConcreteImplementation(self, a2, v4);
  return 0LL;
}

@end