@interface CLKeyboardMotionAdapter
- (void)eventUpdateForDevice:(id)a3 event:(id)a4;
- (void)inputReportForDevice:(id)a3 report:(char *)a4 length:(int64_t)a5;
- (void)monitorUpdateForDevice:(id)a3 added:(BOOL)a4;
- (void)smartCoverStateDidChange:(int64_t)a3;
@end

@implementation CLKeyboardMotionAdapter

- (void)inputReportForDevice:(id)a3 report:(char *)a4 length:(int64_t)a5
{
  if (qword_101997C30 != -1) {
    dispatch_once(&qword_101997C30, &stru_101848E40);
  }
  sub_1006A6518(qword_1019A14D0, (uint64_t)a3, (unsigned __int8 *)a4, a5);
}

- (void)monitorUpdateForDevice:(id)a3 added:(BOOL)a4
{
  BOOL v4 = a4;
  if (qword_101997C30 != -1) {
    dispatch_once(&qword_101997C30, &stru_101848E40);
  }
  sub_1006A6DA0((_BYTE *)qword_1019A14D0, (uint64_t)a3, v4);
}

- (void)eventUpdateForDevice:(id)a3 event:(id)a4
{
  if (qword_101997C30 != -1) {
    dispatch_once(&qword_101997C30, &stru_101848E40);
  }
  sub_1006A6EF0(qword_1019A14D0, (uint64_t)a4);
}

- (void)smartCoverStateDidChange:(int64_t)a3
{
  if (qword_101997C30 != -1) {
    dispatch_once(&qword_101997C30, &stru_101848E40);
  }
  sub_1006A7014(qword_1019A14D0, a3);
}

@end