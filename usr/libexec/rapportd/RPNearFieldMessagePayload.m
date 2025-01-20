@interface RPNearFieldMessagePayload
- (RPNearFieldMessagePayload)initWithDictionary:(id)a3;
- (RPNearFieldMessagePayload)initWithType:(int64_t)a3;
- (id)dictionaryRepresentation;
- (int64_t)type;
@end

@implementation RPNearFieldMessagePayload

- (RPNearFieldMessagePayload)initWithType:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___RPNearFieldMessagePayload;
  v4 = -[RPNearFieldMessagePayload init](&v8, "init");
  v5 = v4;
  if (v4)
  {
    v4->_type = a3;
    v6 = v4;
  }

  return v5;
}

- (RPNearFieldMessagePayload)initWithDictionary:(id)a3
{
  uint64_t NSNumber = NSDictionaryGetNSNumber(a3, &off_10011AE50, 0LL);
  v5 = (void *)objc_claimAutoreleasedReturnValue(NSNumber);
  v6 = v5;
  if (v5) {
    id v7 = [v5 integerValue];
  }
  else {
    id v7 = 0LL;
  }
  objc_super v8 = -[RPNearFieldMessagePayload initWithType:](self, "initWithType:", v7);

  return v8;
}

- (id)dictionaryRepresentation
{
  v5 = &off_10011AE50;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", self->_type));
  v6 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v6,  &v5,  1LL));

  return v3;
}

- (int64_t)type
{
  return self->_type;
}

@end