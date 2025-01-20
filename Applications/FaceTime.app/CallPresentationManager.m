@interface CallPresentationManager
- (void)activeCallViewControllerDidBackground:(id)a3;
- (void)activeCallViewControllerDidEndPictureInPicture:(id)a3;
- (void)activeCallViewControllerDidEndPresentation:(id)a3;
- (void)activeCallViewControllerDidForeground:(id)a3;
- (void)activeCallViewControllerDidStartPictureInPicture:(id)a3;
- (void)activeCallViewControllerDidStartPresentation:(id)a3;
- (void)screenSharingViewControllerDidEndPresentation:(id)a3;
- (void)screenSharingViewControllerDidStartPresentation:(id)a3;
- (void)splitViewCallViewControllerDidEndPresentation:(id)a3;
- (void)splitViewCallViewControllerDidStartPresentation:(id)a3;
@end

@implementation CallPresentationManager

- (void)activeCallViewControllerDidStartPresentation:(id)a3
{
}

- (void)activeCallViewControllerDidStartPictureInPicture:(id)a3
{
}

- (void)activeCallViewControllerDidEndPictureInPicture:(id)a3
{
}

- (void)activeCallViewControllerDidBackground:(id)a3
{
}

- (void)activeCallViewControllerDidForeground:(id)a3
{
}

- (void)activeCallViewControllerDidEndPresentation:(id)a3
{
}

- (void)splitViewCallViewControllerDidStartPresentation:(id)a3
{
}

- (void)splitViewCallViewControllerDidEndPresentation:(id)a3
{
}

- (void)screenSharingViewControllerDidStartPresentation:(id)a3
{
}

- (void)screenSharingViewControllerDidEndPresentation:(id)a3
{
}

@end