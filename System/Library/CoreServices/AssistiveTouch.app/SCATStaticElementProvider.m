@interface SCATStaticElementProvider
- (BOOL)containsElement:(id)a3;
- (BOOL)providesElements;
- (NSArray)elements;
- (NSString)description;
- (SCATStaticElementProvider)initWithElements:(id)a3;
- (id)elementAfter:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5;
- (id)elementBefore:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5;
- (id)firstElementWithOptions:(int *)a3;
- (id)lastElementWithOptions:(int *)a3;
- (id)objectAtIndex:(unint64_t)a3;
- (unint64_t)count;
- (void)setElements:(id)a3;
@end

@implementation SCATStaticElementProvider

- (SCATStaticElementProvider)initWithElements:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SCATStaticElementProvider;
  v5 = -[SCATStaticElementProvider init](&v9, "init");
  v6 = v5;
  if (v5)
  {
    -[SCATStaticElementProvider setElements:](v5, "setElements:", v4);
    v7 = v6;
  }

  return v6;
}

- (NSString)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[SCATStaticElementProvider count](self, "count")));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SCATStaticElementProvider<%p> numElems:%@.",  self,  v3));

  return (NSString *)v4;
}

- (unint64_t)count
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SCATStaticElementProvider elements](self, "elements"));
  id v3 = [v2 count];

  return (unint64_t)v3;
}

- (id)objectAtIndex:(unint64_t)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATStaticElementProvider elements](self, "elements"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndex:a3]);

  return v5;
}

- (BOOL)providesElements
{
  return 1;
}

- (id)firstElementWithOptions:(int *)a3
{
  id v4 = -[SCATStaticElementProvider count](self, "count", a3);
  if (v4) {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATStaticElementProvider objectAtIndex:](self, "objectAtIndex:", 0LL));
  }
  return v4;
}

- (id)lastElementWithOptions:(int *)a3
{
  id v4 = -[SCATStaticElementProvider count](self, "count", a3);
  if (v4) {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATStaticElementProvider lastObject](self, "lastObject"));
  }
  return v4;
}

- (id)elementAfter:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5
{
  v7 = (char *)-[SCATStaticElementProvider indexOfObject:](self, "indexOfObject:", a3, a4, a5);
  unint64_t v8 = -[SCATStaticElementProvider count](self, "count");
  if (v7 == (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    objc_super v9 = 0LL;
    BOOL v10 = 0;
    if (!a4) {
      return v9;
    }
    goto LABEL_8;
  }

  BOOL v10 = v7 + 1 == (char *)v8;
  else {
    v11 = v7 + 1;
  }
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATStaticElementProvider objectAtIndex:](self, "objectAtIndex:", v11));
  if (a4) {
LABEL_8:
  }
    *a4 = v10;
  return v9;
}

- (id)elementBefore:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5
{
  v7 = (char *)-[SCATStaticElementProvider indexOfObject:](self, "indexOfObject:", a3, a4, a5);
  unint64_t v8 = -[SCATStaticElementProvider count](self, "count");
  if (v7 == (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    objc_super v9 = 0LL;
    BOOL v10 = 0;
    if (!a4) {
      return v9;
    }
    goto LABEL_8;
  }

  BOOL v10 = v7 == 0LL;
  if (v7) {
    v11 = v7;
  }
  else {
    v11 = (char *)v8;
  }
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATStaticElementProvider objectAtIndex:](self, "objectAtIndex:", v11 - 1));
  if (a4) {
LABEL_8:
  }
    *a4 = v10;
  return v9;
}

- (BOOL)containsElement:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATStaticElementProvider elements](self, "elements"));
  unsigned __int8 v6 = [v5 containsObject:v4];

  return v6;
}

- (NSArray)elements
{
  return self->_elements;
}

- (void)setElements:(id)a3
{
}

- (void).cxx_destruct
{
}

@end