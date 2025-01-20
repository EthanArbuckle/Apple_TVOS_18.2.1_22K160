@interface BKTouchPadInfo
- (BKHIDEventDispatcher)eventDispatcher;
- (BKHIDEventSenderInfo)senderInfo;
- (BKSHIDEventSenderDescriptor)overrideSenderDescriptor;
- (BKTouchPadInfo)initWithService:(id)a3;
- (CGSize)digitizerSurfaceDimensions;
- (NSSet)currentDestinations;
- (float)maxForce;
- (id)description;
- (unsigned)pathIndexInRangeMask;
- (unsigned)pathIndexTouchingMask;
- (void)resetForCancel;
- (void)setCurrentDestinations:(id)a3;
- (void)setDigitizerSurfaceDimensions:(CGSize)a3;
- (void)setEventDispatcher:(id)a3;
- (void)setMaxForce:(float)a3;
- (void)setOverrideSenderDescriptor:(id)a3;
- (void)setPathIndexInRangeMask:(unsigned int)a3;
- (void)setPathIndexTouchingMask:(unsigned int)a3;
- (void)setSenderInfo:(id)a3;
@end

@implementation BKTouchPadInfo

- (BKTouchPadInfo)initWithService:(id)a3
{
  id v5 = a3;
  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS___BKTouchPadInfo;
  v6 = -[BKTouchPadInfo init](&v32, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_senderInfo, a3);
    id v9 = objc_msgSend( v5,  "propertyOfClass:forKey:",  objc_opt_class(NSDictionary, v8),  @"SurfaceDimensions");
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v12 = v10;
    if (v10)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"Width"]);
      uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSNumber, v14);
      id v16 = v13;
      v17 = v16;
      if (v15)
      {
        if ((objc_opt_isKindOfClass(v16, v15) & 1) != 0) {
          v18 = v17;
        }
        else {
          v18 = 0LL;
        }
      }

      else
      {
        v18 = 0LL;
      }

      id v19 = v18;

      v20 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"Height"]);
      uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSNumber, v21);
      id v23 = v20;
      v24 = v23;
      if (v22)
      {
        if ((objc_opt_isKindOfClass(v23, v22) & 1) != 0) {
          v25 = v24;
        }
        else {
          v25 = 0LL;
        }
      }

      else
      {
        v25 = 0LL;
      }

      id v26 = v25;

      v7->_digitizerSurfaceDimensions.width = (double)(uint64_t)[v19 integerValue] * 0.0000152587891;
      id v27 = [v26 integerValue];

      v7->_digitizerSurfaceDimensions.height = (double)(uint64_t)v27 * 0.0000152587891;
    }

    id v28 = objc_msgSend( v5,  "propertyOfClass:forKey:",  objc_opt_class(NSNumber, v11),  @"AccurateMaxDigitizerPressureValue");
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    [v29 floatValue];
    v7->_maxForce = v30;
  }

  return v7;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  id v4 = [v3 appendInteger:self->_pathIndexInRangeMask withName:@"pathIndexInRangeMask"];
  id v5 = [v3 appendInteger:self->_pathIndexTouchingMask withName:@"pathIndexTouchingMask"];
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%g",  self->_maxForce));
  [v3 appendString:v6 withName:@"maxForce"];

  id v7 = [v3 appendObject:self->_currentDestinations withName:@"currentDestinations"];
  id v8 = [v3 appendObject:self->_senderInfo withName:@"senderInfo"];
  id v9 =  [v3 appendObject:self->_overrideSenderDescriptor withName:@"overrideSenderDescriptor" skipIfNil:1];
  id v10 = [v3 appendObject:self->_eventDispatcher withName:@"dispatcher"];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);

  return v11;
}

- (void)resetForCancel
{
  currentDestinations = self->_currentDestinations;
  self->_currentDestinations = 0LL;

  eventDispatcher = self->_eventDispatcher;
  self->_eventDispatcher = 0LL;

  *(void *)&self->_pathIndexInRangeMask = 0LL;
}

- (BKHIDEventSenderInfo)senderInfo
{
  return self->_senderInfo;
}

- (void)setSenderInfo:(id)a3
{
}

- (BKSHIDEventSenderDescriptor)overrideSenderDescriptor
{
  return self->_overrideSenderDescriptor;
}

- (void)setOverrideSenderDescriptor:(id)a3
{
}

- (BKHIDEventDispatcher)eventDispatcher
{
  return self->_eventDispatcher;
}

- (void)setEventDispatcher:(id)a3
{
}

- (NSSet)currentDestinations
{
  return self->_currentDestinations;
}

- (void)setCurrentDestinations:(id)a3
{
}

- (unsigned)pathIndexInRangeMask
{
  return self->_pathIndexInRangeMask;
}

- (void)setPathIndexInRangeMask:(unsigned int)a3
{
  self->_pathIndexInRangeMask = a3;
}

- (unsigned)pathIndexTouchingMask
{
  return self->_pathIndexTouchingMask;
}

- (void)setPathIndexTouchingMask:(unsigned int)a3
{
  self->_pathIndexTouchingMask = a3;
}

- (float)maxForce
{
  return self->_maxForce;
}

- (void)setMaxForce:(float)a3
{
  self->_maxForce = a3;
}

- (CGSize)digitizerSurfaceDimensions
{
  double width = self->_digitizerSurfaceDimensions.width;
  double height = self->_digitizerSurfaceDimensions.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setDigitizerSurfaceDimensions:(CGSize)a3
{
  self->_digitizerSurfaceDimensions = a3;
}

- (void).cxx_destruct
{
}

@end