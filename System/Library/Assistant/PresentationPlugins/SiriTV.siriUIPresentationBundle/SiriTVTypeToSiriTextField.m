@interface SiriTVTypeToSiriTextField
- (UILabel)secondaryPlaceHolderLabel;
- (_TtC6SiriTV25SiriTVTypeToSiriTextField)init;
- (_TtC6SiriTV25SiriTVTypeToSiriTextField)initWithCoder:(id)a3;
- (_TtC6SiriTV25SiriTVTypeToSiriTextField)initWithFrame:(CGRect)a3;
- (void)setSecondaryPlaceHolderLabel:(id)a3;
@end

@implementation SiriTVTypeToSiriTextField

- (UILabel)secondaryPlaceHolderLabel
{
  v2 = self;
  sub_1B71C();
  v4 = v3;

  return (UILabel *)v4;
}

- (void)setSecondaryPlaceHolderLabel:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1B7BC((uint64_t)v4);
}

- (_TtC6SiriTV25SiriTVTypeToSiriTextField)init
{
  return (_TtC6SiriTV25SiriTVTypeToSiriTextField *)sub_1BE60();
}

- (_TtC6SiriTV25SiriTVTypeToSiriTextField)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1C5BC();
}

- (_TtC6SiriTV25SiriTVTypeToSiriTextField)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6SiriTV25SiriTVTypeToSiriTextField____lazy_storage___secondaryPlaceHolderLabel));
}

@end