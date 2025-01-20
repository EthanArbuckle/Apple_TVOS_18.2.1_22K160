@interface LACDTOFeatureEnablementModeCoder
- (id)decode:(id)a3;
- (id)encode:(id)a3;
@end

@implementation LACDTOFeatureEnablementModeCoder

- (id)encode:(id)a3
{
  char v7 = [a3 rawValue];
  v3 = objc_alloc(&OBJC_CLASS___LACDTOKVStoreValue);
  [MEMORY[0x189603F48] dataWithBytes:&v7 length:1];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[LACDTOKVStoreValue initWithData:](v3, "initWithData:", v4);

  return v5;
}

- (id)decode:(id)a3
{
  uint64_t v3 = [a3 integerValue];
  if (v3 == 1)
  {
    v4 = +[LACDTOFeatureEnablementMode enabled](&OBJC_CLASS___LACDTOFeatureEnablementMode, "enabled");
  }

  else
  {
    if (v3 == 2) {
      +[LACDTOFeatureEnablementMode enabledWithGracePeriod]( &OBJC_CLASS___LACDTOFeatureEnablementMode,  "enabledWithGracePeriod");
    }
    else {
      +[LACDTOFeatureEnablementMode disabled](&OBJC_CLASS___LACDTOFeatureEnablementMode, "disabled");
    }
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

@end