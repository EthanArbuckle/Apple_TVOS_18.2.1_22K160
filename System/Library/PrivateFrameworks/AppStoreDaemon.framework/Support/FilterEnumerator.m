@interface FilterEnumerator
- (id)nextObject;
@end

@implementation FilterEnumerator

- (id)nextObject
{
  v3 = 0LL;
  do
  {
    v4 = v3;
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSEnumerator nextObject](self->_enumerator, "nextObject"));
  }

  while (v3 && !-[NSPredicate evaluateWithObject:](self->_predicate, "evaluateWithObject:", v3));
  return v3;
}

- (void).cxx_destruct
{
}

@end