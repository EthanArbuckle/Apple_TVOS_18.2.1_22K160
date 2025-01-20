@interface VOTBrailleTerminalNameSearchOutputManager
- (VOTBrailleTerminalNameSearchOutputManager)initWithItemSource:(id)a3 filter:(id)a4;
- (unint64_t)selectCurrentOutput;
- (void)activate;
- (void)deactivate;
- (void)itemSource:(id)a3 didFilter:(id)a4 didSwitchFocus:(id)a5;
- (void)moveToFirstOutput;
- (void)moveToLastOutput;
- (void)moveToNextOutput;
- (void)moveToPreviousOutput;
@end

@implementation VOTBrailleTerminalNameSearchOutputManager

- (VOTBrailleTerminalNameSearchOutputManager)initWithItemSource:(id)a3 filter:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___VOTBrailleTerminalNameSearchOutputManager;
  v8 = -[VOTBrailleTerminalNameSearchOutputManager init](&v14, "init");
  v9 = v8;
  if (v8)
  {
    v8->_active = 0;
    v10 = -[VOTNameSearcher initWithDelegate:itemSource:filter:]( objc_alloc(&OBJC_CLASS___VOTNameSearcher),  "initWithDelegate:itemSource:filter:",  v8,  v6,  v7);
    nameSearcher = v9->_nameSearcher;
    v9->_nameSearcher = v10;

    v9->_noMatch = 0;
    v12 = v9;
  }

  return v9;
}

- (void)activate
{
  self->_active = 1;
  -[VOTNameSearcher updateMatchingItems](self->_nameSearcher, "updateMatchingItems");
}

- (void)moveToPreviousOutput
{
}

- (void)moveToNextOutput
{
}

- (void)moveToFirstOutput
{
}

- (void)moveToLastOutput
{
}

- (unint64_t)selectCurrentOutput
{
  return 0LL;
}

- (void)deactivate
{
  self->_active = 0;
}

- (void)itemSource:(id)a3 didFilter:(id)a4 didSwitchFocus:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  if (self->_active)
  {
    if (v8 && ![v8 integerValue])
    {
      self->_noMatch = 1;
      if (v9) {
        goto LABEL_5;
      }
    }

    else if (v9)
    {
LABEL_5:
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[VOTBrailleManager manager](&OBJC_CLASS___VOTBrailleManager, "manager"));
      [v10 refreshBrailleForTerminalOutput:v9];
LABEL_9:

      goto LABEL_10;
    }

    if (self->_noMatch)
    {
      id v11 = sub_10004A988(off_1001AC148, @"braille.terminal.nomatch", @"No match");
      v10 = (void *)objc_claimAutoreleasedReturnValue(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[VOTBrailleManager manager](&OBJC_CLASS___VOTBrailleManager, "manager"));
      [v12 refreshBrailleForTerminalOutput:v10];

      goto LABEL_9;
    }
  }

- (void).cxx_destruct
{
}

@end