@interface AutocorrectionTestHarness_Typology
- (id)makeErrorForTest:(id)a3;
@end

@implementation AutocorrectionTestHarness_Typology

- (id)makeErrorForTest:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 input]);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSString);
  char isKindOfClass = objc_opt_isKindOfClass(v4, v5);

  if ((isKindOfClass & 1) != 0) {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v3 touches]);
  }
  else {
    v7 = 0LL;
  }

  return v7;
}

@end