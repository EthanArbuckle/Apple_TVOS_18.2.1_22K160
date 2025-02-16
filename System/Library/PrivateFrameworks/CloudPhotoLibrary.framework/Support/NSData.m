@interface NSData
- (id)cplSummaryDescription;
@end

@implementation NSData

- (id)cplSummaryDescription
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSData base64EncodedStringWithOptions:](self, "base64EncodedStringWithOptions:", 0LL));
  v3 = (char *)[v2 length];
  if ((unint64_t)v3 < 0x33)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@", v2));
  }

  else
  {
    v4 = v3;
    uint64_t v5 = objc_claimAutoreleasedReturnValue([v2 substringToIndex:25]);
    v6 = (void *)objc_claimAutoreleasedReturnValue([v2 substringFromIndex:v4 - 25]);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@...%@", v5, v6));

    v2 = (void *)v5;
  }

  return v7;
}

@end