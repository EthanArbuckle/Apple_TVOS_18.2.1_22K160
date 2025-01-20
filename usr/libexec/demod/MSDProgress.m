@interface MSDProgress
+ (id)progressWithStage:(int)a3;
+ (id)progressWithStage:(int)a3 percent:(int64_t)a4;
- (NSString)stageDescription;
- (int64_t)percent;
- (int64_t)stage;
- (void)setPercent:(int64_t)a3;
- (void)setStage:(int64_t)a3;
@end

@implementation MSDProgress

+ (id)progressWithStage:(int)a3 percent:(int64_t)a4
{
  v6 = objc_alloc_init(&OBJC_CLASS___MSDProgress);
  v7 = v6;
  if (v6)
  {
    -[MSDProgress setStage:](v6, "setStage:", a3);
    -[MSDProgress setPercent:](v7, "setPercent:", a4);
  }

  return v7;
}

+ (id)progressWithStage:(int)a3
{
  return [a1 progressWithStage:*(void *)&a3 percent:0];
}

- (NSString)stageDescription
{
  int64_t v2 = -[MSDProgress stage](self, "stage");
  result = (NSString *)@"Rebooting to turn off snapshot";
  switch(v2)
  {
    case 0LL:
      return result;
    case 1LL:
      result = (NSString *)@"Enrolling with server";
      break;
    case 2LL:
      result = (NSString *)@"Downloading manifest";
      break;
    case 3LL:
      result = (NSString *)@"Updating general configuration";
      break;
    case 4LL:
      result = (NSString *)@"Updating apps";
      break;
    case 5LL:
      result = (NSString *)@"Updating app data";
      break;
    case 6LL:
      result = (NSString *)@"Rebooting to install content";
      break;
    case 7LL:
      result = (NSString *)@"Preparing for snapshot";
      break;
    case 8LL:
      result = (NSString *)@"Rebooting to turn on snapshot";
      break;
    case 9LL:
      result = (NSString *)@"Rebooting to reset content";
      break;
    case 10LL:
      result = (NSString *)@"Will start content update";
      break;
    case 11LL:
      result = (NSString *)@"Scanning existing general configuration";
      break;
    case 12LL:
      result = (NSString *)@"Downloading media library";
      break;
    case 13LL:
      result = (NSString *)@"Downloading preferences data";
      break;
    case 14LL:
      result = (NSString *)@"Migrating data";
      break;
    case 15LL:
      result = (NSString *)@"Migrating app data";
      break;
    case 16LL:
      result = (NSString *)@"Waiting at setup";
      break;
    case 17LL:
      result = (NSString *)@"Pricing app is updating its content";
      break;
    case 18LL:
      result = (NSString *)@"Downloading iOS update";
      break;
    case 19LL:
      result = (NSString *)@"Installing iOS update";
      break;
    case 20LL:
      result = (NSString *)@"Setting up accounts";
      break;
    case 21LL:
      result = (NSString *)@"Prepare to install apps";
      break;
    case 22LL:
      result = (NSString *)@"Updating demo content";
      break;
    case 23LL:
      result = (NSString *)@"Scanning iOS update";
      break;
    case 24LL:
      result = (NSString *)@"Waiting for demo bundle";
      break;
    case 25LL:
      goto LABEL_5;
    case 26LL:
      result = (NSString *)@"Rebooting to prepare demo";
      break;
    case 27LL:
      result = (NSString *)@"Rebooting device";
      break;
    default:
      if (v2 == 100) {
        result = (NSString *)@"Operation completed";
      }
      else {
LABEL_5:
      }
        result = (NSString *)@"Other operations";
      break;
  }

  return result;
}

- (int64_t)stage
{
  return self->_stage;
}

- (void)setStage:(int64_t)a3
{
  self->_stage = a3;
}

- (int64_t)percent
{
  return self->_percent;
}

- (void)setPercent:(int64_t)a3
{
  self->_percent = a3;
}

@end