@interface BKKeyboardInfo
- (NSString)description;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)dealloc;
@end

@implementation BKKeyboardInfo

- (void)dealloc
{
  gsKeyboard = self->_gsKeyboard;
  if (gsKeyboard) {
    GSKeyboardRelease(gsKeyboard, a2);
  }
  v4.receiver = self;
  v4.super_class = [BKKeyboardInfo class];
  [v4 dealloc];
}

- (NSString)description
{
  return [BSDescriptionStream descriptionForRootObject:self];
}

- (void)appendDescriptionToFormatter:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100052784;
  v5[3] = &unk_1000B8030;
  id v6 = a3;
  v7 = self;
  id v4 = v6;
  [v4 appendProem:self block:v5];
}

- (void).cxx_destruct
{
}

@end