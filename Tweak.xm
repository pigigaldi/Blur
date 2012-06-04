#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <QuartzCore/CAFilter.h>

@interface SBUIController
+ (id)sharedInstance;
- (id)contentView;
@end

%hook SpringBoard
- (void)applicationDidFinishLaunching:(id)arg1
{
	%orig;
	
	SBUIController *sbuic = (SBUIController*)[%c(SBUIController) sharedInstance];
	UIView *contentView = [sbuic contentView];
	
	static NSArray *filters;
	if (!filters) {
		CAFilter *filter = [CAFilter filterWithType:@"gaussianBlur"];
		[filter setValue:[NSNumber numberWithFloat:5.0f] forKey:@"inputRadius"];
		filters = [[NSArray alloc] initWithObjects:filter, nil];
	}
	CALayer *layer = contentView.layer;
	layer.filters = filters;
	layer.shouldRasterize = YES;
}
%end
