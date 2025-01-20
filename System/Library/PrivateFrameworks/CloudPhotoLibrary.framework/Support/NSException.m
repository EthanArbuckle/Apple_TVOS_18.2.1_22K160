@interface NSException
- (id)cplReason;
@end

@implementation NSException

- (id)cplReason
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSException reason](self, "reason"));
  if (v3)
  {
    if (qword_100296538 != -1) {
      dispatch_once(&qword_100296538, &stru_100241EE8);
    }
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue( objc_msgSend( (id)qword_100296540,  "stringByReplacingMatchesInString:options:range:withTemplate:",  v3,  0,  0,  objc_msgSend(v3, "length"),  @"<redacted>"));
  }

  else
  {
    uint64_t v5 = objc_claimAutoreleasedReturnValue(-[NSException name](self, "name"));
    v6 = (void *)v5;
    v7 = @"unknown exception";
    if (v5) {
      v7 = (__CFString *)v5;
    }
    v4 = v7;
  }

  return v4;
}

@end