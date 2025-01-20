@interface TVSSTipManager
- (UIView)sourceView;
- (UIViewController)presentingViewController;
- (_TtC17TVSystemUIService14TVSSTipManager)init;
- (unint64_t)permittedArrowDirections;
- (void)setPermittedArrowDirections:(unint64_t)a3;
- (void)setPresentingViewController:(id)a3;
- (void)setSourceView:(id)a3;
- (void)startObserving;
- (void)stopObserving;
@end

@implementation TVSSTipManager

- (UIViewController)presentingViewController
{
  v2 = self;
  id v5 = sub_10013FAFC();

  return (UIViewController *)v5;
}

- (void)setPresentingViewController:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10013FBAC(a3);
}

- (UIView)sourceView
{
  v2 = self;
  id v5 = sub_10013FCFC();

  return (UIView *)v5;
}

- (void)setSourceView:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10013FDAC(a3);
}

- (unint64_t)permittedArrowDirections
{
  v2 = self;
  unint64_t v5 = sub_10013FEFC();

  return v5;
}

- (void)setPermittedArrowDirections:(unint64_t)a3
{
  v3 = self;
  sub_10013FFA0(a3);
}

- (void)startObserving
{
  v2 = self;
  sub_100140664();
}

- (void)stopObserving
{
  v2 = self;
  sub_100141440();
}

- (_TtC17TVSystemUIService14TVSSTipManager)init
{
  return (_TtC17TVSystemUIService14TVSSTipManager *)sub_100142A78();
}

- (void).cxx_destruct
{
  sub_100144324((id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17TVSystemUIService14TVSSTipManager_presentingViewController));
  sub_100144254((id *)((char *)&self->super.isa + OBJC_IVAR____TtC17TVSystemUIService14TVSSTipManager_sourceView));
  sub_10014411C((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17TVSystemUIService14TVSSTipManager_observer));
  sub_1001442D0((id *)((char *)&self->super.isa + OBJC_IVAR____TtC17TVSystemUIService14TVSSTipManager_tipViewController));
}

@end