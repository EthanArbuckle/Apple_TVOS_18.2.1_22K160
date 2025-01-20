@interface MSUiBootHeader
- (BOOL)isValid;
- (BOOL)loadHeaderAtOffset:(unsigned int)a3;
- (IOServiceWriter)serviceWriter;
- (MSUiBootHeader)initWithIOServiceWriter:(id)a3;
- (id)packStructure;
- (int64_t)compareTo:(id)a3;
- (unsigned)headerGeneration;
- (unsigned)imageAddress;
- (unsigned)length;
- (unsigned)startLocation;
- (void)bumpGeneration;
- (void)dealloc;
- (void)invalidate;
- (void)setAsFirstGeneration;
- (void)setHeaderGeneration:(unsigned int)a3;
- (void)setImageAddress:(unsigned int)a3;
- (void)setServiceWriter:(id)a3;
- (void)setStartLocation:(unsigned int)a3;
- (void)writeHeaderToOffset:(unsigned int)a3;
@end

@implementation MSUiBootHeader

- (MSUiBootHeader)initWithIOServiceWriter:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MSUiBootHeader;
  v4 = -[MSUiBootHeader init](&v6, "init");
  if (v4) {
    v4->_serviceWriter = (IOServiceWriter *)a3;
  }
  return v4;
}

- (id)packStructure
{
  return 0LL;
}

- (BOOL)loadHeaderAtOffset:(unsigned int)a3
{
  return 0;
}

- (void)writeHeaderToOffset:(unsigned int)a3
{
}

- (void)invalidate
{
}

- (void)setAsFirstGeneration
{
}

- (unsigned)length
{
  return 0;
}

- (void)bumpGeneration
{
  if (-[MSUiBootHeader headerGeneration](self, "headerGeneration") == -1) {
    uint64_t v3 = 1LL;
  }
  else {
    uint64_t v3 = -[MSUiBootHeader headerGeneration](self, "headerGeneration") + 1;
  }
  -[MSUiBootHeader setHeaderGeneration:](self, "setHeaderGeneration:", v3);
}

- (int64_t)compareTo:(id)a3
{
  unsigned int v5 = -[MSUiBootHeader headerGeneration](self, "headerGeneration");
  unsigned int v7 = -[MSUiBootHeader headerGeneration](self, "headerGeneration");
  iBU_LOG_real( (uint64_t)@"Found two headers with the same generation count.",  "-[MSUiBootHeader compareTo:]",  v8,  v9,  v10,  v11,  v12,  v13,  v14);
  return 0LL;
}

- (BOOL)isValid
{
  return 1;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MSUiBootHeader;
  -[MSUiBootHeader dealloc](&v3, "dealloc");
}

- (unsigned)startLocation
{
  return self->_startLocation;
}

- (void)setStartLocation:(unsigned int)a3
{
  self->_startLocation = a3;
}

- (unsigned)imageAddress
{
  return self->_imageAddress;
}

- (void)setImageAddress:(unsigned int)a3
{
  self->_imageAddress = a3;
}

- (IOServiceWriter)serviceWriter
{
  return (IOServiceWriter *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setServiceWriter:(id)a3
{
}

- (unsigned)headerGeneration
{
  return self->_headerGeneration;
}

- (void)setHeaderGeneration:(unsigned int)a3
{
  self->_headerGeneration = a3;
}

@end