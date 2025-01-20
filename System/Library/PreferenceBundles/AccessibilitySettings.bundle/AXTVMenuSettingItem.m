@interface AXTVMenuSettingItem
+ (id)tripleClickItemWithTitle:(id)a3 description:(id)a4 representedObject:(id)a5 keyPath:(id)a6 option:(unint64_t)a7 updateBlock:(id)a8;
- (unint64_t)option;
- (void)setOption:(unint64_t)a3;
@end

@implementation AXTVMenuSettingItem

+ (id)tripleClickItemWithTitle:(id)a3 description:(id)a4 representedObject:(id)a5 keyPath:(id)a6 option:(unint64_t)a7 updateBlock:(id)a8
{
  v17.receiver = a1;
  v17.super_class = (Class)&OBJC_METACLASS___AXTVMenuSettingItem;
  id v13 = a8;
  id v14 = objc_msgSendSuper2( &v17,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  a3,  a4,  a5,  a6,  0,  0);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  objc_msgSend(v15, "setOption:", a7, v17.receiver, v17.super_class);
  [v15 setEnabledInStoreDemoMode:1];
  [v15 setUpdateBlock:v13];

  return v15;
}

- (unint64_t)option
{
  return self->_option;
}

- (void)setOption:(unint64_t)a3
{
  self->_option = a3;
}

@end