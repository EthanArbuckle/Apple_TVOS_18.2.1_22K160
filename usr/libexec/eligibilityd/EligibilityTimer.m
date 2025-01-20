@interface EligibilityTimer
+ (BOOL)supportsSecureCoding;
- (BOOL)enabled;
- (BOOL)hasExpired;
- (BOOL)isActive;
- (BOOL)isEqual:(id)a3;
- (EligibilityTimer)initWithCoder:(id)a3;
- (EligibilityTimer)initWithSeconds:(unint64_t)a3;
- (NSDate)timeStart;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)loadedTimeInSeconds;
- (void)enable;
- (void)encodeWithCoder:(id)a3;
- (void)reset;
- (void)resume;
- (void)setDurationWithSeconds:(unint64_t)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setLoadedTimeInSeconds:(unint64_t)a3;
- (void)setTimeStart:(id)a3;
@end

@implementation EligibilityTimer

- (EligibilityTimer)initWithSeconds:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___EligibilityTimer;
  v4 = -[EligibilityTimer init](&v8, "init");
  v5 = v4;
  if (v4)
  {
    timeStart = v4->_timeStart;
    v4->_loadedTimeInSeconds = a3;
    v4->_timeStart = 0LL;

    v5->_enabled = 0;
  }

  return v5;
}

- (void)setDurationWithSeconds:(unint64_t)a3
{
  self->_loadedTimeInSeconds = a3;
}

- (void)enable
{
}

- (void)resume
{
  if (-[EligibilityTimer enabled](self, "enabled"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityTimer timeStart](self, "timeStart"));

    if (!v3)
    {
      id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
      -[EligibilityTimer setTimeStart:](self, "setTimeStart:", v4);
    }
  }

- (void)reset
{
}

- (BOOL)hasExpired
{
  if (!-[EligibilityTimer enabled](self, "enabled")) {
    return 1;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityTimer timeStart](self, "timeStart"));
  id v4 = v3;
  if (v3)
  {
    [v3 timeIntervalSinceNow];
    BOOL v6 = -v5 >= (double)-[EligibilityTimer loadedTimeInSeconds](self, "loadedTimeInSeconds");
  }

  else
  {
    BOOL v6 = 1;
  }

  return v6;
}

- (BOOL)isActive
{
  if (-[EligibilityTimer enabled](self, "enabled"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityTimer timeStart](self, "timeStart"));
    if (v3) {
      unsigned int v4 = !-[EligibilityTimer hasExpired](self, "hasExpired");
    }
    else {
      LOBYTE(v4) = 0;
    }
  }

  else
  {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[EligibilityTimer loadedTimeInSeconds](self, "loadedTimeInSeconds")));
  [v6 encodeObject:v4 forKey:@"loadedTimeInSeconds"];

  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityTimer timeStart](self, "timeStart"));
  [v6 encodeObject:v5 forKey:@"timeStart"];

  objc_msgSend(v6, "encodeBool:forKey:", -[EligibilityTimer enabled](self, "enabled"), @"enabled");
}

- (EligibilityTimer)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___EligibilityTimer;
  double v5 = -[EligibilityTimer init](&v12, "init");
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"loadedTimeInSeconds"];
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v5->_loadedTimeInSeconds = (unint64_t)[v7 unsignedIntegerValue];

    id v8 = [v4 decodeObjectOfClass:objc_opt_class(NSDate) forKey:@"timeStart"];
    uint64_t v9 = objc_claimAutoreleasedReturnValue(v8);
    timeStart = v5->_timeStart;
    v5->_timeStart = (NSDate *)v9;

    v5->_enabled = [v4 decodeBoolForKey:@"enabled"];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setLoadedTimeInSeconds:", -[EligibilityTimer loadedTimeInSeconds](self, "loadedTimeInSeconds"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityTimer timeStart](self, "timeStart"));
  id v7 = [v6 copyWithZone:a3];
  [v5 setTimeStart:v7];

  objc_msgSend(v5, "setEnabled:", -[EligibilityTimer enabled](self, "enabled"));
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3 = -[EligibilityTimer loadedTimeInSeconds](self, "loadedTimeInSeconds");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityTimer timeStart](self, "timeStart"));
  unint64_t v5 = (unint64_t)[v4 hash] ^ v3;

  return v5 ^ -[EligibilityTimer enabled](self, "enabled");
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (EligibilityTimer *)a3;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___EligibilityTimer;
  if (-[EligibilityTimer isEqual:](&v18, "isEqual:", v4))
  {
    if (v4 == self)
    {
      BOOL v14 = 1;
      goto LABEL_18;
    }

    uint64_t v5 = objc_opt_class(self);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      id v6 = v4;
      id v7 = -[EligibilityTimer loadedTimeInSeconds](self, "loadedTimeInSeconds");
      if (v7 == (id)-[EligibilityTimer loadedTimeInSeconds](v6, "loadedTimeInSeconds"))
      {
        id v8 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityTimer timeStart](self, "timeStart"));
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityTimer timeStart](v6, "timeStart"));
        char v10 = sub_1000179E0(v8, v9);

        if ((v10 & 1) != 0)
        {
          unsigned int v11 = -[EligibilityTimer enabled](self, "enabled");
          if (v11 == -[EligibilityTimer enabled](v6, "enabled"))
          {
            BOOL v14 = 1;
            goto LABEL_17;
          }

          id v12 = sub_10000C968();
          v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            v20 = "-[EligibilityTimer isEqual:]";
            __int16 v21 = 2080;
            v22 = "enabled";
LABEL_15:
            _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%s: Property %s did not match",  buf,  0x16u);
          }
        }

        else
        {
          id v16 = sub_10000C968();
          v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            v20 = "-[EligibilityTimer isEqual:]";
            __int16 v21 = 2080;
            v22 = "timeStart";
            goto LABEL_15;
          }
        }
      }

      else
      {
        id v15 = sub_10000C968();
        v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v20 = "-[EligibilityTimer isEqual:]";
          __int16 v21 = 2080;
          v22 = "loadedTimeInSeconds";
          goto LABEL_15;
        }
      }

      BOOL v14 = 0;
LABEL_17:

      goto LABEL_18;
    }
  }

  BOOL v14 = 0;
LABEL_18:

  return v14;
}

- (id)description
{
  unint64_t v3 = -[EligibilityTimer loadedTimeInSeconds](self, "loadedTimeInSeconds");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityTimer timeStart](self, "timeStart"));
  unsigned int v5 = -[EligibilityTimer enabled](self, "enabled");
  id v6 = @"N";
  if (v5) {
    id v6 = @"Y";
  }
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<Timer loadedTime: %lu(seconds), timeStart: %@, enabled: %@>",  v3,  v4,  v6));

  return v7;
}

- (unint64_t)loadedTimeInSeconds
{
  return self->_loadedTimeInSeconds;
}

- (void)setLoadedTimeInSeconds:(unint64_t)a3
{
  self->_loadedTimeInSeconds = a3;
}

- (NSDate)timeStart
{
  return self->_timeStart;
}

- (void)setTimeStart:(id)a3
{
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end