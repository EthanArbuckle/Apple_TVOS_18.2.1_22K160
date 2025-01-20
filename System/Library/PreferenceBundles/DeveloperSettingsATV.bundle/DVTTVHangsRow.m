@interface DVTTVHangsRow
+ (id)appRowWithData:(id)a3;
+ (id)errorRow;
+ (id)eventRowWithData:(id)a3;
+ (id)placeholderRow;
- (BOOL)isEqual:(id)a3;
- (DVTTVHangsRow)initWithType:(int64_t)a3 appData:(id)a4 hangEventData:(id)a5;
- (HTDeveloperApp)appData;
- (NSArray)hangEventData;
- (int64_t)type;
- (unint64_t)hash;
- (void)setAppData:(id)a3;
- (void)setHangEventData:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation DVTTVHangsRow

+ (id)appRowWithData:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithType:0 appData:v4 hangEventData:0];

  return v5;
}

+ (id)eventRowWithData:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithType:1 appData:0 hangEventData:v4];

  return v5;
}

+ (id)placeholderRow
{
  return [objc_alloc((Class)a1) initWithType:2 appData:0 hangEventData:0];
}

+ (id)errorRow
{
  return [objc_alloc((Class)a1) initWithType:3 appData:0 hangEventData:0];
}

- (DVTTVHangsRow)initWithType:(int64_t)a3 appData:(id)a4 hangEventData:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___DVTTVHangsRow;
  v11 = -[DVTTVHangsRow init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    v11->_type = a3;
    objc_storeStrong((id *)&v11->_appData, a4);
    objc_storeStrong((id *)&v12->_hangEventData, a5);
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (DVTTVHangsRow *)a3;
  if (v4 == self)
  {
    unsigned __int8 v21 = 1;
  }

  else
  {
    uint64_t v5 = objc_opt_class(self);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      v6 = v4;
      id v7 = -[DVTTVHangsRow type](self, "type");
      if (v7 == (id)-[DVTTVHangsRow type](v6, "type"))
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[DVTTVHangsRow appData](self, "appData"));
        id v9 = (void *)objc_claimAutoreleasedReturnValue(-[DVTTVHangsRow appData](v6, "appData"));
        if ([v8 isEqual:v9])
        {
          id v10 = (void *)objc_claimAutoreleasedReturnValue(-[DVTTVHangsRow hangEventData](self, "hangEventData"));
          id v11 = [v10 count];
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[DVTTVHangsRow hangEventData](v6, "hangEventData"));
          id v13 = [v12 count];

          if (v11 == v13)
          {
            objc_super v14 = (void *)objc_claimAutoreleasedReturnValue(-[DVTTVHangsRow hangEventData](self, "hangEventData"));
            id v15 = [v14 count];

            if (v15)
            {
              unint64_t v16 = 0LL;
              do
              {
                v17 = (void *)objc_claimAutoreleasedReturnValue(-[DVTTVHangsRow hangEventData](self, "hangEventData"));
                v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectAtIndexedSubscript:v16]);
                v19 = (void *)objc_claimAutoreleasedReturnValue(-[DVTTVHangsRow hangEventData](v6, "hangEventData"));
                v20 = (void *)objc_claimAutoreleasedReturnValue([v19 objectAtIndexedSubscript:v16]);
                unsigned __int8 v21 = [v18 isEqual:v20];

                if ((v21 & 1) == 0) {
                  break;
                }
                ++v16;
                v22 = (void *)objc_claimAutoreleasedReturnValue(-[DVTTVHangsRow hangEventData](self, "hangEventData"));
                id v23 = [v22 count];
              }

              while (v16 < (unint64_t)v23);
            }

            else
            {
              unsigned __int8 v21 = 1;
            }

            goto LABEL_15;
          }
        }

        else
        {
        }
      }

      unsigned __int8 v21 = 0;
LABEL_15:

      goto LABEL_16;
    }

    unsigned __int8 v21 = 0;
  }

- (unint64_t)hash
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DVTTVHangsRow appData](self, "appData"));
  unint64_t v4 = (unint64_t)[v3 hash];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[DVTTVHangsRow hangEventData](self, "hangEventData"));
  unint64_t v6 = (unint64_t)[v5 hash] ^ v4;
  unint64_t v7 = v6 ^ -[DVTTVHangsRow type](self, "type");

  return v7;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (HTDeveloperApp)appData
{
  return self->_appData;
}

- (void)setAppData:(id)a3
{
}

- (NSArray)hangEventData
{
  return self->_hangEventData;
}

- (void)setHangEventData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end