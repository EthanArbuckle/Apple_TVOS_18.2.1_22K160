@interface NSData
+ (NSData)dataWithHexString:(id)a3;
- (id)hexStringRepresentation;
@end

@implementation NSData

+ (NSData)dataWithHexString:(id)a3
{
  id v3 = a3;
  char v17 = 0;
  if ([v3 length])
  {
    id v12 = sub_100021D84();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100025A70((uint64_t)v3, v11, v13);
    }
    goto LABEL_11;
  }

  v4 = malloc((unint64_t)[v3 length] >> 1);
  if (!v4)
  {
    id v14 = sub_100021D84();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100025968(v3, v11);
    }
LABEL_11:

    v8 = 0LL;
    goto LABEL_8;
  }

  v5 = v4;
  if ([v3 length])
  {
    unint64_t v6 = 0LL;
    v7 = v5;
    while (1)
    {
      __str[0] = [v3 characterAtIndex:v6];
      __str[1] = [v3 characterAtIndex:v6 + 1];
      v15 = 0LL;
      _BYTE *v7 = strtol(__str, &v15, 16);
      if (v15 != &v17) {
        break;
      }
      ++v7;
      v6 += 2LL;
    }

    id v10 = sub_100021D84();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1000259EC((uint64_t)v3, v6, v11);
    }
    goto LABEL_11;
  }

- (id)hexStringRepresentation
{
  NSUInteger v3 = -[NSData length](self, "length");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithCapacity:](&OBJC_CLASS___NSMutableString, "stringWithCapacity:", 2 * v3));
  v5 = -[NSData bytes](self, "bytes");
  if (v3)
  {
    unint64_t v6 = v5;
    do
    {
      unsigned int v7 = *v6++;
      objc_msgSend(v4, "appendFormat:", @"%02lx", v7);
      --v3;
    }

    while (v3);
  }

  return v4;
}

@end