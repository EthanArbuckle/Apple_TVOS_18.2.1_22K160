@interface AccountActiveTime
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
@end

@implementation AccountActiveTime

- (id)description
{
  if (self) {
    double start = self->_start;
  }
  else {
    double start = 0.0;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  start));
  if (self)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  self->_end));
    v6 = v5;
    if (self->_end != 0.0)
    {
      id v7 = sub_1001E83D8(v5);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue(v7);
      goto LABEL_9;
    }
  }

  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  0.0));
  }

  v8 = @"n/a";
LABEL_9:
  id v9 = sub_1001E83D8(v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v9);
  if (self) {
    id Property = objc_getProperty(self, v10, 8LL, 1);
  }
  else {
    id Property = 0LL;
  }
  id v13 = sub_1001A47DC(Property);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v13);
  if (self) {
    id v16 = objc_getProperty(self, v14, 8LL, 1);
  }
  else {
    id v16 = 0LL;
  }
  id v17 = sub_1001A4800(v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"{ start: %@ end: %@ accountID: %@/%@ }",  v11,  v8,  v15,  v18));

  return v19;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_alloc_init(&OBJC_CLASS___AccountActiveTime);
  v6 = -[AccountEvent copyWithZone:](self->_event, "copyWithZone:", a3);
  event = v5->_event;
  v5->_event = v6;

  v5->_double start = self->_start;
  v5->_end = self->_end;
  return v5;
}

- (void).cxx_destruct
{
}

@end