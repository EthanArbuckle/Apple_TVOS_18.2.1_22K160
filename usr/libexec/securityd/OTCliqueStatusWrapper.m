@interface OTCliqueStatusWrapper
- (BOOL)isEqual:(id)a3;
- (OTCliqueStatusWrapper)initWithStatus:(int64_t)a3;
- (id)description;
- (int64_t)status;
@end

@implementation OTCliqueStatusWrapper

- (OTCliqueStatusWrapper)initWithStatus:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___OTCliqueStatusWrapper;
  result = -[OTCliqueStatusWrapper init](&v5, "init");
  if (result) {
    result->_status = a3;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___OTCliqueStatusWrapper, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    id v7 = [v4 status];
    BOOL v8 = v7 == (id)-[OTCliqueStatusWrapper status](self, "status");
  }

  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)description
{
  uint64_t v2 = OTCliqueStatusToString(-[OTCliqueStatusWrapper status](self, "status"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<CliqueStatus: %@>",  v3));

  return v4;
}

- (int64_t)status
{
  return self->_status;
}

@end