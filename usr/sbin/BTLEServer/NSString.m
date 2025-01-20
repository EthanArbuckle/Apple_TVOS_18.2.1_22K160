@interface NSString
- (id)UTF8DataWithMaxLength:(unint64_t)a3 ellipsis:(BOOL)a4 isTruncated:(BOOL *)a5;
- (id)UTF8StringWithMaxLength:(unint64_t)a3;
- (id)substringWithValidUnicode;
@end

@implementation NSString

- (id)substringWithValidUnicode
{
  if (-[NSString length](self, "length"))
  {
    if ((-[NSString characterAtIndex:](self, "characterAtIndex:", (char *)-[NSString length](self, "length") - 1) & 0xFC00) == 0xD800) {
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue( -[NSString substringToIndex:]( self,  "substringToIndex:",  (char *)-[NSString length](self, "length") - 1));
    }
    else {
      v3 = self;
    }
  }

  else
  {
    v3 = &stru_10005DB20;
  }

  return v3;
}

- (id)UTF8DataWithMaxLength:(unint64_t)a3 ellipsis:(BOOL)a4 isTruncated:(BOOL *)a5
{
  BOOL v6 = a4;
  unint64_t v9 = -[NSString lengthOfBytesUsingEncoding:](self, "lengthOfBytesUsingEncoding:", 4LL);
  if (v9 >= a3) {
    unint64_t v10 = a3;
  }
  else {
    unint64_t v10 = v9;
  }
  if (v9 <= a3 || !v6)
  {
    a3 = v10;
    if (v10)
    {
LABEL_15:
      int v13 = 0;
      unint64_t v12 = a3;
      goto LABEL_16;
    }

- (id)UTF8StringWithMaxLength:(unint64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[NSString UTF8DataWithMaxLength:ellipsis:isTruncated:]( self,  "UTF8DataWithMaxLength:ellipsis:isTruncated:",  a3,  0LL,  0LL));
  if ([v3 length])
  {
    v4 = objc_alloc(&OBJC_CLASS___NSString);
    id v5 = v3;
    BOOL v6 = -[NSString initWithBytes:length:encoding:]( v4,  "initWithBytes:length:encoding:",  [v5 bytes],  objc_msgSend(v5, "length"),  4);
  }

  else
  {
    BOOL v6 = 0LL;
  }

  return v6;
}

@end