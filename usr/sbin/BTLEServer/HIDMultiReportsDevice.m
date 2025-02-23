@interface HIDMultiReportsDevice
- (int)getReport:(char *)a3 reportLength:(int64_t *)a4 reportID:(unsigned __int8)a5 reportType:(int)a6;
- (int)setReport:(char *)a3 reportLength:(int64_t)a4 reportID:(unsigned __int8)a5 reportType:(int)a6;
- (void)handleInputReportData:(id)a3 reportID:(unsigned __int8)a4 timestamp:(unint64_t)a5;
@end

@implementation HIDMultiReportsDevice

- (void)handleInputReportData:(id)a3 reportID:(unsigned __int8)a4 timestamp:(unint64_t)a5
{
  id v8 = a3;
  id v9 = [v8 length];
  v10 = (unsigned __int8 *)&v11 - (((unint64_t)v9 + 16) & 0xFFFFFFFFFFFFFFF0LL);
  bzero(v10, (size_t)v9 + 1);
  unsigned __int8 *v10 = a4;
  [v8 getBytes:v10 + 1 length:v9];

  IOHIDUserDeviceHandleReportWithTimeStamp(-[HIDGenericDevice device](self, "device"), a5, v10, (CFIndex)v9 + 1);
}

- (int)getReport:(char *)a3 reportLength:(int64_t *)a4 reportID:(unsigned __int8)a5 reportType:(int)a6
{
  id v13 = 0LL;
  int v9 = -[HIDBluetoothDevice getReportData:reportID:reportType:error:]( self,  "getReportData:reportID:reportType:error:",  &v13,  a5,  *(void *)&a6,  0LL);
  id v10 = v13;
  uint64_t v11 = v10;
  if (!v9)
  {
    if ((unint64_t)[v10 length] + 1 <= *a4)
    {
      *a3 = a5;
      [v11 getBytes:a3 + 1 length:*a4 - 1];
      int v9 = 0;
      *a4 = (int64_t)[v11 length] + 1;
    }

    else
    {
      int v9 = -536870181;
    }
  }

  return v9;
}

- (int)setReport:(char *)a3 reportLength:(int64_t)a4 reportID:(unsigned __int8)a5 reportType:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v7 = a5;
  int v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytesNoCopy:length:freeWhenDone:]( &OBJC_CLASS___NSData,  "dataWithBytesNoCopy:length:freeWhenDone:",  a3 + 1,  a4 - 1,  0LL));
  LODWORD(v6) = -[HIDBluetoothDevice setReportData:reportID:reportType:error:]( self,  "setReportData:reportID:reportType:error:",  v9,  v7,  v6,  0LL);

  return v6;
}

@end