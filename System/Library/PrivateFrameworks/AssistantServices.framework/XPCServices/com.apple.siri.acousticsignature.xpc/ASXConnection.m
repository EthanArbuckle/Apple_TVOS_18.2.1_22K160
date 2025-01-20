@interface ASXConnection
- (id)_extractor;
- (void)appendAcousticData:(id)a3 sampleCount:(int)a4 sampleRate:(int)a5;
- (void)getSignature:(id)a3;
- (void)reset;
- (void)setSampleRate:(int)a3;
@end

@implementation ASXConnection

- (id)_extractor
{
  extractor = self->_extractor;
  if (!extractor)
  {
    v4 = objc_alloc_init(&OBJC_CLASS___ASXExtractor);
    v5 = self->_extractor;
    self->_extractor = v4;

    extractor = self->_extractor;
  }

  return extractor;
}

- (void)setSampleRate:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[ASXConnection _extractor](self, "_extractor"));
  [v4 setSampleRate:v3];
}

- (void)appendAcousticData:(id)a3 sampleCount:(int)a4 sampleRate:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v10 = (id)objc_claimAutoreleasedReturnValue(-[ASXConnection _extractor](self, "_extractor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ASXConnection _extractor](self, "_extractor"));
  [v9 appendAcousticData:v8 sampleCount:v6];
}

- (void)getSignature:(id)a3
{
  uint64_t v6 = (void (**)(id, void *))a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASXConnection _extractor](self, "_extractor"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 currentSignature]);

  if (v6) {
    v6[2](v6, v5);
  }
}

- (void)reset
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[ASXConnection _extractor](self, "_extractor"));
  [v2 reset];
}

- (void).cxx_destruct
{
}

@end