@interface TVMusicBlockBasedValueTransformer
- (TVMusicBlockBasedValueTransformer)init;
- (TVMusicBlockBasedValueTransformer)initWithBlock:(id)a3;
- (id)transformedValue:(id)a3;
- (id)transformerBlock;
- (void)setTransformerBlock:(id)a3;
@end

@implementation TVMusicBlockBasedValueTransformer

- (TVMusicBlockBasedValueTransformer)initWithBlock:(id)a3
{
  id v4 = a3;
  if (!v4) {
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The block must not be nil.");
  }
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TVMusicBlockBasedValueTransformer;
  v5 = -[TVMusicBlockBasedValueTransformer init](&v9, "init");
  if (v5)
  {
    id v6 = [v4 copy];
    id transformerBlock = v5->_transformerBlock;
    v5->_id transformerBlock = v6;
  }

  return v5;
}

- (TVMusicBlockBasedValueTransformer)init
{
  return -[TVMusicBlockBasedValueTransformer initWithBlock:](self, "initWithBlock:", &stru_10026CF00);
}

- (id)transformedValue:(id)a3
{
  id v4 = a3;
  v5 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue( -[TVMusicBlockBasedValueTransformer transformerBlock]( self,  "transformerBlock"));
  uint64_t v6 = ((uint64_t (**)(void, id))v5)[2](v5, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (id)transformerBlock
{
  return self->_transformerBlock;
}

- (void)setTransformerBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end