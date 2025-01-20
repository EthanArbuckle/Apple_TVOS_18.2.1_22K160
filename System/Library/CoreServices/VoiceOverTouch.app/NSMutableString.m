@interface NSMutableString
- (void)appendStringWithComma:(id)a3;
@end

@implementation NSMutableString

- (void)appendStringWithComma:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    if (-[NSMutableString length](self, "length")) {
      -[NSMutableString appendString:](self, "appendString:", @", ");
    }
    -[NSMutableString appendString:](self, "appendString:", v4);
  }
}

@end