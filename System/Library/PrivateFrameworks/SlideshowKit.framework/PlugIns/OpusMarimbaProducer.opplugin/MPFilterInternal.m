@interface MPFilterInternal
- (NSString)filterID;
- (NSString)presetID;
- (void)dealloc;
- (void)setFilterID:(id)a3;
- (void)setPresetID:(id)a3;
@end

@implementation MPFilterInternal

- (void)dealloc
{
  self->filterID = 0LL;
  self->presetID = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MPFilterInternal;
  -[MPFilterInternal dealloc](&v3, "dealloc");
}

- (NSString)filterID
{
  return self->filterID;
}

- (void)setFilterID:(id)a3
{
}

- (NSString)presetID
{
  return self->presetID;
}

- (void)setPresetID:(id)a3
{
}

@end