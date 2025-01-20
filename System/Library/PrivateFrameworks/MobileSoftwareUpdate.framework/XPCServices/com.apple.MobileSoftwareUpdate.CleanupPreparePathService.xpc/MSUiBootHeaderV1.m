@interface MSUiBootHeaderV1
- (BOOL)isValid;
- (BOOL)loadHeaderAtOffset:(unsigned int)a3;
- (id)description;
- (id)packStructure;
- (int64_t)compareTo:(id)a3;
- (unsigned)length;
- (unsigned)valid;
- (void)invalidate;
- (void)makeValid;
- (void)setAsFirstGeneration;
- (void)setValid:(unsigned int)a3;
@end

@implementation MSUiBootHeaderV1

- (id)packStructure
{
  v4[0] = -[MSUiBootHeader headerGeneration](self, "headerGeneration");
  v4[1] = -[MSUiBootHeaderV1 valid](self, "valid");
  return +[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v4, 8LL);
}

- (BOOL)loadHeaderAtOffset:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v8 = 0LL;
  id v5 = -[IOServiceWriter readDataAtOffset:ofLength:]( -[MSUiBootHeader serviceWriter](self, "serviceWriter"),  "readDataAtOffset:ofLength:",  *(void *)&a3,  8LL);
  id v6 = [v5 length];
  if (v6)
  {
    [v5 getBytes:&v8 length:8];
    -[MSUiBootHeader setHeaderGeneration:](self, "setHeaderGeneration:", v8);
    -[MSUiBootHeaderV1 setValid:](self, "setValid:", HIDWORD(v8));
    -[MSUiBootHeader setStartLocation:](self, "setStartLocation:", v3);
    -[MSUiBootHeader setImageAddress:](self, "setImageAddress:", 0LL);
  }

  return v6 != 0LL;
}

- (void)invalidate
{
}

- (void)setAsFirstGeneration
{
}

- (void)makeValid
{
}

- (unsigned)length
{
  return 8;
}

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Generation: 0x%08x. Valid: 0x%08x. HeaderStart: 0x%08x. PayloadAddress: 0x%08x",  -[MSUiBootHeader headerGeneration](self, "headerGeneration"),  -[MSUiBootHeaderV1 valid](self, "valid"),  -[MSUiBootHeader startLocation](self, "startLocation"),  -[MSUiBootHeader imageAddress](self, "imageAddress"));
}

- (BOOL)isValid
{
  return -[MSUiBootHeaderV1 valid](self, "valid") != -1 && -[MSUiBootHeaderV1 valid](self, "valid") != 0;
}

- (int64_t)compareTo:(id)a3
{
  if (-[MSUiBootHeaderV1 valid](self, "valid") == -1 && -[MSUiBootHeader headerGeneration](self, "headerGeneration"))
  {
    unsigned int v6 = -[MSUiBootHeader headerGeneration](self, "headerGeneration");
    goto LABEL_11;
  }

  unsigned int v13 = [a3 headerGeneration];
  if (v13 <= -[MSUiBootHeader headerGeneration](self, "headerGeneration")
    && -[MSUiBootHeaderV1 isValid](self, "isValid"))
  {
LABEL_11:
    iBU_LOG_real( (uint64_t)@"Found a prepared header with a smaller generation than the valid header.",  "-[MSUiBootHeaderV1 compareTo:]",  v7,  v8,  v9,  v10,  v11,  v12,  v14);
    return 0LL;
  }

  return -1LL;
}

- (unsigned)valid
{
  return self->_valid;
}

- (void)setValid:(unsigned int)a3
{
  self->_valid = a3;
}

@end