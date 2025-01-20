@interface CLBarometerCalibrationSource
- (CLBarometerCalibrationSource)initWithUniverse:(id)a3 delegate:(id)a4;
- (void)dealloc;
@end

@implementation CLBarometerCalibrationSource

- (CLBarometerCalibrationSource)initWithUniverse:(id)a3 delegate:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___CLBarometerCalibrationSource;
  v7 = -[CLBarometerCalibrationSource init](&v10, "init");
  v8 = v7;
  if (v7)
  {
    v7->_universe = (CLIntersiloUniverse *)a3;
    v7->_delegate = (CLBarometerCalibrationSourceClient *)a4;
    if ((objc_opt_respondsToSelector(a4, "didUpdateSource:withData:") & 1) == 0) {
      -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  v8,  @"CLBarometerCalibrationSource.mm",  22LL,  @"Expected delegate to conform to CLBarometerCalibrationSourceClient");
    }
  }

  return v8;
}

- (void)dealloc
{
  self->_universe = 0LL;
  self->_delegate = 0LL;
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___CLBarometerCalibrationSource;
  -[CLBarometerCalibrationSource dealloc](&v2, "dealloc");
}

@end