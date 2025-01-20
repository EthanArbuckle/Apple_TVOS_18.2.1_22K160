@interface CBDiscoverySummary
- (CBDiscoverySummary)initWithXPCObject:(id)a3 error:(id *)a4;
- (double)scanTime;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (void)encodeWithXPCObject:(id)a3;
- (void)setScanTime:(double)a3;
@end

@implementation CBDiscoverySummary

- (CBDiscoverySummary)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___CBDiscoverySummary;
  v7 = -[CBDiscoverySummary init](&v24, sel_init);
  if (!v7)
  {
    if (a4)
    {
      [(id)objc_opt_class() description];
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      CBErrorF(-6756, (uint64_t)"%@ super init failed", v17, v18, v19, v20, v21, v22, (uint64_t)v16);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      v14 = 0LL;
      goto LABEL_5;
    }

- (void)encodeWithXPCObject:(id)a3
{
  double scanTime = self->_scanTime;
  if (scanTime != 0.0) {
    xpc_dictionary_set_double(a3, "scTm", scanTime);
  }
}

- (id)description
{
  return -[CBDiscoverySummary descriptionWithLevel:](self, "descriptionWithLevel:", 50LL);
}

- (id)descriptionWithLevel:(int)a3
{
  if ((a3 & 0x8000000) != 0)
  {
    id v3 = 0LL;
  }

  else
  {
    [(id)objc_opt_class() description];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    id v3 = 0LL;
  }

  CUPrintDurationDouble();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  CUAppendF();
  id v4 = v3;

  return v4;
}

- (double)scanTime
{
  return self->_scanTime;
}

- (void)setScanTime:(double)a3
{
  self->_double scanTime = a3;
}

@end