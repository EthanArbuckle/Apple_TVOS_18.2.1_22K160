@interface AXSSKeyChord
+ (id)keyboardShortcutKeyChordWithInfo:(id)a3 characters:(id)a4;
+ (id)quickNavKeyChordWithInfo:(id)a3 arrowMask:(int64_t)a4;
@end

@implementation AXSSKeyChord

+ (id)keyboardShortcutKeyChordWithInfo:(id)a3 characters:(id)a4
{
  return sub_1000CC068(a4);
}

+ (id)quickNavKeyChordWithInfo:(id)a3 arrowMask:(int64_t)a4
{
  char v4 = a4;
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  if ([v5 isCommandKeyPressed])
  {
    [v6 addObject:@"⌘"];
    if ((v4 & 1) == 0)
    {
LABEL_7:
      if ((v4 & 2) == 0) {
        goto LABEL_8;
      }
      goto LABEL_14;
    }
  }

  else if ((v4 & 1) == 0)
  {
    goto LABEL_7;
  }

  [v6 addObject:@"←"];
  if ((v4 & 2) == 0)
  {
LABEL_8:
    if ((v4 & 4) == 0) {
      goto LABEL_9;
    }
LABEL_15:
    [v6 addObject:@"↑"];
    if ((v4 & 8) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }

@end