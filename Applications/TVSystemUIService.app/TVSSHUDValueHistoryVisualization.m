@interface TVSSHUDValueHistoryVisualization
- (NSArray)values;
- (NSMutableArray)mutableValues;
- (TVSSHUDValueHistoryVisualization)init;
- (unint64_t)numberOfValuesToKeep;
- (void)setMutableValues:(id)a3;
- (void)setNumberOfValuesToKeep:(unint64_t)a3;
- (void)setValue:(id)a3;
@end

@implementation TVSSHUDValueHistoryVisualization

- (TVSSHUDValueHistoryVisualization)init
{
  SEL v7 = a2;
  v8 = 0LL;
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVSSHUDValueHistoryVisualization;
  v8 = -[TVSSHUDValueHistoryVisualization init](&v6, "init");
  objc_storeStrong((id *)&v8, v8);
  if (v8)
  {
    v2 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    mutableValues = v8->_mutableValues;
    v8->_mutableValues = v2;

    v8->_numberOfValuesToKeep = 5LL;
  }

  v5 = v8;
  objc_storeStrong((id *)&v8, 0LL);
  return v5;
}

- (NSArray)values
{
  return (NSArray *)-[NSMutableArray copy](self->_mutableValues, "copy", a2, self);
}

- (void)setValue:(id)a3
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v5 = location[0];
  id v3 = -[NSMutableArray firstObject](v8->_mutableValues, "firstObject");
  BOOL v6 = v5 == v3;

  if (!v6)
  {
    id v4 = -[NSMutableArray count](v8->_mutableValues, "count");
    -[NSMutableArray insertObject:atIndex:](v8->_mutableValues, "insertObject:atIndex:", location[0], 0LL);
    -[TVSSHUDVisualization _notifyDelegateVisualizationDidChange](v8, "_notifyDelegateVisualizationDidChange");
  }

  objc_storeStrong(location, 0LL);
}

- (unint64_t)numberOfValuesToKeep
{
  return self->_numberOfValuesToKeep;
}

- (void)setNumberOfValuesToKeep:(unint64_t)a3
{
  self->_numberOfValuesToKeep = a3;
}

- (NSMutableArray)mutableValues
{
  return self->_mutableValues;
}

- (void)setMutableValues:(id)a3
{
}

- (void).cxx_destruct
{
}

@end