@interface ACTUserAction
- (id)shortDescription;
- (id)twoKeyTapShortDescription;
- (unint64_t)inputSegment;
- (void)setInputSegment:(unint64_t)a3;
@end

@implementation ACTUserAction

- (id)shortDescription
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ACTUserAction description](self, "description"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ACTUserAction description](self, "description"));
  v5 = (char *)[v4 length] - 1;

  else {
    uint64_t v6 = (uint64_t)v5;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue([v3 substringToIndex:v6]);

  return v7;
}

- (unint64_t)inputSegment
{
  return self->_inputSegment;
}

- (void)setInputSegment:(unint64_t)a3
{
  self->_inputSegment = a3;
}

- (id)twoKeyTapShortDescription
{
  if ((objc_opt_respondsToSelector(self, "firstTap") & 1) != 0
    && (objc_opt_respondsToSelector(self, "secondTap") & 1) != 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ACTUserAction performSelector:](self, "performSelector:", "firstTap"));
    uint64_t v4 = objc_opt_class(&OBJC_CLASS___ACTKeyTap);
    if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0) {
      uint64_t v5 = objc_claimAutoreleasedReturnValue([v3 abbreviatedDescription]);
    }
    else {
      uint64_t v5 = objc_claimAutoreleasedReturnValue([v3 shortDescription]);
    }
    v7 = (void *)v5;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ACTUserAction performSelector:](self, "performSelector:", "secondTap"));
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___ACTKeyTap);
    if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0) {
      uint64_t v10 = objc_claimAutoreleasedReturnValue([v8 abbreviatedDescription]);
    }
    else {
      uint64_t v10 = objc_claimAutoreleasedReturnValue([v8 shortDescription]);
    }
    v11 = (void *)v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue([v7 stringByPaddingToLength:7 withString:@" " startingAtIndex:0]);
    v13 = (void *)objc_claimAutoreleasedReturnValue([v11 stringByPaddingToLength:7 withString:@" " startingAtIndex:0]);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v12, v13));
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  return v6;
}

@end