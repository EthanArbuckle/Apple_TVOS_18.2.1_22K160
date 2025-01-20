@interface NSString
- (id)stringByReplacingReservedURLCharactersUsingEncoding:(unint64_t)a3;
@end

@implementation NSString

- (id)stringByReplacingReservedURLCharactersUsingEncoding:(unint64_t)a3
{
  NSUInteger v4 = -[NSString lengthOfBytesUsingEncoding:](self, "lengthOfBytesUsingEncoding:", 1LL);
  v5 = malloc(v4 + 1);
  if (v5)
  {
    v6 = v5;
    -[NSString getCString:maxLength:encoding:](self, "getCString:maxLength:encoding:", v5, v4 + 1, 1LL);
    if (v4)
    {
      v7 = v6;
      do
      {
        int v8 = *v7;
        if ((v8 - 45) >= 2 && v8 != 95 && v8 != 126)
        {
          unsigned int v9 = v8 - 48;
          unsigned int v10 = (v8 & 0xFFFFFFDF) - 65;
          if (v9 >= 0xA && v10 >= 0x1A) {
            _BYTE *v7 = 95;
          }
        }

        ++v7;
        --v4;
      }

      while (v4);
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v6,  1LL));
    free(v6);
  }

  else
  {
    v12 = 0LL;
  }

  return v12;
}

@end