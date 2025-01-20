@interface PFCloudKitExporterOptions
- (PFCloudKitExporterOptions)initWithDatabase:(id)a3 options:(id)a4;
- (id)copy;
- (void)dealloc;
@end

@implementation PFCloudKitExporterOptions

- (PFCloudKitExporterOptions)initWithDatabase:(id)a3 options:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___PFCloudKitExporterOptions;
  v6 = -[PFCloudKitExporterOptions init](&v8, sel_init);
  if (v6)
  {
    *((void *)v6 + 1) = a3;
    *((void *)v6 + 2) = a4;
    *(_OWORD *)(v6 + 24) = xmmword_1868D6880;
  }

  return (PFCloudKitExporterOptions *)v6;
}

- (void)dealloc
{
  self->_database = 0LL;
  self->_mirroringDelegateOptions = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PFCloudKitExporterOptions;
  -[PFCloudKitExporterOptions dealloc](&v3, sel_dealloc);
}

- (id)copy
{
  id result = -[PFCloudKitExporterOptions initWithDatabase:options:]( objc_alloc(&OBJC_CLASS___PFCloudKitExporterOptions),  "initWithDatabase:options:",  self->_database,  self->_mirroringDelegateOptions);
  if (result)
  {
    *((void *)result + 4) = self->_perOperationObjectThreshold;
    *((void *)result + 3) = self->_perOperationBytesThreshold;
  }

  return result;
}

@end