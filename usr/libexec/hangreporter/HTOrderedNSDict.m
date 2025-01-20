@interface HTOrderedNSDict
- (HTOrderedNSDict)init;
- (HTOrderedNSDict)initWithObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)keyEnumerator;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)objectForKey:(id)a3;
- (unint64_t)count;
- (void)print:(id)a3;
- (void)removeObjectForKey:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
@end

@implementation HTOrderedNSDict

- (HTOrderedNSDict)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___HTOrderedNSDict;
  v2 = -[HTOrderedNSDict init](&v8, "init");
  if (v2)
  {
    v3 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    values = v2->_values;
    v2->_values = v3;

    v5 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    keys = v2->_keys;
    v2->_keys = v5;
  }

  return v2;
}

- (unint64_t)count
{
  return (unint64_t)-[NSMutableArray count](self->_keys, "count");
}

- (id)keyEnumerator
{
  return -[NSMutableArray objectEnumerator](self->_keys, "objectEnumerator");
}

- (id)objectForKey:(id)a3
{
  id v4 = -[NSMutableArray indexOfObject:](self->_keys, "indexOfObject:", a3);
  if (v4 == (id)0x7FFFFFFFFFFFFFFFLL) {
    v5 = 0LL;
  }
  else {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_values, "objectAtIndexedSubscript:", v4));
  }
  return v5;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = -[NSMutableArray indexOfObject:](self->_keys, "indexOfObject:", v6);
  if (v7 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    -[NSMutableArray addObject:](self->_keys, "addObject:", v6);
    -[NSMutableArray addObject:](self->_values, "addObject:", v8);
  }

  else
  {
    -[NSMutableArray setObject:atIndexedSubscript:](self->_values, "setObject:atIndexedSubscript:", v8, v7);
  }
}

- (void)print:(id)a3
{
  keys = self->_keys;
  id v5 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue( -[NSMutableArray objectAtIndexedSubscript:]( self->_values,  "objectAtIndexedSubscript:",  -[NSMutableArray indexOfObject:](keys, "indexOfObject:", v5)));
  NSLog(@" key = %@, value  = %@", v5, v6);
}

- (void)removeObjectForKey:(id)a3
{
  id v4 = -[NSMutableArray indexOfObject:](self->_keys, "indexOfObject:", a3);
  if (v4 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = v4;
    -[NSMutableArray removeObjectAtIndex:](self->_values, "removeObjectAtIndex:", v4);
    -[NSMutableArray removeObjectAtIndex:](self->_keys, "removeObjectAtIndex:", v5);
  }

- (HTOrderedNSDict)initWithObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5
{
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___HTOrderedNSDict;
  id v8 = -[HTOrderedNSDict init](&v22, "init");
  if (v8)
  {
    v9 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    values = v8->_values;
    v8->_values = v9;

    v11 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    keys = v8->_keys;
    v8->_keys = v11;
  }

  if (!a5) {
    return v8;
  }
  while (1)
  {
    v13 = (id)*a4;
    v14 = (id)*a3;
    if (!v13 || v14 == 0LL) {
      break;
    }
    v16 = v14;
    id v17 = -[NSMutableArray indexOfObject:](v8->_keys, "indexOfObject:", v13);
    if (v17 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      -[NSMutableArray addObject:](v8->_keys, "addObject:", v13);
      -[NSMutableArray addObject:](v8->_values, "addObject:", v16);
    }

    else
    {
      -[NSMutableArray setObject:atIndexedSubscript:](v8->_values, "setObject:atIndexedSubscript:", v16, v17);
    }

    ++a3;
    ++a4;
    if (!--a5) {
      return v8;
    }
  }

  objc_exception_throw(NSInvalidArgumentException);
  return (HTOrderedNSDict *)-[HTOrderedNSDict copyWithZone:](v19, v20, v21);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[HTOrderedNSDict initWithObjects:forKeys:]( +[HTOrderedNSDict allocWithZone:](&OBJC_CLASS___HTOrderedNSDict, "allocWithZone:", a3),  "initWithObjects:forKeys:",  self->_values,  self->_keys);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[HTOrderedNSDict copyWithZone:](self, "copyWithZone:", a3);
}

- (void).cxx_destruct
{
}

@end