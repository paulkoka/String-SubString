//
//  ViewController.m
//  String-SubString
//
//  Created by paul on 4/19/18.
//  Copyright © 2018 Paul. All rights reserved.
//

#import "ViewController.h"
#import "KPIStringSubstring.h"

typedef void(Opened)(unichar, NSMutableArray*);
typedef void(Closed)(unichar, NSMutableArray*, NSMutableArray*);
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    KPIStringSubstring* selfY= [[[KPIStringSubstring alloc] init] autorelease];
    selfY.startString = @"Prime Minister <Narendra Modi> tweeted a <link> to the speech (Human Resource Development Minister Smriti Irani) <made> in the Lok Sabha during the ((debate) on the ongoing JNU row) and the suicide of Dalit scholar Rohith Vemula at the [Hyderabad Central University].";
    
  NSLog(@"%@", selfY.output);
    
    selfY.startString = @"Lorem <(ipsum [dolor <sit] amet), consectetur adipiscing elit>. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet>. Duis sagittis ipsum. Praesent mauris. Fusce nec tellus sed augue semper porta. Mauris massa. Vestibulum lacinia arcu eget (nulla. Class aptent <taciti [sociosqu ad] litora torquent per conubia> nostra), per inceptos himenaeos.";
    
      NSLog(@"%@", selfY.output);
    NSLog(@"");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
