@interface ConcatenateEnumerator
- (id)nextObject;
@end

@implementation ConcatenateEnumerator

- (id)nextObject
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSEnumerator nextObject](self->_prefixEnumerator, "nextObject"));
  if (!v3) {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSEnumerator nextObject](self->_suffixEnumerator, "nextObject"));
  }
  return v3;
}

- (void).cxx_destruct
{
}

@end