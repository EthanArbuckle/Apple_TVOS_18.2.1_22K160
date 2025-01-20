@interface NSMutableString
- (void)tvh_decodeXMLEntities;
- (void)tvh_encodeXMLEntities;
@end

@implementation NSMutableString

- (void)tvh_encodeXMLEntities
{
    2LL,
    0LL,
    -[NSMutableString length](self, "length"));
  -[NSMutableString replaceOccurrencesOfString:withString:options:range:]( self,  "replaceOccurrencesOfString:withString:options:range:",  @"\",  @"&quot;"",
    2LL,
    0LL,
    -[NSMutableString length](self, "length"));
  -[NSMutableString replaceOccurrencesOfString:withString:options:range:]( self,  "replaceOccurrencesOfString:withString:options:range:",  @"'",  @"&#x27;",
    2LL,
    0LL,
    -[NSMutableString length](self, "length"));
  -[NSMutableString replaceOccurrencesOfString:withString:options:range:]( self,  "replaceOccurrencesOfString:withString:options:range:",  @">",  @"&gt;",
    2LL,
    0LL,
    -[NSMutableString length](self, "length"));
  -[NSMutableString replaceOccurrencesOfString:withString:options:range:]( self,  "replaceOccurrencesOfString:withString:options:range:",  @"<",  @"&lt;",
    2LL,
    0LL,
    -[NSMutableString length](self, "length"));
}

- (void)tvh_decodeXMLEntities
{
    @"&",
    2LL,
    0LL,
    -[NSMutableString length](self, "length"));
  -[NSMutableString replaceOccurrencesOfString:withString:options:range:]( self,  "replaceOccurrencesOfString:withString:options:range:",  @"&quot;",
    @"\"",
    2LL,
    0LL,
    -[NSMutableString length](self, "length"));
  -[NSMutableString replaceOccurrencesOfString:withString:options:range:]( self,  "replaceOccurrencesOfString:withString:options:range:",  @"&#x27;",
    @"'",
    2LL,
    0LL,
    -[NSMutableString length](self, "length"));
  -[NSMutableString replaceOccurrencesOfString:withString:options:range:]( self,  "replaceOccurrencesOfString:withString:options:range:",  @"&gt;",
    @">",
    2LL,
    0LL,
    -[NSMutableString length](self, "length"));
  -[NSMutableString replaceOccurrencesOfString:withString:options:range:]( self,  "replaceOccurrencesOfString:withString:options:range:",  @"&lt;",
    @"<",
    2LL,
    0LL,
    -[NSMutableString length](self, "length"));
}

@end