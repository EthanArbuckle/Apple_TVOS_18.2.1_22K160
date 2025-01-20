@interface OpusMagazineProducerContext
- (NSMutableArray)audioList;
- (NSMutableArray)synopsisGroups;
- (NSMutableDictionary)producerResources;
- (OpusMagazineProducerContext)init;
- (void)dealloc;
- (void)setAudioList:(id)a3;
- (void)setProducerResources:(id)a3;
- (void)setSynopsisGroups:(id)a3;
@end

@implementation OpusMagazineProducerContext

- (OpusMagazineProducerContext)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___OpusMagazineProducerContext;
  v2 = -[OpusMagazineProducerContext init](&v4, "init");
  if (v2)
  {
    v2->_producerResources = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v2->_synopsisGroups = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v2->_audioList = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  }

  return v2;
}

- (void)dealloc
{
  producerResources = self->_producerResources;
  if (producerResources)
  {

    self->_producerResources = 0LL;
  }

  synopsisGroups = self->_synopsisGroups;
  if (synopsisGroups)
  {

    self->_synopsisGroups = 0LL;
  }

  audioList = self->_audioList;
  if (audioList)
  {

    self->_audioList = 0LL;
  }

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___OpusMagazineProducerContext;
  -[OpusMagazineProducerContext dealloc](&v6, "dealloc");
}

- (NSMutableDictionary)producerResources
{
  return self->_producerResources;
}

- (void)setProducerResources:(id)a3
{
}

- (NSMutableArray)synopsisGroups
{
  return self->_synopsisGroups;
}

- (void)setSynopsisGroups:(id)a3
{
}

- (NSMutableArray)audioList
{
  return self->_audioList;
}

- (void)setAudioList:(id)a3
{
}

@end