@interface TVSSFaceTimePanelViewController
- (TVSSFaceTimePanelViewController)init;
@end

@implementation TVSSFaceTimePanelViewController

- (TVSSFaceTimePanelViewController)init
{
  id v10 = self;
  v9[1] = (id)a2;
  v9[0] = objc_alloc_init(&OBJC_CLASS___TVSSFaceTimePlatterBackingStore);
  id v5 = [v9[0] incomingCallInfo];

  if (v5)
  {
    v8 = objc_alloc_init(&OBJC_CLASS___TVSSFaceTimeIncomingCallPlatterController);
    id v2 = v10;
    id v10 = 0LL;
    id v10 = [v2 initWithPlatterController:v8];
    v11 = (TVSSFaceTimePanelViewController *)v10;
    int v7 = 1;
    objc_storeStrong((id *)&v8, 0LL);
  }

  else
  {
    v6 = -[TVSSFaceTimePlatterController initWithIdentifier:]( objc_alloc(&OBJC_CLASS___TVSSFaceTimePlatterController),  "initWithIdentifier:",  @"com.apple.faceTimePanel");
    id v3 = v10;
    id v10 = 0LL;
    id v10 = [v3 initWithPlatterController:v6];
    v11 = (TVSSFaceTimePanelViewController *)v10;
    int v7 = 1;
    objc_storeStrong((id *)&v6, 0LL);
  }

  objc_storeStrong(v9, 0LL);
  objc_storeStrong(&v10, 0LL);
  return v11;
}

@end