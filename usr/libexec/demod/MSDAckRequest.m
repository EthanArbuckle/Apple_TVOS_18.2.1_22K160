@interface MSDAckRequest
- (BOOL)status;
- (id)getPostData;
- (void)setStatus:(BOOL)a3;
@end

@implementation MSDAckRequest

- (id)getPostData
{
  v8[0] = @"UniqueDeviceID";
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCommandServerRequest deviceUDID](self, "deviceUDID"));
  v8[1] = @"Result";
  v9[0] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[MSDAckRequest status](self, "status")));
  v9[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v9,  v8,  2LL));

  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 convertToNSData]);
  return v6;
}

- (BOOL)status
{
  return self->_status;
}

- (void)setStatus:(BOOL)a3
{
  self->_status = a3;
}

@end