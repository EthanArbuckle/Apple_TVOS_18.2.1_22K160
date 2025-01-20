@interface MSDUnEnrollRequest
- (BOOL)obliterate;
- (MSDUnEnrollRequest)init;
- (id)getPostData;
- (void)setObliterate:(BOOL)a3;
@end

@implementation MSDUnEnrollRequest

- (MSDUnEnrollRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MSDUnEnrollRequest;
  v2 = -[MSDUnEnrollRequest init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    -[MSDUnEnrollRequest setObliterate:](v2, "setObliterate:", 0LL);
    v4 = v3;
  }

  return v3;
}

- (id)getPostData
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[MSDUnEnrollRequest obliterate](self, "obliterate")));
  v8[0] = @"UniqueDeviceID";
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCommandServerRequest deviceUDID](self, "deviceUDID"));
  v8[1] = @"ObliterateDevice";
  v9[0] = v4;
  v9[1] = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v9,  v8,  2LL));

  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v5 convertToNSData]);
  return v6;
}

- (BOOL)obliterate
{
  return self->_obliterate;
}

- (void)setObliterate:(BOOL)a3
{
  self->_obliterate = a3;
}

@end