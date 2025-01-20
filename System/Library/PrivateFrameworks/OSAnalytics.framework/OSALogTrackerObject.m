@interface OSALogTrackerObject
+ (id)sharedTrackers;
+ (id)tracker;
- (NSDate)oldestDate;
- (NSMutableDictionary)signatures;
- (NSString)oldestLogPath;
- (OSALogTrackerObject)init;
- (id)description;
- (unint64_t)count;
- (void)setCount:(unint64_t)a3;
- (void)setOldestDate:(id)a3;
- (void)setOldestLogPath:(id)a3;
@end

@implementation OSALogTrackerObject

+ (id)sharedTrackers
{
  if (sharedTrackers_onceToken != -1) {
    dispatch_once(&sharedTrackers_onceToken, &__block_literal_global_12);
  }
  return (id)sharedTrackers_sharedLogTrackers;
}

void __37__OSALogTrackerObject_sharedTrackers__block_invoke()
{
  dispatch_semaphore_t v0 = dispatch_semaphore_create(1LL);
  v1 = (void *)sAccountingSemaphore;
  sAccountingSemaphore = (uint64_t)v0;

  id v2 = objc_alloc_init(MEMORY[0x189603FC8]);
  v3 = (void *)sharedTrackers_sharedLogTrackers;
  sharedTrackers_sharedLogTrackers = (uint64_t)v2;
}

- (OSALogTrackerObject)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___OSALogTrackerObject;
  id v2 = -[OSALogTrackerObject init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_count = 1LL;
    uint64_t v4 = objc_opt_new();
    signatures = v3->_signatures;
    v3->_signatures = (NSMutableDictionary *)v4;

    uint64_t v6 = [MEMORY[0x189603F50] date];
    oldestDate = v3->_oldestDate;
    v3->_oldestDate = (NSDate *)v6;

    oldestLogPath = v3->_oldestLogPath;
    v3->_oldestLogPath = 0LL;
  }

  return v3;
}

+ (id)tracker
{
  return objc_alloc_init((Class)a1);
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%lu", self->_count);
}

- (unint64_t)count
{
  return self->_count;
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

- (NSString)oldestLogPath
{
  return self->_oldestLogPath;
}

- (void)setOldestLogPath:(id)a3
{
}

- (NSDate)oldestDate
{
  return self->_oldestDate;
}

- (void)setOldestDate:(id)a3
{
}

- (NSMutableDictionary)signatures
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32LL, 1);
}

- (void).cxx_destruct
{
}

@end