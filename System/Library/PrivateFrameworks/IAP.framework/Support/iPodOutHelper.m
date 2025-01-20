@interface iPodOutHelper
- (iPodOutHelper)init;
- (void)applicationStateChanged:(id)a3;
- (void)dealloc;
@end

@implementation iPodOutHelper

- (iPodOutHelper)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___iPodOutHelper;
  v2 = -[iPodOutHelper init](&v4, "init");
  if (v2)
  {
    dword_10011C7F8 = 0;
    [(id)qword_10011BAC8 setDelegate:v2];
    [(id)qword_10011BAC8 startObserving];
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___iPodOutHelper;
  -[iPodOutHelper dealloc](&v3, "dealloc");
}

- (void)applicationStateChanged:(id)a3
{
  if (!objc_msgSend( objc_msgSend(a3, "objectForKey:", BKSApplicationStateDisplayIDKey),  "caseInsensitiveCompare:",  @"com.apple.iphoneos.iPodOut"))
  {
    unsigned int v4 = objc_msgSend(objc_msgSend(a3, "objectForKey:", BKSApplicationStateKey), "unsignedIntValue");
    if (v4 != dword_10011C7F8)
    {
      dword_10011C7F8 = v4;
      if (qword_10011BAD8 != -1) {
        dispatch_once(&qword_10011BAD8, &stru_100101B58);
      }
      if (!qword_10011BAD0 || (qword_10011BAD0 & 7) != 0) {
        __break(0x5516u);
      }
      else {
        sub_10000B11C(qword_10011BAD0, dword_10011C7F8 > 1);
      }
    }
  }

@end