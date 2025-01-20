@interface NSData
- (id)_reverse;
@end

@implementation NSData

- (id)_reverse
{
  v2 = -[NSMutableData initWithData:](objc_alloc(&OBJC_CLASS___NSMutableData), "initWithData:", self);
  v3 = -[NSMutableData mutableBytes](v2, "mutableBytes");
  v4 = -[NSMutableData length](v2, "length");
  v5 = &v4[(void)v3 - 1];
  if (v4) {
    BOOL v6 = v5 > v3;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6)
  {
    v7 = v3 + 1;
    do
    {
      char v8 = *(v7 - 1);
      *(v7 - 1) = *v5;
      *v5-- = v8;
    }

    while (v7++ < v5);
  }

  v10 = -[NSData initWithData:](objc_alloc(&OBJC_CLASS___NSData), "initWithData:", v2);

  return v10;
}

@end