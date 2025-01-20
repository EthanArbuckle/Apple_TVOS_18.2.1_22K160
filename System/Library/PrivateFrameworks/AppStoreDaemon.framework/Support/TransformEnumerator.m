@interface TransformEnumerator
- (id)nextObject;
@end

@implementation TransformEnumerator

- (id)nextObject
{
  id Property = (id)objc_claimAutoreleasedReturnValue(-[NSEnumerator nextObject](self->_enumerator, "nextObject"));
  v4 = Property;
  v5 = 0LL;
  if (Property)
  {
    while (1)
    {
      v6 = v5;
      v7 = objc_autoreleasePoolPush();
      uint64_t v8 = (*((uint64_t (**)(void))self->_transform + 2))();
      v5 = (_BYTE *)objc_claimAutoreleasedReturnValue(v8);

      if (!v5) {
        break;
      }
      char v9 = v5[8];
      objc_autoreleasePoolPop(v7);
      if ((v9 & 1) == 0)
      {
        uint64_t v11 = objc_claimAutoreleasedReturnValue(-[NSEnumerator nextObject](self->_enumerator, "nextObject"));

        v4 = (void *)v11;
        if (v11) {
          continue;
        }
      }

      id Property = objc_getProperty(v5, v10, 16LL, 1);
      goto LABEL_7;
    }

    objc_autoreleasePoolPop(v7);
    id Property = 0LL;
  }

- (void).cxx_destruct
{
}

@end