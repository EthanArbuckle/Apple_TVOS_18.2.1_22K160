@interface _DASWidgetRefreshBudget
+ (id)budgetWithName:(id)a3 widgetBudgetID:(id)a4 capacity:(double)a5 balance:(double)a6 allocationType:(unsigned __int8)a7;
- (NSString)widgetBudgetID;
- (_DASWidgetRefreshBudget)initWithCoder:(id)a3;
- (_DASWidgetRefreshBudget)initWithDictionary:(id)a3;
- (_DASWidgetRefreshBudget)initWithName:(id)a3 widgetBudgetID:(id)a4 capacity:(double)a5 balance:(double)a6 allocationType:(unsigned __int8)a7;
- (id)description;
- (id)dictionaryRepresentation;
- (void)encodeWithCoder:(id)a3;
- (void)setWidgetBudgetID:(id)a3;
@end

@implementation _DASWidgetRefreshBudget

- (_DASWidgetRefreshBudget)initWithName:(id)a3 widgetBudgetID:(id)a4 capacity:(double)a5 balance:(double)a6 allocationType:(unsigned __int8)a7
{
  uint64_t v7 = a7;
  id v13 = a4;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS____DASWidgetRefreshBudget;
  v14 = -[_DASBudget initWithName:capacity:balance:allocationType:lastModulatedDate:]( &v17,  "initWithName:capacity:balance:allocationType:lastModulatedDate:",  a3,  v7,  0LL,  a5,  a6);
  v15 = v14;
  if (v14) {
    objc_storeStrong((id *)&v14->_widgetBudgetID, a4);
  }

  return v15;
}

- (_DASWidgetRefreshBudget)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS____DASWidgetRefreshBudget;
  v5 = -[_DASBudget initWithDictionary:](&v11, "initWithDictionary:", v4);
  if (v5)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"budgetID"]);
    widgetBudgetID = v5->_widgetBudgetID;
    v5->_widgetBudgetID = (NSString *)v6;

    if (!v5->_widgetBudgetID)
    {
      uint64_t v8 = objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"widgetID"]);
      v9 = v5->_widgetBudgetID;
      v5->_widgetBudgetID = (NSString *)v8;
    }
  }

  return v5;
}

+ (id)budgetWithName:(id)a3 widgetBudgetID:(id)a4 capacity:(double)a5 balance:(double)a6 allocationType:(unsigned __int8)a7
{
  uint64_t v7 = a7;
  id v12 = a4;
  id v13 = a3;
  id v14 = [objc_alloc((Class)objc_opt_class(a1)) initWithName:v13 widgetBudgetID:v12 capacity:v7 balance:a5 allocationType:a6];

  return v14;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_DASBudget name](self, "name"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( [v3 stringByReplacingOccurrencesOfString:@"com.apple.dasd.widget_" withString:&stru_100118C98]);

  -[_DASBudget balance](self, "balance");
  uint64_t v6 = v5;
  -[_DASBudget capacity](self, "capacity");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<_DASWidgetBudget %@: %12.2lf/%12.2lf>",  v4,  v6,  v7));

  return v8;
}

- (id)dictionaryRepresentation
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS____DASWidgetRefreshBudget;
  id v3 = -[_DASBudget dictionaryRepresentation](&v7, "dictionaryRepresentation");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = [v4 mutableCopy];

  [v5 setObject:self->_widgetBudgetID forKeyedSubscript:@"budgetID"];
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS____DASWidgetRefreshBudget;
  id v4 = a3;
  -[_DASBudget encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_widgetBudgetID, @"budgetID", v5.receiver, v5.super_class);
}

- (_DASWidgetRefreshBudget)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS____DASWidgetRefreshBudget;
  objc_super v5 = -[_DASBudget initWithCoder:](&v10, "initWithCoder:", v4);
  if (v5)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 decodeObjectForKey:@"budgetID"]);
    -[_DASWidgetRefreshBudget setWidgetBudgetID:](v5, "setWidgetBudgetID:", v6);

    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[_DASWidgetRefreshBudget widgetBudgetID](v5, "widgetBudgetID"));
    if (!v7)
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 decodeObjectForKey:@"widgetID"]);
      -[_DASWidgetRefreshBudget setWidgetBudgetID:](v5, "setWidgetBudgetID:", v8);
    }
  }

  return v5;
}

- (NSString)widgetBudgetID
{
  return self->_widgetBudgetID;
}

- (void)setWidgetBudgetID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end