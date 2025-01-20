@interface APSPayloadMessageStatsCounts
- (APSPayloadMessageStatsCount)total;
- (APSPayloadMessageStatsCounts)init;
- (APSPayloadMessageStatsCountsByWakeState)byWakeState;
- (void)_appendPrettyStatusToStatusPrinter:(id)a3 time:(double)a4 type:(id)a5 direction:(id)a6;
- (void)appendPrettyStatusToStatusPrinter:(id)a3 total:(BOOL)a4 direction:(id)a5;
- (void)countTopic:(id)a3 now:(double)a4;
- (void)prepareForDarkWake;
- (void)prepareForFullWake;
- (void)setByWakeState:(id)a3;
- (void)setTotal:(id)a3;
@end

@implementation APSPayloadMessageStatsCounts

- (APSPayloadMessageStatsCounts)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___APSPayloadMessageStatsCounts;
  v2 = -[APSPayloadMessageStatsCounts init](&v8, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___APSPayloadMessageStatsCount);
    total = v2->_total;
    v2->_total = v3;

    v5 = objc_alloc_init(&OBJC_CLASS___APSPayloadMessageStatsCountsByWakeState);
    byWakeState = v2->_byWakeState;
    v2->_byWakeState = v5;
  }

  return v2;
}

- (void)countTopic:(id)a3 now:(double)a4
{
  total = self->_total;
  id v7 = a3;
  -[APSPayloadMessageStatsCount countTopic:now:](total, "countTopic:now:", v7, a4);
  -[APSPayloadMessageStatsCountsByWakeState countTopic:now:](self->_byWakeState, "countTopic:now:", v7, a4);
}

- (void)_appendPrettyStatusToStatusPrinter:(id)a3 time:(double)a4 type:(id)a5 direction:(id)a6
{
  if (a4 != 0.0)
  {
    id v9 = a3;
    id v10 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"last %@ wake %@ push",  a5,  a6));
    [v9 appendDescription:v10 timeIntervalValue:a4];
  }

- (void)appendPrettyStatusToStatusPrinter:(id)a3 total:(BOOL)a4 direction:(id)a5
{
  BOOL v6 = a4;
  id v25 = a3;
  id v8 = a5;
  if (-[APSPayloadMessageStatsCount count](self->_total, "count"))
  {
    if (v6) {
      id v9 = @"total %@ push notifications";
    }
    else {
      id v9 = @"%@ push notifications";
    }
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v9, v8));
    objc_msgSend( v25,  "appendDescription:unsignedIntegerValue:",  v10,  -[APSPayloadMessageStatsCount count](self->_total, "count"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[APSPayloadMessageStatsCountsByWakeState fullWake](self->_byWakeState, "fullWake"));
    id v12 = [v11 count];

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[APSPayloadMessageStatsCountsByWakeState darkWake](self->_byWakeState, "darkWake"));
    unint64_t v14 = (unint64_t)[v13 count];

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[APSPayloadMessageStatsCountsByWakeState unknown](self->_byWakeState, "unknown"));
    unint64_t v16 = (unint64_t)[v15 count];

    [v25 pushIndent];
    objc_msgSend( v25,  "appendDescription:unsignedIntegerValue:",  @"previous hour",  -[APSPayloadMessageStatsCount sumOfBucketType:](self->_total, "sumOfBucketType:", 0));
    objc_msgSend( v25,  "appendDescription:unsignedIntegerValue:",  @"previous day",  -[APSPayloadMessageStatsCount sumOfBucketType:](self->_total, "sumOfBucketType:", 1));
    if (v14 | v16)
    {
      if (v16)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%llu/%llu/%llu",  v12,  v14,  v16));
        v18 = @"full/dark/unknown";
      }

      else
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%llu/%llu",  v12,  v14));
        v18 = @"full/dark";
      }

      [v25 appendDescription:v18 stringValue:v17];

      v22 = (void *)objc_claimAutoreleasedReturnValue(-[APSPayloadMessageStatsCountsByWakeState fullWake](self->_byWakeState, "fullWake"));
      [v22 lastMessageTime];
      -[APSPayloadMessageStatsCounts _appendPrettyStatusToStatusPrinter:time:type:direction:]( self,  "_appendPrettyStatusToStatusPrinter:time:type:direction:",  v25,  @"full",  v8);

      v23 = (void *)objc_claimAutoreleasedReturnValue(-[APSPayloadMessageStatsCountsByWakeState darkWake](self->_byWakeState, "darkWake"));
      [v23 lastMessageTime];
      -[APSPayloadMessageStatsCounts _appendPrettyStatusToStatusPrinter:time:type:direction:]( self,  "_appendPrettyStatusToStatusPrinter:time:type:direction:",  v25,  @"dark",  v8);

      v24 = (void *)objc_claimAutoreleasedReturnValue(-[APSPayloadMessageStatsCountsByWakeState unknown](self->_byWakeState, "unknown"));
      [v24 lastMessageTime];
      -[APSPayloadMessageStatsCounts _appendPrettyStatusToStatusPrinter:time:type:direction:]( self,  "_appendPrettyStatusToStatusPrinter:time:type:direction:",  v25,  @"unknown",  v8);

      v21 = v25;
    }

    else
    {
      if (v6) {
        v19 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"last %@ push notification",  v8);
      }
      else {
        v19 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"last %@ push", v8);
      }
      uint64_t v20 = objc_claimAutoreleasedReturnValue(v19);

      -[APSPayloadMessageStatsCount lastMessageTime](self->_total, "lastMessageTime");
      objc_msgSend(v25, "appendDescription:timeIntervalValue:", v20);
      v21 = v25;
      id v10 = (void *)v20;
    }

    [v21 popIndent];
  }
}

- (void)prepareForDarkWake
{
  byWakeState = self->_byWakeState;
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[APSPayloadMessageStatsCountsByWakeState darkWake](byWakeState, "darkWake"));
  -[APSPayloadMessageStatsCountsByWakeState moveUnknownToDestination:](byWakeState, "moveUnknownToDestination:", v3);
}

- (void)prepareForFullWake
{
  byWakeState = self->_byWakeState;
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[APSPayloadMessageStatsCountsByWakeState fullWake](byWakeState, "fullWake"));
  -[APSPayloadMessageStatsCountsByWakeState moveUnknownToDestination:](byWakeState, "moveUnknownToDestination:", v3);
}

- (APSPayloadMessageStatsCount)total
{
  return self->_total;
}

- (void)setTotal:(id)a3
{
}

- (APSPayloadMessageStatsCountsByWakeState)byWakeState
{
  return self->_byWakeState;
}

- (void)setByWakeState:(id)a3
{
}

- (void).cxx_destruct
{
}

@end