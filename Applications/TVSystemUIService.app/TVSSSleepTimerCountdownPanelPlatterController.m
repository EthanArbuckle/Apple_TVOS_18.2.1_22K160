@interface TVSSSleepTimerCountdownPanelPlatterController
- (PBSScheduledSleep)scheduledSleep;
- (TVSSSleepTimerController)sleepTimerController;
- (TVSSSleepTimerCountdownPanelPlatterController)initWithScheduledSleep:(id)a3 sleepTimerController:(id)a4;
- (void)rendererWasSelected:(id)a3 context:(id)a4;
- (void)setScheduledSleep:(id)a3;
- (void)setSleepTimerController:(id)a3;
@end

@implementation TVSSSleepTimerCountdownPanelPlatterController

- (TVSSSleepTimerCountdownPanelPlatterController)initWithScheduledSleep:(id)a3 sleepTimerController:(id)a4
{
  v37 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v35 = 0LL;
  objc_storeStrong(&v35, a4);
  id v19 = TVSSLocString(@"TVSSSleepTimerPanelTitle");
  v18 = +[TVSPContent contentWithTitle:](&OBJC_CLASS___TVSPContent, "contentWithTitle:");
  v17 =  +[TVSPRenderer rendererWithIdentifier:format:content:]( &OBJC_CLASS___TVSPRenderer,  "rendererWithIdentifier:format:content:");
  v39[0] = v17;
  v16 =  +[TVSPRenderer rendererWithIdentifier:format:content:]( &OBJC_CLASS___TVSPRenderer,  "rendererWithIdentifier:format:content:");
  v39[1] = v16;
  v15 =  +[CountdownRenderer rendererWithIdentifier:content:]( &OBJC_CLASS___CountdownRenderer,  "rendererWithIdentifier:content:");
  v39[2] = v15;
  id v14 = TVSSLocString(@"TVSSSleepTimerCancelTitle");
  v13 = +[TVSPContent contentWithTitle:image:](&OBJC_CLASS___TVSPContent, "contentWithTitle:image:");
  v12 =  +[TVSPRenderer rendererWithIdentifier:format:content:]( &OBJC_CLASS___TVSPRenderer,  "rendererWithIdentifier:format:content:");
  v39[3] = v12;
  id v34 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v39, 4LL);

  v27 = +[TVSPRow rowWithIdentifier:](&OBJC_CLASS___TVSPRow, "rowWithIdentifier:", @"title");
  v38[0] = v27;
  +[TVSPConstants titleVerticalPadding](&OBJC_CLASS___TVSPConstants, "titleVerticalPadding");
  id v26 = +[TVSPRow spacerWithHeight:](&OBJC_CLASS___TVSPRow, "spacerWithHeight:");
  v38[1] = v26;
  id v25 = +[TVSPRow separatorWithIdentifier:](&OBJC_CLASS___TVSPRow, "separatorWithIdentifier:", @"separator");
  v38[2] = v25;
  id v24 = +[TVSPRow spacerWithHeight:](&OBJC_CLASS___TVSPRow, "spacerWithHeight:");
  v38[3] = v24;
  v23 =  +[TVSPRow rowWithIdentifier:height:]( &OBJC_CLASS___TVSPRow,  "rowWithIdentifier:height:",  @"countdown",  392.0);
  v38[4] = v23;
  id v22 = +[TVSPRow spacerWithHeight:](&OBJC_CLASS___TVSPRow, "spacerWithHeight:", 30.0);
  v38[5] = v22;
  +[TVSPConstants shortRowHeight](&OBJC_CLASS___TVSPConstants, "shortRowHeight");
  v21 = +[TVSPRow rowWithIdentifier:height:](&OBJC_CLASS___TVSPRow, "rowWithIdentifier:height:", @"cancel");
  v38[6] = v21;
  v20 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v38, 7LL);
  id v33 = +[TVSPLayout layoutWithRows:sizeProviders:](&OBJC_CLASS___TVSPLayout, "layoutWithRows:sizeProviders:");

  +[TVSPConstants defaultTitleLayoutContentInsets](&OBJC_CLASS___TVSPConstants, "defaultTitleLayoutContentInsets");
  *(double *)&__int128 v31 = v4;
  *((double *)&v31 + 1) = v5;
  *(double *)&__int128 v32 = v6;
  *((double *)&v32 + 1) = v7;
  __int128 v29 = v31;
  __int128 v30 = v32;
  objc_msgSend(v33, "setContentInsets:", v4, v5, v6, v7);
  v8 = v37;
  v37 = 0LL;
  v28.receiver = v8;
  v28.super_class = (Class)&OBJC_CLASS___TVSSSleepTimerCountdownPanelPlatterController;
  v37 = -[TVSSSleepTimerCountdownPanelPlatterController initWithIdentifier:layout:renderers:]( &v28,  "initWithIdentifier:layout:renderers:",  @"SleepTimerCountdownPlatter",  v33,  v34);
  objc_storeStrong((id *)&v37, v37);
  if (v37)
  {
    -[TVSSSleepTimerCountdownPanelPlatterController setScheduledSleep:](v37, "setScheduledSleep:", location[0]);
    -[TVSSSleepTimerCountdownPanelPlatterController setSleepTimerController:](v37, "setSleepTimerController:", v35);
  }

  v10 = v37;
  objc_storeStrong(&v33, 0LL);
  objc_storeStrong(&v34, 0LL);
  objc_storeStrong(&v35, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v37, 0LL);
  return v10;
}

- (void)rendererWasSelected:(id)a3 context:(id)a4
{
  id v19 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v17 = 0LL;
  objc_storeStrong(&v17, a4);
  v16.receiver = v19;
  v16.super_class = (Class)&OBJC_CLASS___TVSSSleepTimerCountdownPanelPlatterController;
  -[TVSSSleepTimerCountdownPanelPlatterController rendererWasSelected:context:]( &v16,  "rendererWasSelected:context:",  location[0],  v17);
  id v6 = [location[0] identifier];
  unsigned __int8 v7 = [v6 isEqualToString:@"cancel"];

  if ((v7 & 1) != 0)
  {
    objc_initWeak(&from, v19);
    double v4 = -[TVSSSleepTimerCountdownPanelPlatterController sleepTimerController](v19, "sleepTimerController");
    v8 = _NSConcreteStackBlock;
    int v9 = -1073741824;
    int v10 = 0;
    v11 = sub_10008D5F0;
    v12 = &unk_1001B9450;
    objc_copyWeak(&v14, &from);
    id v13 = v17;
    -[TVSSSleepTimerController cancelScheduledSleepWithCompletion:](v4, "cancelScheduledSleepWithCompletion:", &v8);

    objc_storeStrong(&v13, 0LL);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&from);
  }

  objc_storeStrong(&v17, 0LL);
  objc_storeStrong(location, 0LL);
}

- (PBSScheduledSleep)scheduledSleep
{
  return self->_scheduledSleep;
}

- (void)setScheduledSleep:(id)a3
{
}

- (TVSSSleepTimerController)sleepTimerController
{
  return self->_sleepTimerController;
}

- (void)setSleepTimerController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end