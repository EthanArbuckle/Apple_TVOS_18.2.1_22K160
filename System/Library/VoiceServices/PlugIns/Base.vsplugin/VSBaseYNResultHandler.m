@interface VSBaseYNResultHandler
- (id)actionForRecognitionResult:(id)a3;
@end

@implementation VSBaseYNResultHandler

- (id)actionForRecognitionResult:(id)a3
{
  id v4 = [a3 recognitionAction];
  id v5 = [a3 elementCount];
  id v13 = 0LL;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___VSRecognitionConfirmAction);
  v7 = 0LL;
  if ((objc_opt_isKindOfClass(v4, v6) & 1) == 0) {
    id v4 = 0LL;
  }
  if (v4) {
    BOOL v8 = (uint64_t)v5 < 1;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
    uint64_t v9 = 1LL;
    while (1)
    {
      [a3 getElementClassIdentifier:&v13 value:0 atIndex:v9 - 1];
      id v10 = [v13 isEqualToString:@"yes"];
      if ((_DWORD)v10) {
        break;
      }
      if ([v13 isEqualToString:@"no"])
      {
        id v11 = [v4 deniedAction];
        goto LABEL_12;
      }

      v7 = 0LL;
LABEL_14:
      if (v9 < (uint64_t)v5)
      {
        ++v9;
        if (!v7) {
          continue;
        }
      }

      return v7;
    }

    id v11 = [v4 confirmedAction];
LABEL_12:
    v7 = v11;
    [v4 _setConfirmed:v10];
    goto LABEL_14;
  }

  return v7;
}

@end