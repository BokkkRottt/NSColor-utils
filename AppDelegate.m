
#import "AppDelegate.h"
#import "NSColor+RainbowCrayons.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@property NSMutableDictionary *colors;
@property (weak) IBOutlet DFColorWell *colorWell;
@property (weak) IBOutlet NSTextField *colorInformationLabel;

@end

@implementation AppDelegate

#pragma mark - Make colours

- (void) _generateColors {
    
    _colors = [NSMutableDictionary new];
    _colors[@"(0,0)"] = [NSColor almondCrayolaColor];
    _colors[@"(0,1)"] = [NSColor antiqueBrassCrayolaColor];
    _colors[@"(0,2)"] = [NSColor apricotCrayolaColor];
    _colors[@"(0,3)"] = [NSColor aquamarineCrayolaColor];
    _colors[@"(0,4)"] = [NSColor asparagusCrayolaColor];
    
    _colors[@"(1,0)"] = [NSColor atomicTangerineCrayolaColor];
    _colors[@"(1,1)"] = [NSColor bananaManiaCrayolaColor];
    _colors[@"(1,2)"] = [NSColor beaverCrayolaColor];
    _colors[@"(1,3)"] = [NSColor bittersweetCrayolaColor];
    _colors[@"(1,4)"] = [NSColor blizzardBlueCrayolaColor];
    
    _colors[@"(2,0)"] = [NSColor blueCrayolaColor];
    _colors[@"(2,1)"] = [NSColor blueBellCrayolaColor];
    _colors[@"(2,2)"] = [NSColor blueGreenCrayolaColor];
    _colors[@"(2,3)"] = [NSColor blueVioletCrayolaColor];
    _colors[@"(2,4)"] = [NSColor blushCrayolaColor];
    
    _colors[@"(3,0)"] = [NSColor brickRedCrayolaColor];
    _colors[@"(3,1)"] = [NSColor brilliantRoseCrayolaColor];
    _colors[@"(3,2)"] = [NSColor brownCrayolaColor];
    _colors[@"(3,3)"] = [NSColor burntOrangeCrayolaColor];
    _colors[@"(3,4)"] = [NSColor burntSiennaCrayolaColor];
    
    _colors[@"(4,0)"] = [NSColor cadetBlueCrayolaColor];
    _colors[@"(4,1)"] = [NSColor canaryCrayolaColor];
    _colors[@"(4,2)"] = [NSColor caribbeanGreenCrayolaColor];
    _colors[@"(4,3)"] = [NSColor carnationPinkCrayolaColor];
    _colors[@"(4,4)"] = [NSColor ceriseCrayolaColor];
    
    _colors[@"(5,0)"] = [NSColor ceruleanCrayolaColor];
    _colors[@"(5,1)"] = [NSColor chestnutCrayolaColor];
    _colors[@"(5,2)"] = [NSColor copperCrayolaAlternateColor];
    _colors[@"(5,3)"] = [NSColor copperCrayolaColor];
    _colors[@"(5,4)"] = [NSColor cornflowerBlueCrayolaColor];
    
}

#pragma mark - App Delegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    [self _generateColors];
    self.colorWell.delegate = self;
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

#pragma Color well target/action


- (IBAction)colorWellAction:(id)sender {
//    NSLog(@"%s", __PRETTY_FUNCTION__);
    DFColorWell *colorWell = (DFColorWell*)sender;
    if (colorWell.color) {
        NSColor *rgbColor = [colorWell.color colorUsingColorSpaceName:NSCalibratedRGBColorSpace];
        NSString *info = [NSString stringWithFormat:@"R:%.3g, G:%.3g, B:%.3g",
                          rgbColor.redComponent,
                          rgbColor.greenComponent,
                          rgbColor.redComponent];
        self.colorInformationLabel.stringValue = info;
    }
    
}

#pragma mark - Delegate methods for the color well

- (NSUInteger) numberOfColumnsInColorWell:(DFColorWell *)colorWell {
    return 6;
}

- (NSUInteger) numberOfRowsInColorWell:(DFColorWell *)colorWell {
    return 5;
}

- (NSColor*) colorWell:(DFColorWell *)colorWell colorAtColumn:(NSUInteger)column row:(NSUInteger)row {
    NSString *key = [NSString stringWithFormat:@"(%lu,%lu)", (unsigned long)column,(unsigned long)row];
    NSColor *color = _colors[key];
    return color;
}

@end
