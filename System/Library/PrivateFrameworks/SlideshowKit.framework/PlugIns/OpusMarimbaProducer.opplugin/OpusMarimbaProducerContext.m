@interface OpusMarimbaProducerContext
+ (void)initialize;
- (NSMutableArray)synopsisGroups;
- (OpusMarimbaProducerContext)init;
- (void)dealloc;
- (void)setSynopsisGroups:(id)a3;
@end

@implementation OpusMarimbaProducerContext

+ (void)initialize
{
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(25LL, 0LL);
  dispatch_async(global_queue, &stru_24DD60);
}

- (OpusMarimbaProducerContext)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___OpusMarimbaProducerContext;
  v2 = -[OpusMarimbaProducerContext init](&v4, "init");
  if (v2) {
    v2->_synopsisGroups = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  }
  return v2;
}

- (void)dealloc
{
  synopsisGroups = self->_synopsisGroups;
  if (synopsisGroups)
  {

    self->_synopsisGroups = 0LL;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___OpusMarimbaProducerContext;
  -[OpusMarimbaProducerContext dealloc](&v4, "dealloc");
}

- (NSMutableArray)synopsisGroups
{
  return self->_synopsisGroups;
}

- (void)setSynopsisGroups:(id)a3
{
}

@end