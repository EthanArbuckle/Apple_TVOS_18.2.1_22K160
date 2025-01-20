@interface PASampleTimeSeriesDataStore
+ (BOOL)supportsSecureCoding;
- (PASampleTimeSeriesDataStore)initWithCoder:(id)a3;
- (PASampleTimeSeriesDataStore)initWithSampleStore:(id)a3;
- (SASampleStore)sampleStore;
- (void)encodeWithCoder:(id)a3;
- (void)setSampleStore:(id)a3;
@end

@implementation PASampleTimeSeriesDataStore

- (PASampleTimeSeriesDataStore)initWithSampleStore:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___PASampleTimeSeriesDataStore;
  v6 = -[PASampleTimeSeriesDataStore init](&v9, sel_init);
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_sampleStore, a3);
  }

  return v7;
}

- (SASampleStore)sampleStore
{
  return (SASampleStore *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setSampleStore:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (PASampleTimeSeriesDataStore)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___PASampleTimeSeriesDataStore;
  id v5 = -[PASampleTimeSeriesDataStore init](&v10, sel_init);
  if (v5)
  {
    v6 = -[SASampleStore initWithCoder:](objc_alloc(&OBJC_CLASS___SASampleStore), "initWithCoder:", v4);
    if (!v6)
    {
      v8 = 0LL;
      goto LABEL_6;
    }

    sampleStore = v5->_sampleStore;
    v5->_sampleStore = v6;
  }

  v8 = v5;
LABEL_6:

  return v8;
}

@end