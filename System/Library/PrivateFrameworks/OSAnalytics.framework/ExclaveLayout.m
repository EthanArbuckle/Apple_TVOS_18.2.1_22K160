@interface ExclaveLayout
- (ExclaveLayout)init;
- (NSMutableArray)segments;
- (NSNumber)layoutId;
- (void)setLayoutId:(id)a3;
- (void)setSegments:(id)a3;
@end

@implementation ExclaveLayout

- (ExclaveLayout)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___ExclaveLayout;
  v2 = -[ExclaveLayout init](&v6, sel_init);
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x189603FA8] array];
    segments = v2->_segments;
    v2->_segments = (NSMutableArray *)v3;
  }

  return v2;
}

- (NSNumber)layoutId
{
  return self->_layoutId;
}

- (void)setLayoutId:(id)a3
{
}

- (NSMutableArray)segments
{
  return self->_segments;
}

- (void)setSegments:(id)a3
{
}

- (void).cxx_destruct
{
}

@end