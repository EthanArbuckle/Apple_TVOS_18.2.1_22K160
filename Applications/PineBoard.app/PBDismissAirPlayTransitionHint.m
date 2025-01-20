@interface PBDismissAirPlayTransitionHint
- (BOOL)requiresFullscreenPresentation;
- (NSString)fragmentType;
- (PBDismissAirPlayTransitionHint)init;
- (void)setRequiresFullscreenPresentation:(BOOL)a3;
@end

@implementation PBDismissAirPlayTransitionHint

- (NSString)fragmentType
{
  return (NSString *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR___PBDismissAirPlayTransitionHint_fragmentType));
}

- (BOOL)requiresFullscreenPresentation
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___PBDismissAirPlayTransitionHint_requiresFullscreenPresentation);
}

- (void)setRequiresFullscreenPresentation:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR___PBDismissAirPlayTransitionHint_requiresFullscreenPresentation) = a3;
}

- (PBDismissAirPlayTransitionHint)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PBDismissAirPlayTransitionHint_fragmentType) = (Class)@"DismissAirPlay";
  *((_BYTE *)&self->super.isa + OBJC_IVAR___PBDismissAirPlayTransitionHint_requiresFullscreenPresentation) = 0;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DismissAirPlayTransitionHint((uint64_t)self, (uint64_t)a2);
  v2 = @"DismissAirPlay";
  return -[PBDismissAirPlayTransitionHint init](&v4, "init");
}

- (void).cxx_destruct
{
}

@end