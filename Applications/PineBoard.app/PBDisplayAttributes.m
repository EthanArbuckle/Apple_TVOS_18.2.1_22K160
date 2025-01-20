@interface PBDisplayAttributes
- (NSData)displayEDID;
- (NSData)physicalAddress;
- (NSNumber)WOM;
- (NSNumber)YOM;
- (NSNumber)audioLatencyInterlaced;
- (NSNumber)audioLatencyProgressive;
- (NSNumber)productID;
- (NSNumber)videoLatencyInterlaced;
- (NSNumber)videoLatencyProgressive;
- (NSString)manufacturer;
- (NSString)product;
- (PBDisplayAttributes)initWithService:(__IOAVService *)a3 interface:(__IOAVVideoInterface *)a4;
@end

@implementation PBDisplayAttributes

- (PBDisplayAttributes)initWithService:(__IOAVService *)a3 interface:(__IOAVVideoInterface *)a4
{
  v44.receiver = self;
  v44.super_class = (Class)&OBJC_CLASS___PBDisplayAttributes;
  v6 = -[PBDisplayAttributes init](&v44, "init");
  if (v6)
  {
    if (a3)
    {
      v43 = 0LL;
      if (!IOAVServiceCopyEDID(a3, &v43))
      {
        displayEDID = v6->_displayEDID;
        v6->_displayEDID = v43;

        v43 = 0LL;
      }

      uint64_t v8 = IOAVServiceCopyProperty(a3, @"Physical Address");
      physicalAddress = v6->_physicalAddress;
      v6->_physicalAddress = (NSData *)v8;
    }

    else
    {
      v11 = -[NSData initWithBytesNoCopy:length:freeWhenDone:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBytesNoCopy:length:freeWhenDone:",  "headless",  8LL,  0LL);
      physicalAddress = v6->_displayEDID;
      v6->_displayEDID = v11;
    }

    if (a4)
    {
      v12 = (void *)IOAVVideoInterfaceCopyProperty(a4, @"AudioLatencyProgressiveMS");
      uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSNumber);
      if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0) {
        v14 = v12;
      }
      else {
        v14 = 0LL;
      }
      objc_storeStrong((id *)&v6->_audioLatencyProgressive, v14);
      v15 = (void *)IOAVVideoInterfaceCopyProperty(a4, @"AudioLatencyInterlacedMS");

      uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSNumber);
      if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0) {
        v17 = v15;
      }
      else {
        v17 = 0LL;
      }
      objc_storeStrong((id *)&v6->_audioLatencyInterlaced, v17);
      v18 = (void *)IOAVVideoInterfaceCopyProperty(a4, @"VideoLatencyProgressiveMS");

      uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSNumber);
      if ((objc_opt_isKindOfClass(v18, v19) & 1) != 0) {
        v20 = v18;
      }
      else {
        v20 = 0LL;
      }
      objc_storeStrong((id *)&v6->_videoLatencyProgressive, v20);
      v21 = (void *)IOAVVideoInterfaceCopyProperty(a4, @"VideoLatencyInterlacedMS");

      uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSNumber);
      if ((objc_opt_isKindOfClass(v21, v22) & 1) != 0) {
        v23 = v21;
      }
      else {
        v23 = 0LL;
      }
      objc_storeStrong((id *)&v6->_videoLatencyInterlaced, v23);
      v24 = (PBDisplayAttributes *)IOAVVideoInterfaceCopyDisplayAttributes(a4);
      v10 = v24;
      if (!v24)
      {

        goto LABEL_27;
      }

      v25 = (void *)objc_claimAutoreleasedReturnValue( -[PBDisplayAttributes objectForKeyedSubscript:]( v24,  "objectForKeyedSubscript:",  @"ProductAttributes"));
      v26 = v25;
      if (v25)
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKeyedSubscript:@"ProductID"]);
        v28 = (NSNumber *)[v27 copy];
        productID = v6->_productID;
        v6->_productID = v28;

        v30 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:@"ManufacturerID"]);
        v31 = (NSString *)[v30 copy];
        manufacturer = v6->_manufacturer;
        v6->_manufacturer = v31;

        v33 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:@"ProductName"]);
        v34 = (NSString *)[v33 copy];
        product = v6->_product;
        v6->_product = v34;

        v36 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:@"WeekOfManufacture"]);
        v37 = (NSNumber *)[v36 copy];
        WOM = v6->_WOM;
        v6->_WOM = v37;

        v39 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:@"YearOfManufacture"]);
        v40 = (NSNumber *)[v39 copy];
        YOM = v6->_YOM;
        v6->_YOM = v40;
      }
    }

    v10 = v6;
  }

  else
  {
    v10 = 0LL;
  }

- (NSData)displayEDID
{
  return self->_displayEDID;
}

- (NSNumber)productID
{
  return self->_productID;
}

- (NSString)manufacturer
{
  return self->_manufacturer;
}

- (NSString)product
{
  return self->_product;
}

- (NSData)physicalAddress
{
  return self->_physicalAddress;
}

- (NSNumber)WOM
{
  return self->_WOM;
}

- (NSNumber)YOM
{
  return self->_YOM;
}

- (NSNumber)audioLatencyProgressive
{
  return self->_audioLatencyProgressive;
}

- (NSNumber)audioLatencyInterlaced
{
  return self->_audioLatencyInterlaced;
}

- (NSNumber)videoLatencyProgressive
{
  return self->_videoLatencyProgressive;
}

- (NSNumber)videoLatencyInterlaced
{
  return self->_videoLatencyInterlaced;
}

- (void).cxx_destruct
{
}

@end