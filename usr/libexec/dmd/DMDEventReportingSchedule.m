@interface DMDEventReportingSchedule
- (BOOL)isEqual:(id)a3;
- (DMDEventReportingSchedule)initWithScheduleRegistration:(id)a3;
- (NSNumber)day;
- (NSNumber)spread;
- (NSString)identifier;
- (NSString)localTime;
- (NSTimer)timer;
- (id)description;
- (int64_t)frequency;
- (unint64_t)hash;
- (void)dealloc;
- (void)setTimer:(id)a3;
- (void)startWithScheduleElapsedHandler:(id)a3;
@end

@implementation DMDEventReportingSchedule

- (DMDEventReportingSchedule)initWithScheduleRegistration:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___DMDEventReportingSchedule;
  v5 = -[DMDEventReportingSchedule init](&v27, "init");
  if (!v5) {
    goto LABEL_24;
  }
  uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 identifier]);
  identifier = v5->_identifier;
  v5->_identifier = (NSString *)v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue([v4 schedule]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 payloadFrequency]);
  v10 = v9;
  if (!v9) {
    goto LABEL_9;
  }
  if (![v9 caseInsensitiveCompare:@"Immediate"])
  {
    uint64_t v14 = 0LL;
    goto LABEL_17;
  }

  if ([v10 caseInsensitiveCompare:@"Minutely"]
    || (v11 = (void *)objc_claimAutoreleasedReturnValue(+[DMDDeviceController shared](&OBJC_CLASS___DMDDeviceController, "shared")),
        v12 = (void *)objc_claimAutoreleasedReturnValue([v11 isAppleInternal]),
        unsigned __int8 v13 = [v12 BOOLValue],
        v12,
        v11,
        (v13 & 1) == 0))
  {
    if (![v10 caseInsensitiveCompare:@"Hourly"])
    {
      uint64_t v14 = 2LL;
      goto LABEL_17;
    }

    if (![v10 caseInsensitiveCompare:@"Weekly"])
    {
      uint64_t v14 = 4LL;
      goto LABEL_17;
    }

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___DMDEventReportingSchedule;
  -[DMDEventReportingSchedule dealloc](&v3, "dealloc");
}

- (id)description
{
  v7[0] = @"frequency";
  v7[1] = @"localTime";
  v7[2] = @"spread";
  v7[3] = @"day";
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v7, 4LL));
  uint64_t v4 = DMFObjectDescriptionWithProperties(self, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (DMDEventReportingSchedule *)a3;
  if (v4 == self)
  {
    unsigned __int8 v16 = 1;
  }

  else
  {
    uint64_t v5 = objc_opt_class(self);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      uint64_t v6 = v4;
      uint64_t v7 = objc_claimAutoreleasedReturnValue(-[DMDEventReportingSchedule day](self, "day"));
      uint64_t v8 = objc_claimAutoreleasedReturnValue(-[DMDEventReportingSchedule day](v6, "day"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEventReportingSchedule identifier](self, "identifier"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEventReportingSchedule identifier](v6, "identifier"));
      if ([v9 isEqual:v10]
        && (id v11 = -[DMDEventReportingSchedule frequency](self, "frequency"),
            v11 == (id)-[DMDEventReportingSchedule frequency](v6, "frequency")))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEventReportingSchedule localTime](self, "localTime"));
        unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEventReportingSchedule localTime](v6, "localTime"));
        if ([v12 isEqual:v13])
        {
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEventReportingSchedule spread](self, "spread"));
          id v15 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEventReportingSchedule spread](v6, "spread"));
          uint64_t v18 = v14;
          if ([v14 isEqual:v15])
          {
            if (v7 | v8) {
              unsigned __int8 v16 = [(id)v7 isEqual:v8];
            }
            else {
              unsigned __int8 v16 = 1;
            }
          }

          else
          {
            unsigned __int8 v16 = 0;
          }
        }

        else
        {
          unsigned __int8 v16 = 0;
        }
      }

      else
      {
        unsigned __int8 v16 = 0;
      }
    }

    else
    {
      unsigned __int8 v16 = 0;
    }
  }

  return v16;
}

- (unint64_t)hash
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEventReportingSchedule identifier](self, "identifier"));
  unint64_t v4 = (unint64_t)[v3 hash];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[DMDEventReportingSchedule frequency](self, "frequency")));
  unint64_t v6 = (unint64_t)[v5 hash];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEventReportingSchedule localTime](self, "localTime"));
  unint64_t v8 = v4 ^ (unint64_t)[v7 hash];
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEventReportingSchedule spread](self, "spread"));
  unint64_t v10 = v8 ^ (unint64_t)[v9 hash];
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEventReportingSchedule day](self, "day"));
  unint64_t v12 = v6 ^ v10 ^ (unint64_t)[v11 hash];

  return v12;
}

- (void)startWithScheduleElapsedHandler:(id)a3
{
  id v4 = a3;
  switch(-[DMDEventReportingSchedule frequency](self, "frequency"))
  {
    case 1LL:
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[DMDDeviceController shared](&OBJC_CLASS___DMDDeviceController, "shared"));
      unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 isAppleInternal]);
      unsigned int v7 = [v6 BOOLValue];

      if (v7) {
        double v8 = 60.0;
      }
      else {
        double v8 = 86400.0;
      }
      break;
    case 2LL:
      double v8 = 3600.0;
      break;
    case 3LL:
      double v8 = 86400.0;
      break;
    case 4LL:
      double v8 = 604800.0;
      break;
    default:
      double v8 = 0.0;
      break;
  }

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100038504;
  v11[3] = &unk_10009E958;
  id v12 = v4;
  id v9 = v4;
  unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSTimer scheduledTimerWithTimeInterval:repeats:block:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:repeats:block:",  1LL,  v11,  v8));
  -[DMDEventReportingSchedule setTimer:](self, "setTimer:", v10);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)frequency
{
  return self->_frequency;
}

- (NSString)localTime
{
  return self->_localTime;
}

- (NSNumber)spread
{
  return self->_spread;
}

- (NSNumber)day
{
  return self->_day;
}

- (NSTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end