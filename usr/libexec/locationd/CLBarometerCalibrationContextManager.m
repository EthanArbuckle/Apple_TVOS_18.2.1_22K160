@interface CLBarometerCalibrationContextManager
- (CLBarometerCalibrationContextManager)initWithUniverse:(id)a3 delegate:(id)a4 withBuffer:(void *)a5 withSourceAggregator:(id)a6;
- (CLBarometerCalibrationTrack)fTrack;
- (void)dealloc;
- (void)setFTrack:(id)a3;
@end

@implementation CLBarometerCalibrationContextManager

- (CLBarometerCalibrationContextManager)initWithUniverse:(id)a3 delegate:(id)a4 withBuffer:(void *)a5 withSourceAggregator:(id)a6
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___CLBarometerCalibrationContextManager;
  v11 = -[CLBarometerCalibrationContextManager init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    v11->_universe = (CLIntersiloUniverse *)a3;
    v11->_delegate = (CLBarometerCalibrationContextClient *)a4;
    v11->fDataBuffers = a5;
    v11->_sourceAggregator = (CLBarometerCalibrationSourceAggregator *)a6;
    if ((objc_opt_respondsToSelector(a4, "startTrack:") & 1) == 0) {
      -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  v12,  @"CLBarometerCalibrationContextManager.mm",  137LL,  @"Expected delegate to conform to CLBarometerCalibrationContextClient");
    }
    if ((objc_opt_respondsToSelector(v12->_delegate, "stopTrack:") & 1) == 0) {
      -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  v12,  @"CLBarometerCalibrationContextManager.mm",  138LL,  @"Expected delegate to conform to CLBarometerCalibrationContextClient");
    }
  }

  return v12;
}

- (void)dealloc
{
  self->_sourceAggregator = 0LL;
  self->_universe = 0LL;
  self->_delegate = 0LL;
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___CLBarometerCalibrationContextManager;
  -[CLBarometerCalibrationContextManager dealloc](&v2, "dealloc");
}

- (CLBarometerCalibrationTrack)fTrack
{
  return self->_fTrack;
}

- (void)setFTrack:(id)a3
{
}

@end