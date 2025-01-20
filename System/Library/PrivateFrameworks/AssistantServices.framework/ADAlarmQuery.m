@interface ADAlarmQuery
- (ADAlarmQuery)initWithCriteria:(id)a3 searchOptions:(int64_t)a4;
- (BOOL)matchesAlarm:(id)a3;
- (id)criteria;
- (int64_t)searchOptions;
@end

@implementation ADAlarmQuery

- (ADAlarmQuery)initWithCriteria:(id)a3 searchOptions:(int64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___ADAlarmQuery;
  v7 = -[ADAlarmQuery init](&v11, "init");
  if (v7)
  {
    v8 = (STAlarm *)[v6 copy];
    criteria = v7->_criteria;
    v7->_criteria = v8;

    v7->_searchOptions = a4;
  }

  return v7;
}

- (id)criteria
{
  return self->_criteria;
}

- (int64_t)searchOptions
{
  return self->_searchOptions;
}

- (void).cxx_destruct
{
}

- (BOOL)matchesAlarm:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADAlarmQuery criteria](self, "criteria"));
  unsigned __int8 v6 = -[ADAlarmQuery searchOptions](self, "searchOptions");
  unsigned __int8 v7 = v6;
  if ((v6 & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
      objc_super v11 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
      unsigned __int8 v8 = [v10 isEqualToString:v11];
    }

    else
    {
      unsigned __int8 v8 = 0;
    }
  }

  else
  {
    if ((v7 & 0x20) != 0)
    {
      uint64_t v12 = objc_claimAutoreleasedReturnValue([v5 label]);
      if (v12)
      {
        v13 = (void *)v12;
        v14 = (void *)objc_claimAutoreleasedReturnValue([v4 label]);
        v15 = (void *)objc_claimAutoreleasedReturnValue([v5 label]);
        unsigned int v16 = [v14 isEqualToString:v15];

        if (!v16) {
          goto LABEL_5;
        }
      }
    }

    if ((v7 & 4) != 0 && (id v17 = [v4 daysOfWeek], v17 != objc_msgSend(v5, "daysOfWeek"))
      || (v7 & 8) != 0 && (id v18 = [v4 hourOfDay], v18 != objc_msgSend(v5, "hourOfDay"))
      || (v7 & 0x10) != 0 && (id v19 = [v4 minuteOfHour], v19 != objc_msgSend(v5, "minuteOfHour"))
      || (v7 & 2) != 0
      && (unsigned int v20 = [v4 isEnabled], v20 != objc_msgSend(v5, "isEnabled")))
    {
LABEL_5:
      unsigned __int8 v8 = 0;
    }

    else
    {
LABEL_19:
      unsigned __int8 v8 = 1;
    }
  }

  return v8;
}

@end