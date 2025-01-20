@interface DVTTVHangsDetailFacade
- (DVTTVHangsDetailFacade)initWithLogEntries:(id)a3;
- (NSArray)hangsDataEntries;
- (void)setHangsDataEntries:(id)a3;
@end

@implementation DVTTVHangsDetailFacade

- (DVTTVHangsDetailFacade)initWithLogEntries:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___DVTTVHangsDetailFacade;
  v5 = -[DVTTVHangsDetailFacade init](&v9, "init");
  if (v5)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue(+[HTHangsDataEntry sortedEntriesByFileType:](&OBJC_CLASS___HTHangsDataEntry, "sortedEntriesByFileType:", v4));
    hangsDataEntries = v5->_hangsDataEntries;
    v5->_hangsDataEntries = (NSArray *)v6;
  }

  return v5;
}

- (NSArray)hangsDataEntries
{
  return self->_hangsDataEntries;
}

- (void)setHangsDataEntries:(id)a3
{
}

- (void).cxx_destruct
{
}

@end