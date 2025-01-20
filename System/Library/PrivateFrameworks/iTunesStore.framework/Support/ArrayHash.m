@interface ArrayHash
- (ArrayHash)initWithArray:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSArray)array;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation ArrayHash

- (ArrayHash)initWithArray:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___ArrayHash;
  v4 = -[ArrayHash init](&v6, "init");
  if (v4) {
    v4->_array = (NSArray *)a3;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ArrayHash;
  -[ArrayHash dealloc](&v3, "dealloc");
}

- (unint64_t)hash
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  array = self->_array;
  id v3 = -[NSArray countByEnumeratingWithState:objects:count:]( array,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
  if (!v3) {
    return 0LL;
  }
  id v4 = v3;
  unint64_t v5 = 0LL;
  uint64_t v6 = *(void *)v10;
  do
  {
    for (i = 0LL; i != v4; i = (char *)i + 1)
    {
      if (*(void *)v10 != v6) {
        objc_enumerationMutation(array);
      }
      v5 += (unint64_t)[*(id *)(*((void *)&v9 + 1) + 8 * (void)i) hash];
    }

    id v4 = -[NSArray countByEnumeratingWithState:objects:count:]( array,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
  }

  while (v4);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = objc_opt_class(self);
  if (v5 == objc_opt_class(a3)) {
    return -[NSArray isEqual:]( -[ArrayHash array](self, "array"),  "isEqual:",  [a3 array]);
  }
  else {
    return 0;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v5[1] = -[NSArray copyWithZone:](self->_array, "copyWithZone:", a3);
  return v5;
}

- (NSArray)array
{
  return self->_array;
}

@end