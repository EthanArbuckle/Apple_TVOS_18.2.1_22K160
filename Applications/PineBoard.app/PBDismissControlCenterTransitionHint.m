@interface PBDismissControlCenterTransitionHint
- (BOOL)requiresFullscreenPresentation;
- (NSString)fragmentType;
- (PBDismissControlCenterTransitionHint)init;
- (void)setRequiresFullscreenPresentation:(BOOL)a3;
@end

@implementation PBDismissControlCenterTransitionHint

- (NSString)fragmentType
{
  return (NSString *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR___PBDismissControlCenterTransitionHint_fragmentType));
}

- (BOOL)requiresFullscreenPresentation
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___PBDismissControlCenterTransitionHint_requiresFullscreenPresentation);
}

- (void)setRequiresFullscreenPresentation:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR___PBDismissControlCenterTransitionHint_requiresFullscreenPresentation) = a3;
}

- (PBDismissControlCenterTransitionHint)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PBDismissControlCenterTransitionHint_fragmentType) = (Class)@"DismissControlCenterFragment";
  *((_BYTE *)&self->super.isa + OBJC_IVAR___PBDismissControlCenterTransitionHint_requiresFullscreenPresentation) = 0;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DismissControlCenterTransitionHint((uint64_t)self, (uint64_t)a2);
  v2 = @"DismissControlCenterFragment";
  return -[PBDismissControlCenterTransitionHint init](&v4, "init");
}

- (void).cxx_destruct
{
}

@end